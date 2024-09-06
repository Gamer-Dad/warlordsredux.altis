private _westOwnedVehicles = [];
private _eastOwnedVehicles = [];
{
    private _playerVehicleVariable = format ["BIS_WL_ownedVehicles_%1", getPlayerUID _x];
    private _vehicles = missionNamespace getVariable [_playerVehicleVariable, []];
    private _playerSide = side group _x;
    if (_playerSide == west) then {
        _westOwnedVehicles append _vehicles;
    };
    if (_playerSide == east) then {
        _eastOwnedVehicles append _vehicles;
    };
} forEach allPlayers;

missionNamespace setVariable ["BIS_WL_westOwnedVehicles", _westOwnedVehicles, true];
missionNamespace setVariable ["BIS_WL_eastOwnedVehicles", _eastOwnedVehicles, true];