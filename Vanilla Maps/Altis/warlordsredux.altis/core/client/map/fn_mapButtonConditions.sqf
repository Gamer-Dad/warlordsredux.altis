#include "..\..\warlords_constants.inc"

params ["_target", "_conditionName"];

switch (_conditionName) do {
    case "fastTravelSeized": {
        private _eligibleSectors = (BIS_WL_sectorsArray # 2) select {
            (_x getVariable ["BIS_WL_owner", independent]) == (side (group player))
        };
        _target in _eligibleSectors;
    };
    case "fastTravelConflict";
    case "airAssault": {
        _target == WL_TARGET_FRIENDLY;
    };
    case "vehicleParadrop": {
        private _sectorAvailable = _target in (BIS_WL_sectorsArray # 2);
        private _isCarrierSector = count (_target getVariable ["WL_aircraftCarrier", []]) > 0;
        _sectorAvailable && !_isCarrierSector;
    };
    case "scan": {
        private _allScannableSectors = BIS_WL_sectorsArray # 3;
        private _lastScanEligible = serverTime - (getMissionConfigValue ["BIS_WL_scanCooldown", 300]);
        private _availableSectors = _allScannableSectors select {
            _x getVariable [format ["BIS_WL_lastScanEnd_%1", BIS_WL_playerSide], -9999] < _lastScanEligible
        };
        _target in _availableSectors;
    };
    case "fastTravelSL": {
        private _mySquadLeader = ['getMySquadLeader'] call SQD_fnc_client;
        private _isMySquadLeader = getPlayerID _target == _mySquadLeader;
        isPlayer _target && _isMySquadLeader;
    };
    case "fastTravelSquad": {
        private _areInSquad = ["areInSquad", [getPlayerID _target, getPlayerID player]] call SQD_fnc_client;
        isPlayer _target && _areInSquad;
    };
    case "fastTravelSectorHQ": {
        private _findIsSectorHQ = (BIS_WL_sectorsArray # 2) select {
            (_x getVariable ["WL_sectorHQ", objNull]) == _target
        };
        count _findIsSectorHQ > 0;
    };
    case "fastTravelSectorHQTarget": {
        private _eligibleSectors = (BIS_WL_sectorsArray # 2) select {
            !isNull (_x getVariable ["WL_sectorHQ", objNull])
        };
        _target in _eligibleSectors;
    };
};