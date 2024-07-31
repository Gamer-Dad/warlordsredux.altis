#include "..\WLM_constants.inc";

params ["_showWarning"];

if (_showWarning) exitWith {
    private _confirmDialog = findDisplay WLM_DISPLAY createDisplay "WLM_Modal_Dialog";

    private _titleControl = _confirmDialog displayCtrl WLM_MODAL_TITLE;
    _titleControl ctrlSetText (localize "STR_WLM_WIPE_SAVE_WARNING");

    private _textControl = _confirmDialog displayCtrl WLM_MODAL_TEXT;
    _textControl ctrlSetText (localize "STR_WLM_REMOVE_ALL_SAVED_LOADOUTS_WARNING");

    private _confirmButtonControl = _confirmDialog displayCtrl WLM_MODAL_CONFIRM_BUTTON;
    private _cancelButtonControl = _confirmDialog displayCtrl WLM_MODAL_EXIT_BUTTON;

    _confirmButtonControl ctrlSetText (localize "STR_WLM_WIPE");
    _confirmButtonControl ctrlSetTooltip (localize "STR_WLM_WIPE_ALL_SAVED_LOADOUTS");

    _cancelButtonControl ctrlSetTooltip (localize "STR_WLM_RETURN_PREVIOUS_SCREEN");

    _cancelButtonControl ctrlAddEventHandler ["ButtonClick", {
        (findDisplay WLM_MODAL) closeDisplay 1;
    }];
    _confirmButtonControl ctrlAddEventHandler ["ButtonClick", {
        (findDisplay WLM_MODAL) closeDisplay 1;
        [false] call WLM_fnc_wipePylonSaves;
    }];
};

private _asset = uiNamespace getVariable "WLM_asset";
private _variableName = format ["WLM_savedLoadout_%1", typeOf _asset];
profileNamespace setVariable [_variableName, []];
call WLM_fnc_constructPresetMenu;