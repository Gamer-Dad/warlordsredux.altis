params ["_side", "_sector"];

[format ["%1: %2", serverTime, "select target"]] remoteExec ["systemChat", 0];

if (_sector getVariable ["BIS_WL_baseUnderAttack", false]) then {
	_sector setVariable ["BIS_WL_baseUnderAttack", false, true];
};

[format ["%1: %2", serverTime, "line 9"]] remoteExec ["systemChat", 0];

if (!isNull _sector) then {
	if !(_sector getVariable ["BIS_WL_simulated", false]) then {
		_sector setVariable ["BIS_WL_simulated", true];
		_sector spawn BIS_fnc_WL2_sectorCaptureHandle;
	};

	[format ["%1: %2", serverTime, "line 17"]] remoteExec ["systemChat", 0];

	missionNamespace setVariable [format ["BIS_WL_currentTarget_%1", _side], _sector, true];
	missionNamespace setVariable [format ["BIS_WL_sectorSelectedTimestamp_%1", _side], serverTime, true];
	if (_sector in [BIS_WL_base1, BIS_WL_base2]) then {
		_sector setVariable ["BIS_WL_baseUnderAttack", true, true];
		["base_vulnerable", _sector getVariable "BIS_WL_originalOwner"] call BIS_fnc_WL2_handleRespawnMarkers;
	} else {
		private _owner = _sector getVariable "BIS_WL_owner";
		[_sector, _owner] spawn BIS_fnc_WL2_populateSector;
	};
} else {
	[format ["%1: %2", serverTime, "line 29"]] remoteExec ["systemChat", 0];
	_prevSector = missionNamespace getVariable format ["BIS_WL_currentTarget_%1", _side];
	missionNamespace setVariable [format ["BIS_WL_currentTarget_%1", _side], objNull, true];
	[format ["%1: %2", serverTime, "line 32"]] remoteExec ["systemChat", 0];
	if (_prevSector in [BIS_WL_base1, BIS_WL_base2]) then {
		["base_safe", _prevSector getVariable "BIS_WL_originalOwner"] call BIS_fnc_WL2_handleRespawnMarkers;
	};
	[format ["%1: %2", serverTime, "line 35"]] remoteExec ["systemChat", 0];
};

[format ["%1: %2", serverTime, "select target end"]] remoteExec ["systemChat", 0];