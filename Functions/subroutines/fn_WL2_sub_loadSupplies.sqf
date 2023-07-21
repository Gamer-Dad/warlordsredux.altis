#include "..\warlords_constants.inc"

params ["_asset"];

_loadAction = {
	params ["_target", "_caller", "_actionId", "_arguments"];

	// deduct supplies from current sector
	_currentSector = [_caller] call BIS_fnc_WL2_getCurrentSector;
	_sectorSupplyPoints = [_caller] call BIS_fnc_WL2_getSectorSupply;
	_currentSector setVariable ["BIS_WL_supplyPoints", _sectorSupplyPoints - 1000, true];

	// add supplies to container
	_prevSupplyPoints = _target getVariable ["supplyPoints", 0];
	_newSupplyPoints = _prevSupplyPoints + WL_LOGISTICS_CARGO_UNIT;
	_target setVariable ["supplyPoints", _newSupplyPoints, true];

	// this tracks where the cargo was last loaded for unload rewards
	_target setVariable ["BIS_WL_lastLoadedCargo", _caller call BIS_fnc_WL2_getDistanceToNearestSupplyPoint, true];

	// display message to loader's group (which includes AI)
	_sectorSupplyDisplay = if (_sectorSupplyPoints < 1e20) then { str (_sectorSupplyPoints - WL_LOGISTICS_CARGO_UNIT) } else { localize "STR_A3_WL_unlimited" };
	_caller groupChat format [localize "STR_A3_WL_supplies_loaded", _newSupplyPoints, _sectorSupplyDisplay];

	// sound cue
	playSound3D ["A3\Sounds_F\sfx\UI\vehicles\Vehicle_Rearm.wss", _target, false, getPosASL _target, 1, 1.2];
	// additional sound if we reached max capacity
	if (WL_LOGISTICS_MAX_CARGO < _newSupplyPoints + WL_LOGISTICS_CARGO_UNIT) then {
		playSound3D ["a3\sounds_f_orange\vehicles\soft\van_02\van_02_door_rear_close_02.wss", player, false, getPosASL player, 3, 1];
	};
};

_unloadAction = {
	params ["_target", "_caller", "_actionId", "_arguments"];

	// add supplies to current sector
	_currentSector = [_caller] call BIS_fnc_WL2_getCurrentSector;
	_sectorSupplyPoints = [_caller] call BIS_fnc_WL2_getSectorSupply;
	_currentSector setVariable ["BIS_WL_supplyPoints", _sectorSupplyPoints + WL_LOGISTICS_CARGO_UNIT, true];

	// deduct supplies from container
	_prevSupplyPoints = _target getVariable ["supplyPoints", 0];
	_target setVariable ["supplyPoints", _prevSupplyPoints - WL_LOGISTICS_CARGO_UNIT, true];

	// call unload supplies for rewards
	[_caller, "unloadSupplies", 0, [0, 0, 0], _target, false] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2];

	// display message to loader's group (which includes AI)
	_caller groupChat format [localize "STR_A3_WL_supplies_unloaded", _prevSupplyPoints - WL_LOGISTICS_CARGO_UNIT, _sectorSupplyPoints + WL_LOGISTICS_CARGO_UNIT];

	// sound cue
	playSound3D ["A3\Sounds_F\sfx\UI\vehicles\Vehicle_Rearm.wss", _target, false, getPosASL _target, 1, 0.8];
};

// conditions
_playerReqs = "isPlayer _this && alive _target && _this distance _target < 30";
_playerHoldReqs = "alive _target && _caller distance _target < 30";
_aiReqs = "!isPlayer _this && alive _target";

_loadReqs = " && _target call BIS_fnc_WL2_hasSupplyContainerSpace && _this call BIS_fnc_WL2_canLoad";
_unloadReqs = " && _target call BIS_fnc_WL2_canUnload && !isNil { _this call BIS_fnc_WL2_getCurrentSector } && !(_this call BIS_fnc_WL2_isSectorSupplyFull)";
_queryReqs = "alive _target";

// target: any player, action: load supplies, hold to activate
_loadActionID = [
	_asset,
	format ["<t color = '#add8e6'>%1</t>", format [localize "STR_A3_WL_supplies_load_action", WL_LOGISTICS_CARGO_UNIT]],
	"\a3\data_f_destroyer\data\UI\IGUI\Cfg\holdactions\holdAction_unloadVehicle_ca.paa", // yes, the opposite of what the filename says is more intuitive
	"\a3\data_f_destroyer\data\UI\IGUI\Cfg\holdactions\holdAction_unloadVehicle_ca.paa",
	_playerReqs + _loadReqs, 
	_playerHoldReqs + _loadReqs,
	{},
	{},
	_loadAction,
	{},
	[], 
	WL_LOGISTICS_LOADING_TIME, 
	99, 
	false,
	false
] call BIS_fnc_holdActionAdd;

