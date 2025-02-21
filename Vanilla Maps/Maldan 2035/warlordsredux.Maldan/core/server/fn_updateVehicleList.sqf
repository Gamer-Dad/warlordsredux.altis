private _westOwnedVehicles = [];
private _eastOwnedVehicles = [];
private _guerOwnedVehicles = [];
{
    private _playerVehicleVariable = format ["BIS_WL_ownedVehicles_%1", getPlayerUID _x];
    private _vehicles = missionNamespace getVariable [_playerVehicleVariable, []];
    switch (side group _x) do {
        case west: {
            _westOwnedVehicles append _vehicles;
        };
        case east: {
            _eastOwnedVehicles append _vehicles;
        };
        case independent: {
            _guerOwnedVehicles append _vehicles;
        };
    };
} forEach allPlayers;

missionNamespace setVariable ["BIS_WL_westOwnedVehicles", _westOwnedVehicles, true];
missionNamespace setVariable ["BIS_WL_eastOwnedVehicles", _eastOwnedVehicles, true];

#if WL_FACTION_THREE_ENABLED
missionNamespace setVariable ["BIS_WL_guerOwnedVehicles", _guerOwnedVehicles, true];
#endif