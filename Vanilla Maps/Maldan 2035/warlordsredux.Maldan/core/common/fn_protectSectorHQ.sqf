params ["_sectorBuilding", "_protect"];

if (_sectorBuilding isKindOf "House" || _sectorBuilding isKindOf "Building") then {
    _sectorBuilding allowDamage !(_protect);
};