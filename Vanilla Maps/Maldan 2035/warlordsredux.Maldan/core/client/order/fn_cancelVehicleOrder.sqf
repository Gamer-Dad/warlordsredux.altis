params ["_originalPosition", "_limitDistance", "_ignoreSector"];

private _enemiesNearPlayer = (allPlayers inAreaArray [player, 100, 100]) select {
    _x != player && BIS_WL_playerSide != side group _x && alive _x && lifeState _x != "INCAPACITATED"
};
private _homeBase = BIS_WL_playerSide call WL2_fnc_getSideBase;
private _isInHomeBase = player inArea (_homeBase getVariable "objectAreaComplete");
private _nearbyEnemies = count _enemiesNearPlayer > 0 && !_isInHomeBase;
private _ownedSector = (BIS_WL_sectorsArray # 0) select {
    player inArea (_x getVariable "objectAreaComplete")
};
private _isOutOfSector = count _ownedSector == 0;
private _isInCarrierSector = count (BIS_WL_allSectors select {
    player inArea (_x getVariable "objectAreaComplete") && count (_x getVariable ["WL_aircraftCarrier", []]) > 0
}) > 0;

private _movedTooFar = if (_isInCarrierSector) then {
    count (BIS_WL_allSectors select {
        _originalPosition inArea (_x getVariable "objectAreaComplete") && count (_x getVariable ["WL_aircraftCarrier", []]) > 0
    }) == 0
} else {
    (_originalPosition distance2D player) > _limitDistance
};

private _isInvalidPosition = if (_isInCarrierSector) then {
    (getPosASL player) # 2 < 5
} else {
    (getPosATL player) # 2 > 1
};

vehicle player != player ||
!alive player ||
lifeState player == "INCAPACITATED" ||
(_nearbyEnemies && !_ignoreSector) ||
_isInvalidPosition ||
(_isOutOfSector && !_ignoreSector) ||
_movedTooFar;
