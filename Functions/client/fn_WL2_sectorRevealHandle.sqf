#include "..\warlords_constants.inc"

params ["_sector"];

waitUntil {sleep WL_TIMEOUT_STANDARD; BIS_WL_playerSide in (_sector getVariable "BIS_WL_revealedBy")};

private _specialStateArray = (BIS_WL_sectorsArray # 6) + (BIS_WL_sectorsArray # 7);
[_sector, _sector getVariable "BIS_WL_owner", _specialStateArray] call BIS_fnc_WL2_sectorMarkerUpdate;