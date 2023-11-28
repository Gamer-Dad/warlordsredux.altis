#include "..\warlords_constants.inc"

params ["_sector"];

[format ["%1: %2", serverTime, "sector handle client"]] remoteExec ["systemChat", 0];

_owner = _sector getVariable "BIS_WL_owner";
if (_owner == BIS_WL_enemySide) then {
	if (_sector in WL_BASES) then {
		"Defeat" call BIS_fnc_WL2_announcer;
		["Lost"] spawn MRTM_fnc_statTracker;
	} else {
		if (BIS_WL_playerSide in (_sector getVariable ["BIS_WL_revealedBy", []])) then {
			"Lost" call BIS_fnc_WL2_announcer;
		};
	};
};
if (_owner == BIS_WL_playerSide) then {
	if (_sector in WL_BASES) then {
		"Victory" call BIS_fnc_WL2_announcer;
		["Won"] spawn MRTM_fnc_statTracker;
	} else {
		"Seized" call BIS_fnc_WL2_announcer;
		if (count ([player] inAreaArray (_sector getVariable "objectAreaComplete")) > 0) then {
			["Seized"] spawn MRTM_fnc_statTracker;
		};
	};
};

[format ["%1: %2", serverTime, "line 30"]] remoteExec ["systemChat", 0];

"client" call BIS_fnc_WL2_updateSectorArrays;
[_sector, _owner] call BIS_fnc_WL2_sectorMarkerUpdate;

[format ["%1: %2", serverTime, "line 35"]] remoteExec ["systemChat", 0];
private _specialStateArray = (BIS_WL_sectorsArray # 6) + (BIS_WL_sectorsArray # 7);
{[_x, _x getVariable "BIS_WL_owner", _specialStateArray] call BIS_fnc_WL2_sectorMarkerUpdate} forEach (BIS_WL_allSectors - [_sector]);
if (BIS_WL_playerSide in (_sector getVariable ["BIS_WL_revealedBy", []])) then {
	if (_owner != BIS_WL_playerSide) then {
		"Enemy_advancing" call BIS_fnc_WL2_announcer;
	};
	[toUpper format [localize "STR_A3_WL_popup_sector_seized", _sector getVariable "BIS_WL_name", _owner call BIS_fnc_WL2_sideToFaction]] spawn BIS_fnc_WL2_smoothText;
};

[format ["%1: %2", serverTime, "end sector handle client"]] remoteExec ["systemChat", 0];