#include "..\warlords_constants.inc"

params ["_sector"];

if (BIS_WL_playerSide in (_sector getVariable ["BIS_WL_revealedBy", []])) then {
	private _specialStateArray = (BIS_WL_sectorsArray # 6) + (BIS_WL_sectorsArray # 7);
	[_sector, _sector getVariable "BIS_WL_owner", _specialStateArray] call BIS_fnc_WL2_sectorMarkerUpdate;
};