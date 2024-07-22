params ["_showWarning"];

if (_showWarning) exitWith {
    private _confirmDialog = findDisplay 5300 createDisplay "WLM_ConfirmationDialog";

    private _TITLE = _confirmDialog displayCtrl 5702;
    _TITLE ctrlSetText "WIPE SAVE WARNING";

    private _TEXT = _confirmDialog displayCtrl 5706;
    _TEXT ctrlSetText "This will remove all saved loadouts for this aircraft. Continue?";

    private _CONFIRM_BUTTON = _confirmDialog displayCtrl 5704;
    private _CANCEL_BUTTON = _confirmDialog displayCtrl 5705;

    _CONFIRM_BUTTON ctrlSetText "Wipe";
    _CONFIRM_BUTTON ctrlSetTooltip "Wipe all saved loadouts for this aircraft.";

    _CANCEL_BUTTON ctrlSetTooltip "Return to the previous screen.";

    _CANCEL_BUTTON ctrlAddEventHandler ["ButtonClick", {
        (findDisplay 5700) closeDisplay 1;
    }];
    _CONFIRM_BUTTON ctrlAddEventHandler ["ButtonClick", {
        (findDisplay 5700) closeDisplay 1;
        [false] call WLM_fnc_wipePylonSaves;
    }];
};

private _asset = uiNamespace getVariable "WLM_asset";
private _variableName = format ["WLM_savedLoadout_%1", typeOf _asset];
profileNamespace setVariable [_variableName, []];
call WLM_fnc_constructPresetMenu;