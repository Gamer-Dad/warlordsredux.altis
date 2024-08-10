private _westOwnedVehicles = [];
private _eastOwnedVehicles = [];
{
    private _playerVehicleVariable = format ["BIS_WL_ownedVehicles_%1", getPlayerUID _x];
    private _vehicles = missionNamespace getVariable [_playerVehicleVariable, []];
    if (side _x == west) then {
        _westOwnedVehicles append _vehicles;
    } else {
        _eastOwnedVehicles append _vehicles;
    };
} forEach allPlayers;

missionNamespace setVariable ["BIS_WL_westOwnedVehicles", _westOwnedVehicles, true];
missionNamespace setVariable ["BIS_WL_eastOwnedVehicles", _eastOwnedVehicles, true];