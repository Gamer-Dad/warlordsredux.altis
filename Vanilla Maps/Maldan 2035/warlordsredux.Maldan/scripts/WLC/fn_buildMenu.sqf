#include "constants.inc"

private _display = findDisplay WLC_DISPLAY;

if (isNull _display) then {
    _display = createDialog ["WLC_MenuUI", true];
};

disableSerialization;

private _side = BIS_WL_playerSide;

private _closeButton = _display displayCtrl WLC_CLOSE_BUTTON;
_closeButton ctrlAddEventHandler ["ButtonClick", {
    closeDialog 0;
}];

private _controlMap = createHashMapFromArray [
    [WLC_PRIMARY_SELECT, "Primary"],
    [WLC_SECONDARY_SELECT, "Secondary"],
    [WLC_LAUNCHER_SELECT, "Launcher"],
    [WLC_UNIFORM_SELECT, "Uniform"],
    [WLC_VEST_SELECT, "Vest"],
    [WLC_HELMET_SELECT, "Helmet"]
];

private _level = ["getLevel"] call WLC_fnc_getLevelInfo;
private _score = ["getScore"] call WLC_fnc_getLevelInfo;
private _nextLevelScore = ["getNextLevelScore"] call WLC_fnc_getLevelInfo;

private _levelDisplay = _display displayCtrl WLC_LEVEL_TEXT;
_levelDisplay ctrlSetText format ["Level %1 (%2/%3)", _level, _score, _nextLevelScore];

private _moneySign = [_side] call WL2_fnc_getMoneySign;

private _sumCost = 0;
{
    private _select = _display displayCtrl _x;
    private _type = _y;
    private _customizationList = missionNamespace getVariable [format ["WLC_%1_%2", _type, _side], createHashMap];

    lbClear _select;
    private _default = _select lbAdd "Default";
    _select lbSetData [_default, ""];
    _select lbSetValue [_default, -1];

    {
        private _class = _x;
        private _customization = _y;
        private _name = _customization getOrDefault ["name", ""];
        private _requiredLevel = _customization getOrDefault ["level", 0];

        private _cost = _customization getOrDefault ["cost", 0];
        private _displayName = if (_cost > 0) then {
            format ["%1 [%2%3]", _name, _moneySign, _cost];
            // continue;
        } else {
            _name;
        };

        private _index = _select lbAdd _displayName;
        _select lbSetData [_index, _class];
        _select lbSetValue [_index, _requiredLevel];

        private _actualClass = _customization getOrDefault ["item", _class];
        _select lbSetPicture [_index, getText (configFile >> "CfgWeapons" >> _actualClass >> "picture")];

        if (_requiredLevel > _level) then {
            _select lbSetColor [_index, [1, 0, 0, 1]];
            _select lbSetText [_index, format ["(Lvl %1) %2", _requiredLevel, _displayName]];
        };

        private _tooltip = format ["%1\nUnlock: Level %2\nCost: %3%4", _name, _requiredLevel, _moneySign, _cost];
        _select lbSetTooltip [_index, _tooltip];
    } forEach _customizationList;
    _select lbSortBy ["VALUE", false];

    _select lbSetCurSel 0;
    private _customizationData = profileNamespace getVariable [format ["WLC_%1", _type], ""];
    if (_customizationData != "") then {
        for "_index" from 0 to lbSize _select - 1 do {
            private _class = _select lbData _index;
            if (_class == _customizationData) then {
                private _customization = _customizationList getOrDefault [_class, createHashMap];
                private _requiredLevel = _customization getOrDefault ["level", 0];
                if (_requiredLevel <= _level) then {
                    _select lbSetCurSel _index;
                    private _cost = _customization getOrDefault ["cost", 0];
                    _sumCost = _sumCost + _cost;
                };
                break;
            };
        };
    };

    _select ctrlAddEventHandler ["LBSelChanged", format ["[_this # 0, _this # 1, '%1'] spawn WLC_fnc_onSelection", _type]];

    _select ctrlShow false;
} forEach _controlMap;

private _funds = (missionNamespace getVariable "fundsDatabaseClients") getOrDefault [getPlayerUID player, 0];
private _affordColor = if (_funds >= _sumCost) then {
    "#FFFFFF";
} else {
    "#FF0000";
};
private _costDisplay = _display displayCtrl WLC_COST_TEXT;
_costDisplay ctrlSetStructuredText parseText format ["<t align='right'>Total Cost: <t color='%1'>%2%3</t></t>", _affordColor, _moneySign, _sumCost];

private _buttonMap = createHashMapFromArray [
    [WLC_PRIMARY_SELECT_BUTTON, WLC_PRIMARY_SELECT],
    [WLC_SECONDARY_SELECT_BUTTON, WLC_SECONDARY_SELECT],
    [WLC_LAUNCHER_SELECT_BUTTON, WLC_LAUNCHER_SELECT],
    [WLC_UNIFORM_SELECT_BUTTON, WLC_UNIFORM_SELECT],
    [WLC_VEST_SELECT_BUTTON, WLC_VEST_SELECT],
    [WLC_HELMET_SELECT_BUTTON, WLC_HELMET_SELECT]
];

{
    private _button = _display displayCtrl _x;
    private _select = _display displayCtrl _y;

    _button ctrlAddEventHandler ["ButtonClick", "_this spawn WLC_fnc_onButtonSelect"];
} forEach _buttonMap;

[_display displayCtrl WLC_PRIMARY_SELECT_BUTTON] spawn WLC_fnc_onButtonSelect;