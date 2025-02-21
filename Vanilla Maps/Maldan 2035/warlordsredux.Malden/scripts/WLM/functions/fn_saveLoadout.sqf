#include "..\WLM_constants.inc";

params ["_loadoutName"];

private _asset = uiNamespace getVariable "WLM_asset";
private _isAircraft = uiNamespace getVariable "WLM_assetIsAircraft";
private _display = findDisplay WLM_DISPLAY;

private _saveData = if (_isAircraft) then {
    private _pylonConfig = configFile >> "CfgVehicles" >> typeOf _asset >> "Components" >> "TransportPylonsComponent";
    private _pylonsInfo = configProperties [_pylonConfig >> "pylons"];

    private _attachments = [];
    {
        private _pylonControl = _display displayCtrl (WLM_PYLON_START + _forEachIndex);
        private _currentSelection = lbCurSel _pylonControl;
        private _attachment = _pylonControl lbData _currentSelection;

        private _pylonUserControl = _display displayCtrl (WLM_PYLON_USER_START + _forEachIndex);
        private _userIsPilot = ctrlTooltip _pylonUserControl == "Control: Pilot";
        private _turret = if (_userIsPilot) then {
            []
        } else {
            [0]
        };

        _attachments pushBack [_attachment, _turret];
    } forEach _pylonsInfo;

    _attachments;
} else {
    private _savedMagazines = _asset getVariable ["WLM_savedMagazines", []];
    _savedMagazines;
};

private _assetActualType = _asset getVariable ["WL2_orderedClass", typeOf _asset];
private _variableName = format ["WLM_savedLoadout_%1", _assetActualType];
private _loadoutSave = profileNamespace getVariable [_variableName, []];

if (_loadoutName == "") exitWith {
    private _confirmDialog = _display createDisplay "WLM_Modal_Dialog";

    private _titleControl = _confirmDialog displayCtrl WLM_MODAL_TITLE;
    _titleControl ctrlSetText (localize "STR_WLM_SAVE_LOADOUT");

    private _confirmTextControl = _confirmDialog displayCtrl WLM_MODAL_TEXT;
    _confirmTextControl ctrlSetText (localize "STR_WLM_ENTER_LOADOUT_NAME");

    private _loadoutInputControl = (findDisplay WLM_MODAL) displayCtrl WLM_MODAL_INPUT;
    private _defaultLoadoutName = format [localize "STR_WLM_LOADOUT_NAME", count _loadoutSave + 1];
    _loadoutInputControl ctrlSetText _defaultLoadoutName;

    _loadoutInputControl ctrlShow true;
    ctrlSetFocus _loadoutInputControl;
    _loadoutInputControl ctrlSetTextSelection [0, count _defaultLoadoutName];

    private _confirmButtonControl = _confirmDialog displayCtrl WLM_MODAL_CONFIRM_BUTTON;
    private _cancelButtonControl = _confirmDialog displayCtrl WLM_MODAL_EXIT_BUTTON;

    _confirmButtonControl ctrlSetText (localize "STR_WLM_SAVE_LOADOUT_BUTTON");
    _confirmButtonControl ctrlSetTooltip (localize "STR_WLM_SAVE_CURRENT_LOADOUT");

    _cancelButtonControl ctrlSetText (localize "STR_WLM_CANCEL");
    _cancelButtonControl ctrlSetTooltip (localize "STR_WLM_RETURN_PREVIOUS_SCREEN");

    _cancelButtonControl ctrlAddEventHandler ["ButtonClick", {
        (findDisplay WLM_MODAL) closeDisplay 1;
    }];
    _confirmButtonControl ctrlAddEventHandler ["ButtonClick", {
        (findDisplay WLM_MODAL) closeDisplay 1;
        [ctrlText WLM_MODAL_INPUT] call WLM_fnc_saveLoadout;
    }];
};

_loadoutSave pushBack [_loadoutName, _saveData];
profileNamespace setVariable [_variableName, _loadoutSave];

call WLM_fnc_constructPresetMenu;