// target: any player, action: unload supplies, hold to activate
_unloadActionID = [
	_asset,
	format ["<t color = '#add8e6'>%1</t>", format [localize "STR_A3_WL_supplies_unload_action", WL_LOGISTICS_CARGO_UNIT]],
	"\a3\data_f_destroyer\data\UI\IGUI\Cfg\holdactions\holdAction_loadVehicle_ca.paa",
	"\a3\data_f_destroyer\data\UI\IGUI\Cfg\holdactions\holdAction_loadVehicle_ca.paa",
	_playerReqs + _unloadReqs, 
	_playerHoldReqs + _unloadReqs,
	{},
	{},
	_unloadAction,
	{},
	[], 
	WL_LOGISTICS_LOADING_TIME, 
	99, 
	false,
	false
] call BIS_fnc_holdActionAdd;

// target: anyone, action: respond with number of supplies in container and sector
_querySuppliesActionID = _asset addAction [
	format ["<t color = '#add8e6'>%1</t>", localize "STR_A3_WL_supplies_check"],
	{
		params ["_target", "_caller", "_actionId", "_arguments"];

		// get current supplies in sector
		_sectorSupplyPoints = [_caller] call BIS_fnc_WL2_getSectorSupply;
		_sectorSupplyDisplay = if (_sectorSupplyPoints < 1e20) then { str (_sectorSupplyPoints) } else { localize "STR_A3_WL_unlimited" };

		// get supplies in container
		_cargoSupplyPoints = _target getVariable ["supplyPoints", 0];

		// display message to loader's group (which includes AI) & sound cue
		_caller groupChat format [localize "STR_A3_WL_supplies_check_response", _cargoSupplyPoints, _sectorSupplyDisplay];
		playSound3D ["a3\ui_f\data\sound\cfgnotifications\taskupdated.wss", player, false, getPosASL player, 3, 1];
	},
	nil,
	0,
	true,
	false,
	"",
	_queryReqs, 
	30
];

// target: anyone, action: respond with all friendly sectors, listed in ascending order of supply levels
_querySectorsActionID = _asset addAction [
	format ["<t color = '#add8e6'>%1</t>", localize "STR_A3_WL_check_sector_supplies"],
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		
		// get all friendly sectors and sort by supply levels
		_sortedByPoints = [(BIS_WL_sectorsArray # 0), [], { _x getVariable ["BIS_WL_supplyPoints", 0] }, "ASCEND"] call BIS_fnc_sortBy;
		_sortedByPoints = _sortedByPoints apply {
			_supplyPoints = _x getVariable ["BIS_WL_supplyPoints", 0];
			format ["%1 (%2)", _x getVariable ["BIS_WL_name", ""], if (_supplyPoints > 1e20) then { localize "STR_A3_WL_unlimited" } else { _supplyPoints } ];
		};

		// display message to loader's group (which includes AI) & sound cue
		_caller groupChat format[localize "STR_A3_WL_check_sector_supplies_response", _sortedByPoints joinString ", "];
		playSound3D ["a3\ui_f\data\sound\cfgnotifications\taskupdated.wss", player, false, getPosASL player, 3, 1];
	},
	nil,
	0,
	true,
	false,
	"",
	_queryReqs, 
	30
];

// target: any AI, action: load supplies, can be activated with 6 menu
_AIloadActionID = _asset addAction [
	format ["<t color = '#add8e6'>%1</t>", format [localize "STR_A3_WL_supplies_load_action", WL_LOGISTICS_CARGO_UNIT]],
	_loadAction,
	nil,
	99,
	true,
	false,
	"",
	_aiReqs + _loadReqs, 
	30
];

// target: any AI, action: unload supplies, can be activated with 6 menu
_AIunloadActionID = _asset addAction [
	format ["<t color = '#add8e6'>%1</t>", format [localize "STR_A3_WL_supplies_unload_action", WL_LOGISTICS_CARGO_UNIT]],
	_unloadAction,
	nil,
	99,
	true,
	false,
	"",
	_aiReqs + _unloadReqs, 
	30
];