#include "..\WLM_constants.inc";

params ["_showWarning"];

private _asset = uiNamespace getVariable "WLM_asset";

private _cooldown = ((_asset getVariable "BIS_WL_nextRearm") - serverTime) max 0;
private _nearbyVehicles = (_asset nearObjects ["All", WL_MAINTENANCE_RADIUS]) select { alive _x };
private _rearmVehicleIndex = _nearbyVehicles findIf {getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "transportAmmo") > 0};

if (_rearmVehicleIndex == -1) exitWith {
    playSound "AddItemFailed";
};

private _rearmSource = _nearbyVehicles # _rearmVehicleIndex;
private _amount = _rearmSource getVariable ["WLM_ammoCargo", 0];

if (_cooldown > 0 || _amount <= 0) exitWith {
    playSound "AddItemFailed";
};

private _pylonMismatch = false;

// disabled for now
if (_showWarning && _pylonMismatch) exitWith {
    private _display = findDisplay WLM_DISPLAY;

    private _confirmDialog = _display createDisplay "WLM_Modal_Dialog";
    private _confirmButtonControl = _confirmDialog displayCtrl WLM_MODAL_CONFIRM_BUTTON;
    private _cancelButtonControl = _confirmDialog displayCtrl WLM_MODAL_EXIT_BUTTON;
    _cancelButtonControl ctrlAddEventHandler ["ButtonClick", {
        (findDisplay WLM_MODAL) closeDisplay 1;
    }];
    _confirmButtonControl ctrlAddEventHandler ["ButtonClick", {
        (findDisplay WLM_MODAL) closeDisplay 1;
        [false, false] call WLM_fnc_startRearmVehicle;
    }];
};

private _massTally = 250;
private _newAmmo = _amount - _massTally;

if (_newAmmo < 0) exitWith {
    playSound "AddItemFailed";
    hint format [localize "STR_WLM_KG_AMMO_REQUIRED", _massTally];
};

_rearmSource setVariable ["WLM_ammoCargo", _newAmmo, true];

[_asset] remoteExec ["WLM_fnc_rearmVehicle", _asset];

private _rearmTime = (missionNamespace getVariable "WL2_rearmTimers") getOrDefault [typeOf _asset, 600];
_asset setVariable ["BIS_WL_nextRearm", serverTime + _rearmTime];

[toUpper localize "STR_A3_WL_popup_asset_rearmed"] spawn BIS_fnc_WL2_smoothText;