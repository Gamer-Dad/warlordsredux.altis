#include "..\warlords_constants.inc"
params ["_endTime", "_mineDisplay", "_mineIndicator", "_mineIndicatorBackground", "_mineIndicatorText", "_mineData", "_strippedName", "_formattedName", "_mineDisplayName", "_limit", "_currentAmount", "_mineIndicatorText"];

_mineDisplay = uiNamespace getVariable ["RscWLMineDisplay", objNull];
if (isNull _mineDisplay) then {
    "MineDisplay" cutRsc ["RscWLMineDisplay", "PLAIN", -1, true, false];
    _mineDisplay = uiNamespace getVariable "RscWLMineDisplay";
};
_mineIndicator = _mineDisplay displayCtrl 7010;
_mineIndicatorBackground = _mineDisplay displayCtrl 7009;
_mineIndicatorBackground ctrlSetBackgroundColor [0, 0, 0, 0.7];

while {!BIS_WL_missionEnd} do {
    _endTime = missionNameSpace getVariable ["mineDisplayActive", 0];
    if (_endtime > serverTime) then {
        _mineIndicatorText = format ["<t size='1.8'>%1</t><br/>", localize "STR_WL2_MINE_LIMIT"];
        {
            _mineData = (missionNamespace getVariable format ["BIS_WL2_minesDB_%1", getPlayerUID player]) getOrDefault [_x, [0, []]];
            _strippedName = (_x splitString "_");
            _strippedName set [-1, "mag"];
            _formattedName = (_strippedName joinString "_");
            _mineDisplayName = (getText (configFile >> "CfgMagazines" >> _formattedName >> "displayName"));
            _limit = (_mineData select 0);
            _currentAmount = count ((_mineData select 1) select {alive _x});
            _mineIndicatorText = _mineIndicatorText + format ["<t size='1.2' shadow='2'>%1: %2/%3</t><br/>", _mineDisplayName, _currentAmount, _limit];
        } forEach (missionNamespace getVariable format ["BIS_WL2_minesDB_%1", getPlayerUID player]);
        _mineIndicator ctrlSetStructuredText (parseText _mineIndicatorText);
        _mineIndicatorBackground ctrlSetBackgroundColor [0, 0, 0, 0.7];
        _mineIndicatorBackground ctrlSetPositionH (0.09 + 8 * 0.04);
        _mineIndicatorBackground ctrlCommit 0;
    } else {
        _mineIndicator ctrlSetText "";
        _mineIndicatorBackground ctrlSetBackgroundColor [0, 0, 0, 0];
    };
    sleep WL_TIMEOUT_STANDARD;
};