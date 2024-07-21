params ["_showWarning"];

private _asset = uiNamespace getVariable "WLM_asset";

private _cooldown = (((_asset getVariable "BIS_WL_nextRearm") - serverTime) max 0);
private _nearbyVehicles = (_asset nearObjects ["All", 30]) select {alive _x};
private _rearmVehicleIndex = _nearbyVehicles findIf {getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "transportAmmo") > 0};
private _rearmSource = _nearbyVehicles # _rearmVehicleIndex;

private _amount = _rearmSource getVariable ["GOM_fnc_ammocargo", 0];

if (_cooldown > 0 || _amount <= 0) exitWith {
    playSound "AddItemFailed";
};

private _pylonsInfo = getAllPylonsInfo _asset;

private _DISPLAY = findDisplay 5300;
private _PYLON_IDC_START = 5501;
private _PYLON_USER_IDC_START = 5601;

// determine if our desired pylons match the vehicle's pylons
private _allPylonsMatch = true;
{
    private _pylonCtrl = _DISPLAY displayCtrl (_PYLON_IDC_START + _forEachIndex);
    private _pylonUserCtrl = _DISPLAY displayCtrl (_PYLON_USER_IDC_START + _forEachIndex);

    private _desiredPylon = _pylonCtrl lbData (lbCurSel _pylonCtrl);
    private _currentPylon = _x # 3;

    private _desiredTurret = ctrlTooltip _pylonUserCtrl == "Control: Gunner";
    private _currentTurret = _x # 2 isEqualTo [0];

    if (_desiredPylon != _currentPylon || _desiredTurret != _currentTurret) then {
        _allPylonsMatch = false;
    };
} forEach _pylonsInfo;

if (!_allPylonsMatch && _showWarning) exitWith {
    private _confirmDialog = _DISPLAY createDisplay "WLM_ConfirmationDialog";
    private _CONFIRM_BUTTON = _confirmDialog displayCtrl 5704;
    private _CANCEL_BUTTON = _confirmDialog displayCtrl 5705;
    _CANCEL_BUTTON ctrlAddEventHandler ["ButtonClick", {
        (findDisplay 5700) closeDisplay 1;
    }];
    _CONFIRM_BUTTON ctrlAddEventHandler ["ButtonClick", {
        (findDisplay 5700) closeDisplay 1;
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
    hint format ["%1 kg of ammo is required to rearm this vehicle.", _massTally];
};

_rearmSource setVariable ["GOM_fnc_ammocargo", _newAmmo, true];

{
    private _pylonMagazine = _x # 3;
    private _pylonName = _x # 1;

    private _magConfig = configFile >> "CfgMagazines" >> _pylonMagazine;
    private _maxAmmo = getNumber (_magConfig >> "count");
    if (_maxAmmo > 0) then {
        [_asset, [_pylonName, _maxAmmo]] remoteExec ["setAmmoOnPylon", _asset];
    };
} forEach _pylonsInfo;

_asset setVehicleAmmo 1;

_asset setVehicleReceiveRemoteTargets true;
_asset setVehicleReportRemoteTargets true;
_asset setVehicleReportOwnPosition true;

_rearmTime = ((missionNamespace getVariable "BIS_WL2_rearmTimers") getOrDefault [(typeOf _asset), 600]);

_asset setVariable ["BIS_WL_nextRearm", serverTime + _rearmTime]; 
playSound3D ["A3\Sounds_F\sfx\UI\vehicles\Vehicle_Rearm.wss", _asset, false, getPosASL _asset, 2, 1, 75];
[toUpper localize "STR_A3_WL_popup_asset_rearmed"] spawn BIS_fnc_WL2_smoothText;