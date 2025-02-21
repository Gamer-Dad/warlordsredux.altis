#include "constants.inc"
params ["_cost", "_level"];

private _display = findDisplay WLC_DISPLAY;
private _itemCostDisplay = _display displayCtrl WLC_COST_DISPLAY;
private _costDisplay = _display displayCtrl WLC_COST_TEXT;

private _moneySign = [BIS_WL_playerSide] call WL2_fnc_getMoneySign;
private _levelText = format ["Unlock: Level %1", _level];
private _costText = if (_cost > 0) then {
    format ["Cost: %1%2", _moneySign, _cost];
} else {
    "";
};

_itemCostDisplay ctrlSetStructuredText parseText format ["<t size='1.2'>%1<br/>%2</t>", _levelText, _costText];

private _sumCost = 0;
{
    private _customizationList = missionNamespace getVariable [format ["WLC_%1_%2", _x, BIS_WL_playerSide], createHashMap];
    private _customization = profileNamespace getVariable [format ["WLC_%1", _x], ""];
    private _customizationMap = _customizationList getOrDefault [_customization, createHashMap];
    private _cost = _customizationMap getOrDefault ["cost", 0];
    _sumCost = _sumCost + _cost;

    if (_x in ["Primary", "Secondary", "Launcher"]) then {
        private _customizationAmmo = profileNamespace getVariable [format ["WLC_%1_Ammo", _x], ""];
        private _loadouts = _customizationMap getOrDefault ["loadouts", createHashMap];
        private _loadout = _loadouts getOrDefault [_customizationAmmo, createHashMap];
        private _loadoutCost = _loadout getOrDefault ["cost", 0];
        _sumCost = _sumCost + _loadoutCost;
    };
} forEach ["Primary", "Secondary", "Launcher", "Uniform", "Vest", "Helmet"];

private _funds = (missionNamespace getVariable "fundsDatabaseClients") getOrDefault [getPlayerUID player, 0];
private _affordColor = if (_funds >= _sumCost) then {
    "#FFFFFF";
} else {
    "#FF0000";
};
_costDisplay ctrlSetStructuredText parseText format ["<t align='right'>Total Cost: <t color='%1'>%2%3</t></t>", _affordColor, _moneySign, _sumCost];