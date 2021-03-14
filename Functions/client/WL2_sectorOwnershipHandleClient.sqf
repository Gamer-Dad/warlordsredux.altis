#include "..\warlords_constants.inc"

params ["_sector", "_prevOwner"];

while {!BIS_WL_missionEnd} do {
	waitUntil {sleep WL_TIMEOUT_STANDARD; (_sector getVariable "BIS_WL_owner") != _prevOwner};
	_owner = _sector getVariable "BIS_WL_owner";
	if (_prevOwner == BIS_WL_playerSide) then {
		if (_sector in WL_BASES) then {
			"Defeat" call BIS_fnc_WL2_announcer;
		} else {
			"Lost" call BIS_fnc_WL2_announcer;
		};
	};
	if (_owner == BIS_WL_playerSide) then {
		if (_sector in WL_BASES) then {
			"Victory" call BIS_fnc_WL2_announcer;
		} else {
			"Seized" call BIS_fnc_WL2_announcer;
		};
	};
	["client"] call BIS_fnc_WL2_updateSectorArrays;
	[_sector, _owner] call BIS_fnc_WL2_sectorMarkerUpdate;
	private _specialStateArray = (BIS_WL_sectorsArray # 6) + (BIS_WL_sectorsArray # 7);
	{[_x, _x getVariable "BIS_WL_owner", _specialStateArray] call BIS_fnc_WL2_sectorMarkerUpdate} forEach (BIS_WL_allSectors - [_sector]);
	if (BIS_WL_playerSide in (_sector getVariable "BIS_WL_revealedBy")) then {
		if (_prevOwner != BIS_WL_playerSide && _owner != BIS_WL_playerSide) then {
			"Enemy_advancing" call BIS_fnc_WL2_announcer;
		};
		[toUpper format [localize "STR_A3_WL_popup_sector_seized", _sector getVariable "BIS_WL_name", _owner call BIS_fnc_WL2_sideToFaction]] spawn BIS_fnc_WL2_smoothText;
	};
	_prevOwner = _owner;
};