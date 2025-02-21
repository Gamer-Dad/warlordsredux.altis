#include "..\..\warlords_constants.inc"

private _findCurrentSector = (BIS_WL_sectorsArray # 0) select {
    player inArea (_x getVariable "objectAreaComplete")
};

if (count _findCurrentSector == 0) exitWith {
    [false, localize "STR_A3_WL_menu_arsenal_restr1"];
};

// private _currentSector = _findCurrentSector # 0;
// private _sectorHQ = _currentSector getVariable ["WL_sectorHQ", objNull];
// if (!isNull _sectorHQ) exitWith {
//     [false, "Sector already has a Sector Stronghold."];
// };

private _buildings = nearestObjects [player, ["House", "Building"], 50, true];
_buildings = _buildings select {
    (_x getVariable ["BIS_WL_ownerAsset", "123"]) == "123"
};

if (count _buildings == 0) exitWith {
    [false, "You are not in or near a building."];
};

private _sectorBuilding = _buildings # 0;

private _buildingBounds = boundingBoxReal _sectorBuilding;
private _sectorHQRadius = _buildingBounds # 2;
private _distanceToSectorBuilding = player distance2D _sectorBuilding;
if (_distanceToSectorBuilding > _sectorHQRadius) exitWith {
    [false, "You are not in or near a building."];
};

private _minBound = _buildingBounds # 0;
private _maxBound = _buildingBounds # 1;
private _buildingArea = (_maxBound # 0 - _minBound # 0) * (_maxBound # 1 - _minBound # 1);
if (_buildingArea < 100) exitWith {
    [false, "The building you are nearest to is too small to be a Sector Stronghold."];
};

[true, ""];