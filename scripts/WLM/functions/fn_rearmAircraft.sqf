#include "..\WLM_constants.inc";

params ["_showWarning"];

private _asset = uiNamespace getVariable "WLM_asset";

private _cooldown = ((_asset getVariable "BIS_WL_nextRearm") - serverTime) max 0;
private _nearbyVehicles = (_asset nearObjects ["All", WL_MAINTENANCE_RADIUS]) select { alive _x };
private _rearmVehicleIndex = _nearbyVehicles findIf {getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "transportAmmo") > 0};
private _rearmSource = _nearbyVehicles # _rearmVehicleIndex;

private _amount = _rearmSource getVariable ["WLM_ammoCargo", 0];

if (_cooldown > 0 || _amount <= 0) exitWith {
    playSound "AddItemFailed";
};

private _pylonsInfo = getAllPylonsInfo _asset;

private _display = findDisplay WLM_DISPLAY;

// determine if our desired pylons match the vehicle's pylons
private _allPylonsMatch = true;
{
    private _pylonControl = _display displayCtrl (WLM_PYLON_START + _forEachIndex);
    private _pylonUserControl = _display displayCtrl (WLM_PYLON_USER_START + _forEachIndex);

    private _desiredPylon = _pylonControl lbData (lbCurSel _pylonControl);
    private _currentPylon = _x # 3;

    private _desiredTurret = ctrlTooltip _pylonUserControl == "Control: Gunner";
    private _currentTurret = _x # 2 isEqualTo [0];

    if (_desiredPylon != _currentPylon || _desiredTurret != _currentTurret) then {
        _allPylonsMatch = false;
    };
} forEach _pylonsInfo;

if (!_allPylonsMatch && _showWarning) exitWith {
    private _confirmDialog = _display createDisplay "WLM_Modal_Dialog";
    private _confirmButtonControl = _confirmDialog displayCtrl WLM_MODAL_CONFIRM_BUTTON;
    private _cancelButtonControl = _confirmDialog displayCtrl WLM_MODAL_EXIT_BUTTON;
    _cancelButtonControl ctrlAddEventHandler ["ButtonClick", {
        (findDisplay WLM_MODAL) closeDisplay 1;
    }];
    _confirmButtonControl ctrlAddEventHandler ["ButtonClick", {
        (findDisplay WLM_MODAL) closeDisplay 1;
        [false] call WLM_fnc_rearmAircraft;
    }];
};

private _massTally = 0;
{
    private _pylonMagazine = _x # 3;
    private _pylonName = _x # 1;

    private _magConfig = configFile >> "CfgMagazines" >> _pylonMagazine;
    private _maxAmmo = (getNumber (_magConfig >> "count")) max 1;
    private _currentAmmo = _asset ammoOnPylon _pylonName;

    private _ammoMass = getNumber (_magConfig >> "mass") max 100;
    _ammoMass = _ammoMass * (_maxAmmo - _currentAmmo) / _maxAmmo;
    _massTally = _massTally + _ammoMass;
} forEach _pylonsInfo;

_massTally = _massTally min 3000;

private _newAmmo = _amount - _massTally;
if (_newAmmo < 0) exitWith {
    playSound "AddItemFailed";
    hint format [localize "STR_WLM_KG_AMMO_REQUIRED", _massTally];
};

_rearmSource setVariable ["WLM_ammoCargo", _newAmmo, true];

private _attachments = _asset getVariable ["WLM_assetAttachments", [["default"]]];

if (count _attachments > 0 && (_attachments # 0 # 0 == "default")) then {
    private _defaultAttachments = [];
    {
        _defaultAttachments pushBack [_x # 3, _x # 2];
    } forEach _pylonsInfo;
    _asset setVariable ["WLM_assetAttachments", _defaultAttachments, true];
};

[_asset, true] remoteExec ["WLM_fnc_applyPylon", _asset];

private _rearmTime = (missionNamespace getVariable "WL2_rearmTimers") getOrDefault [typeOf _asset, 600];
_asset setVariable ["BIS_WL_nextRearm", serverTime + _rearmTime];