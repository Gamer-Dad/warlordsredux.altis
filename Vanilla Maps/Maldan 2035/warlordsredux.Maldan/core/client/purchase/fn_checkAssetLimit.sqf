#include "..\..\warlords_constants.inc"

private _assetLimit = getMissionConfigValue ["BIS_WL_assetLimit", 10];

private _ownedVehiclesVar = format ["BIS_WL_ownedVehicles_%1", getPlayerUID player];
private _ownedVehicles = missionNamespace getVariable [_ownedVehiclesVar, []];

if (count _ownedVehicles >= _assetLimit) then {
    [false, localize "STR_A3_WL_popup_asset_limit_reached"]
} else {
    [true, ""]
};
