params ["_customText", "_unitType"];

private _spawnTypeMap = missionNamespace getVariable ["WL2_spawnClass", createHashMap];
private _spawnUnitType = _spawnTypeMap getOrDefault [_unitType, _unitType];

if (_spawnUnitType isKindOf "Man") then {
	WLT_stats set ["Kills", (WLT_stats getOrDefault ["Kills", 0]) + 1];
};
if (_spawnUnitType isKindOf "Air") then {
	WLT_stats set ["Air Vehicle Kills", (WLT_stats getOrDefault ["Air Vehicle Kills", 0]) + 1];
};

private _vehicleApsMap = missionNamespace getVariable ["WL2_aps", createHashMap];
private _apsType = _vehicleApsMap getOrDefault [_unitType, -1];
if (_apsType >= 1) then {
	WLT_stats set ["Armor Kills", (WLT_stats getOrDefault ["Armor Kills", 0]) + 1];
	if (_apsType == 2) then {
		WLT_stats set ["Heavy Armor Kills", (WLT_stats getOrDefault ["Heavy Armor Kills", 0]) + 1];
	};
} else {
	if (_spawnUnitType isKindOf "Land") then {
		WLT_stats set ["Light Vehicle Kills", (WLT_stats getOrDefault ["Light Vehicle Kills", 0]) + 1];
	};
};

private _displayName = [_unit, _unitType] call WL2_fnc_getAssetTypeName;
private _statName = format ["Kill: %1", _displayName];
WLT_stats set [_statName, (WLT_stats getOrDefault [_statName, 0]) + 1];

if (_customText == "Active protection system") then {	// this might be a problem if server lang is different
	WLT_stats set ["Trigger APS", (WLT_stats getOrDefault ["Trigger APS", 0]) + 1];
};
