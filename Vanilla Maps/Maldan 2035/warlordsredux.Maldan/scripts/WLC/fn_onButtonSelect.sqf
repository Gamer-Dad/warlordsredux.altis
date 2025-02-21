#include "constants.inc"

params ["_control"];

private _buttonMap = createHashMapFromArray [
    [WLC_PRIMARY_SELECT_BUTTON, WLC_PRIMARY_SELECT],
    [WLC_SECONDARY_SELECT_BUTTON, WLC_SECONDARY_SELECT],
    [WLC_LAUNCHER_SELECT_BUTTON, WLC_LAUNCHER_SELECT],
    [WLC_UNIFORM_SELECT_BUTTON, WLC_UNIFORM_SELECT],
    [WLC_VEST_SELECT_BUTTON, WLC_VEST_SELECT],
    [WLC_HELMET_SELECT_BUTTON, WLC_HELMET_SELECT]
];

private _controlMap = createHashMapFromArray [
    [WLC_PRIMARY_SELECT, "Primary"],
    [WLC_SECONDARY_SELECT, "Secondary"],
    [WLC_LAUNCHER_SELECT, "Launcher"],
    [WLC_UNIFORM_SELECT, "Uniform"],
    [WLC_VEST_SELECT, "Vest"],
    [WLC_HELMET_SELECT, "Helmet"]
];

private _display = findDisplay WLC_DISPLAY;
{
    private _buttonControl = _display displayCtrl _x;
    private _selectControl = _display displayCtrl _y;

    if (_buttonControl == _control) then {
        _buttonControl ctrlSetBackgroundColor [0, 0.5, 0.5, 0.8];
        _buttonControl ctrlSetActiveColor [0, 0.5, 0.5, 0.8];
        _selectControl ctrlShow true;

        ctrlSetFocus _selectControl;
        [_selectControl, lbCurSel _selectControl, _controlMap getOrDefault [_y, ""]] call WLC_fnc_onSelection;
    } else {
        _buttonControl ctrlSetBackgroundColor [0, 0, 0, 0.8];
        _selectControl ctrlShow false;
    };
} forEach _buttonMap;