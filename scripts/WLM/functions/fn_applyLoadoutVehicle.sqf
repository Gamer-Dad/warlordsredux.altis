#include "..\WLM_constants.inc"

params ["_showWarning"];

private _asset = uiNamespace getVariable "WLM_asset";

private _defaultMags = _asset getVariable ["WLM_savedDefaultMags", []];
private _currentMags = magazinesAllTurrets _asset;
private _eligibleFreeRearm = true;
{
    private _defaultMag = _defaultMags # _forEachIndex;
    private _currentMag = _x;

    if (_defaultMag # 0 != _currentMag # 0) then {
        _eligibleFreeRearm = false;
    };
    if (_defaultMag # 2 != _currentMag # 2) then {
        _eligibleFreeRearm = false;
    };
} forEach _currentMags;

if (_asset call APS_fnc_getMaxAmmo > _asset getVariable ["apsAmmo", 0]) then {
    _eligibleFreeRearm = false;
};

if (_showWarning && !_eligibleFreeRearm) exitWith {
    private _display = findDisplay WLM_DISPLAY;
    private _confirmDialog = _display createDisplay "WLM_Modal_Dialog";

    private _titleControl = _confirmDialog displayCtrl WLM_MODAL_TITLE;
    _titleControl ctrlSetText (localize "STR_WLM_PYLON_APPLY_WARNING");

    private _textControl = _confirmDialog displayCtrl WLM_MODAL_TEXT;
    _textControl ctrlSetText (localize "STR_WLM_APPLY_PYLONS_AMMO_WARNING");

    private _confirmButtonControl = _confirmDialog displayCtrl WLM_MODAL_CONFIRM_BUTTON;
    private _cancelButtonContrl = _confirmDialog displayCtrl WLM_MODAL_EXIT_BUTTON;

    _confirmButtonControl ctrlSetText (localize "STR_WLM_APPLY");
    _confirmButtonControl ctrlSetTooltip (localize "STR_WLM_APPLY_SELECTED_PYLONS");

    _cancelButtonContrl ctrlSetTooltip (localize "STR_WLM_RETURN_PREVIOUS_SCREEN");

    _cancelButtonContrl ctrlAddEventHandler ["ButtonClick", {
        (findDisplay WLM_MODAL) closeDisplay 1;
    }];
    _confirmButtonControl ctrlAddEventHandler ["ButtonClick", {
        (findDisplay WLM_MODAL) closeDisplay 1;
        [false] call WLM_fnc_applyLoadoutVehicle;
    }];
};

private _magTurretsToRemove = [];
private _turrets = allTurrets _asset;
{
    private _turretPath = _x;
    private _magazinesTurret = _asset magazinesTurret _turretPath;
    {
        _magTurretsToRemove pushBack [_x, _turretPath];
    } forEach _magazinesTurret;
} forEach _turrets;

private _magTurretsToAdd = [];
private _magazineSelectBoxes = uiNamespace getVariable "WLM_magazineSelectBoxes";
{
    private _selectBox = _x # 0;
    private _turretPath = _x # 1;

    private _currentSelection = lbCurSel _selectBox;
    private _magazineClass = _selectBox lbData _currentSelection;

    if (_magazineClass != "EMPTY") then {
        private _ammoCount = getNumber (configFile >> "CfgMagazines" >> _magazineClass >> "count");
        _magTurretsToAdd pushBack [_magazineClass, _turretPath, _ammoCount];
    };
} forEach _magazineSelectBoxes;

[_asset, _magTurretsToRemove, _magTurretsToAdd, _eligibleFreeRearm] remoteExec ["WLM_fnc_applyVehicleServer", 2];