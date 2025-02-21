#include "..\..\warlords_constants.inc"

params ["_sector"];

// setViewDistance 4500;

private _sectorMarker = _sector getVariable "objectAreaComplete";
private _carrier = ((8 allObjects 0) select {
    _x isKindOf "Land_Carrier_01_hull_base_F" && _x inArea _sectorMarker;
}) # 0;

private _airDefenseGroup = createGroup independent;
_airDefenseGroup deleteGroupWhenEmpty true;
private _airDefenses = [];
// {
//     _x params ["_type", "_pos", "_dir", "_lock", "_waypoints"];
//     private _vehicle = [[_pos # 0, _pos # 1, 500], _type, _type, _dir, objNull] call WL2_fnc_createUAVCrew;
//     _vehicle allowDamage false;
//     _vehicle setDamage 0;

//     _vehicle setVehicleReportRemoteTargets true;
//     _vehicle setVehicleReceiveRemoteTargets true;
//     _vehicle setVehicleReportOwnPosition true;
//     _vehicle setVehicleRadar 1;

//     _vehicle lock true;

//     _vehicle call WL2_fnc_newAssetHandle;
//     _airDefenses pushBack _vehicle;

//     [_vehicle] joinSilent _airDefenseGroup;
//     {
//         _x call WL2_fnc_newAssetHandle;
//         _x setSkill 1;
//         [_x] joinSilent _airDefenseGroup;
//         _airDefenses pushBack _x;
//     } forEach (crew _vehicle);
// } forEach (_sector getVariable ["BIS_WL_vehiclesToSpawn", []]);
// _airDefenseGroup setBehaviourStrong "COMBAT";
// _airDefenseGroup setCombatMode "RED";

// _sector setVariable ["BIS_WL_vehiclesToSpawn", nil];

private _unitsPool = serverNamespace getVariable ["WL2_populateUnitPoolList", []];

private _infantryGroups = [];
private _infantryUnits = [];
private _spawnLocations = (_sector getVariable ["WL_aircraftCarrier", []]) # 1;

private _spawned = 0;
{
    if (_spawned > 50) then {
        break;
    };

    private _net = _x;
    _net hideObject true;

    private _infantryGroup = createGroup independent;
    _infantryGroup deleteGroupWhenEmpty true;
    _infantryGroups pushBack _infantryGroup;

    private _netPosition = getPosATL _net;

    for "_i" from 0 to 8 do {
        private _infantry = _infantryGroup createUnit [selectRandom _unitsPool, _netPosition, [], 0, "NONE"];
        _infantry setVehiclePosition [[_netPosition # 0, _netPosition # 1, 50], [], 5, "CAN_COLLIDE"];

        private _collisions = _airDefenses select {
            _infantry distance _x < 1;
        };
        private _spawnHeight = getPosASL _infantry # 2;
        if (_spawnHeight < 10 || count _collisions > 0) then {
            deleteVehicle _infantry;
        } else {
            _infantry call WL2_fnc_newAssetHandle;
            _spawned = _spawned + 1;
            doStop _infantry;
            _infantryUnits pushBack _infantry;
        };

        sleep 0.001;
    };

    _infantryGroup setBehaviour "COMBAT";
} forEach (_spawnLocations call BIS_fnc_arrayShuffle);

[_infantryUnits + _airDefenses, _sector] spawn WL2_fnc_assetRelevanceCheck;

// [_sector, _airDefenses, _infantryGroups] spawn {
//     params ["_sector", "_airDefenses", "_infantryGroups"];
//     while { _sector getVariable ["BIS_WL_owner", sideUnknown] == independent } do {
//         sleep 1;
//     };

//     setViewDistance 1600;
// };

// [_sector, _airDefenses] spawn {
//     params ["_sector", "_airDefenses"];
//     private _sectorArea = _sector getVariable "objectAreaComplete";
//     private _sectorPos = _sectorArea # 0;
//     while { _sector getVariable ["BIS_WL_owner", sideUnknown] == independent } do {
//         {
//             [_x, 1] remoteExec ["setVehicleAmmo", _x];
//         } forEach _airDefenses;

//         {
//             private _vehiclePosition = getPosATL _x;
//             if ((_vehiclePosition # 2 > 50) && (_sectorPos distance2D _vehiclePosition < 6000)) then {
//                 independent reportRemoteTarget [_x, 30];
//                 if (side group _x != independent) then {
//                     _x confirmSensorTarget [independent, true];
//                 };
//             };
//         } forEach vehicles;

//         sleep 15;
//     };
// };