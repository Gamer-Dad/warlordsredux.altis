#include "..\..\warlords_constants.inc"

private _enemiesNearPlayer = (allPlayers inAreaArray [player, 100, 100]) select {
    _x != player &&
    BIS_WL_playerSide != side group _x &&
    alive _x &&
    lifeState _x != "INCAPACITATED"
};
private _homeBase = BIS_WL_playerSide call WL2_fnc_getSideBase;
private _isInHomeBase = player inArea (_homeBase getVariable "objectAreaComplete");
private _nearbyEnemies = count _enemiesNearPlayer > 0 && !_isInHomeBase;

if (_nearbyEnemies) then {
    [false, "There are enemies nearby."];
} else {
    [true, ""];
};