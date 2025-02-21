#include "..\..\warlords_constants.inc"

params ["_class"];

if (_class != "Land_Communication_F") exitWith {
    [true, ""];
};

private _allJammerMarkers = allMapMarkers select {
    _x find "BIS_WL_jammerMarkerOuter_" == 0;
};
private _allJammers = _allJammerMarkers apply {
    objectFromNetId (_x regexReplace ["BIS_WL_jammerMarkerOuter_", ""]);
};
private _allTowersOnTeam = _allJammers select {
    typeOf _x == "Land_Communication_F"
    && _x getVariable ["BIS_WL_ownerAssetSide", sideUnknown] == BIS_WL_playerSide
};
private _jammersNear = _allTowersOnTeam select { player distance _x < (WL_JAMMER_RANGE_OUTER * 2) };

if (count _jammersNear > 0) exitWith {
    [false, localize "STR_A3_WL_jammer_restr"];
};

private _homeBase = BIS_WL_playerSide call WL2_fnc_getSideBase;
private _isInHomeBase = player inArea (_homeBase getVariable "objectAreaComplete");
if (_isInHomeBase) exitWith {
    [false, localize "STR_A3_WL_jammer_home_restr"];
};

[true, ""]