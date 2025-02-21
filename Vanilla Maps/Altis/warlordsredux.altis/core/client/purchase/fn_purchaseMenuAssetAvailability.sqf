#include "..\..\warlords_constants.inc"

params [
	"_class",
	"_requirements",
	"_displayName",
	"_picture",
	"_text",
	"_offset",
	"_cost",
	"_category"
];

private _ret = true;
private _tooltip = "";
private _DLCOwned = true;
private _DLCTooltip = "";

private _checkConditions = {
	params ["_conditions"];
	// Caching condition checks doesn't seem to improve performance.
	// if (isNil "WL_MenuConditionsCache") then {
	// 	WL_MenuConditionsCache = createHashMap;
	// };

	private _results = _conditions apply {
		private _checker = _x # 0;
		if (count _x == 1) then {
			call _checker;
		} else {
			private _arguments = _x # 1;
			_arguments call _checker;
		};
		// private _hasValidCacheEntry = false;
		// private _validCacheEntry = [];
		// private _hashKey = hashValue _x;
		// private _cacheResult = WL_MenuConditionsCache getOrDefault [_hashKey, []];
		// if (count _cacheResult > 0) then {
		// 	private _isExpired = serverTime >= (_cacheResult # 1);
		// 	if (!_isExpired) then {
		// 		_validCacheEntry = _cacheResult;
		// 		_hasValidCacheEntry = true;
		// 	};
		// };

		// if (!_hasValidCacheEntry) then {
		// 	private _result = if (count _x == 1) then {
		// 		call _checker;
		// 	} else {
		// 		private _arguments = _x # 1;
		// 		_arguments call _checker;
		// 	};
		// 	private _cacheTime = serverTime + 30;
		// 	WL_MenuConditionsCache set [_hashKey, [_result, _cacheTime]];
		// 	_result;
		// } else {
		// 	_validCacheEntry # 0;
		// };
	};
	private _failedResults = _results select { !(_x # 0) };
	private _failures = _failedResults apply { _x # 1 };
	_failures;
};

if (isNil "_class") exitWith {};

private _failures = [];

private _allConditions = [
	[WL2_fnc_checkFunds, _cost],
	[WL2_fnc_checkDead]
];
private _resultAllConditions = [_allConditions] call _checkConditions;
_failures append _resultAllConditions;

private _findCurrentOwnedSector = (BIS_WL_sectorsArray # 0) select {
	player inArea (_x getVariable "objectAreaComplete")
};
private _sector = if (count _findCurrentOwnedSector > 0) then {
	_findCurrentOwnedSector # 0;
} else {
	objNull;
};

if (_ret) then {
	private _conditions = switch (_class) do {
		case "FTSeized": {
			[
				[WL2_fnc_checkPlayerInVehicle],
				[WL2_fnc_checkNearbyEnemies]
			]
		};
		case "FTConflict";
		case "FTAirAssault": {
			[
				[WL2_fnc_checkIndependents],
				[WL2_fnc_checkPlayerInVehicle],
				[WL2_fnc_checkTargetSelected],
				[WL2_fnc_checkTargetEnemyBase],
				[WL2_fnc_checkTargetUnlinked],
				[WL2_fnc_checkNearbyEnemies]
			]
		};
		case "FTParadropVehicle": {
			[
				[WL2_fnc_checkIndependents],
				[WL2_fnc_checkInFriendlySector],
				[WL2_fnc_checkGroundVehicleDriver],
				[WL2_fnc_checkNearbyEnemies],
				[WL2_fnc_checkParadropCooldown]
			]
		};
		case "FTSquadLeader": {
			[
				[WL2_fnc_checkPlayerInVehicle],
				[WL2_fnc_checkNearbyEnemies],
				[WL2_fnc_checkFastTravelSL]
			]
		};
		case "FTSquad": {
			[
				[WL2_fnc_checkPlayerInVehicle],
				[WL2_fnc_checkNearbyEnemies],
				[WL2_fnc_checkFastTravelSquad]
			]
		};
		case "LastLoadout": {
			[
				[WL2_fnc_checkPlayerInVehicle],
				[WL2_fnc_checkLastLoadout],
				[WL2_fnc_checkInFriendlySector],
				[WL2_fnc_checkNearbyEnemies]
			]
		};
		case "SavedLoadout": {
			[
				[WL2_fnc_checkPlayerInVehicle],
				[WL2_fnc_checkSavedLoadout],
				[WL2_fnc_checkInFriendlySector],
				[WL2_fnc_checkNearbyEnemies]
			]
		};
		case "FundsTransfer": {
			[
				[WL2_fnc_checkAlliedPlayers]
			]
		};
		case "TargetReset": {
			[
				[WL2_fnc_checkIndependents],
				[WL2_fnc_checkTargetSelected],
				[WL2_fnc_checkResetSectorTimer]
			]
		};
		case "ForfeitVote": {
			[
				[WL2_fnc_checkIndependents],
				[WL2_fnc_checkSurrender]
			]
		};
		case "Arsenal": {
			[
				[WL2_fnc_checkPlayerInVehicle],
				[WL2_fnc_checkInFriendlySector],
				[WL2_fnc_checkInventoryOpen],
				[WL2_fnc_checkNearbyEnemies]
			]
		};
		case "RemoveUnits": {
			[
				[WL2_fnc_checkSelectedUnits]
			]
		};
		case "RespawnVic": {
			[
				[WL2_fnc_checkIndependents],
				[WL2_fnc_checkPlayerInVehicle],
				[WL2_fnc_checkNearbyEnemies],
				[WL2_fnc_checkInFriendlySector],
				[WL2_fnc_checkBuyRespawn, [false]]
			]
		};
		case "RespawnVicFT": {
			[
				[WL2_fnc_checkIndependents],
				[WL2_fnc_checkPlayerInVehicle],
				[WL2_fnc_checkNearbyEnemies],
				[WL2_fnc_checkFastTravelRespawn, [false, 15]]
			]
		};
		case "RespawnPod": {
			[
				[WL2_fnc_checkIndependents],
				[WL2_fnc_checkPlayerInVehicle],
				[WL2_fnc_checkNearbyEnemies],
				[WL2_fnc_checkInFriendlySector],
				[WL2_fnc_checkBuyRespawn, [true]]
			]
		};
		case "RespawnPodFT": {
			[
				[WL2_fnc_checkIndependents],
				[WL2_fnc_checkPlayerInVehicle],
				[WL2_fnc_checkNearbyEnemies],
				[WL2_fnc_checkFastTravelRespawn, [true, 4]]
			]
		};
		case "RespawnBag": {
			[
				[WL2_fnc_checkPlayerInVehicle],
				[WL2_fnc_checkNearbyEnemies],
				[WL2_fnc_checkInFriendlySector],
				[WL2_fnc_checkTentAction]
			]
		};
		case "RespawnBagFT": {
			[
				[WL2_fnc_checkPlayerInVehicle],
				[WL2_fnc_checkNearbyEnemies],
				[WL2_fnc_checkTent]
			]
		};
		case "BuySectorHQ": {
			[
				[WL2_fnc_checkPlayerInVehicle],
				[WL2_fnc_checkNearbyEnemies],
				[WL2_fnc_checkNoSectorHQ]
			]
		};
		case "SectorHQFT": {
			[
				[WL2_fnc_checkPlayerInVehicle],
				[WL2_fnc_checkNearbyEnemies],
				[WL2_fnc_checkSectorHQFT]
			]
		};
		case "ResetVehicle": {
			[
				[WL2_fnc_checkResetVehicle],
				[WL2_fnc_checkPlayerInVehicle]
			]
		};
		case "Customization": {
			[]
		};
		case "SwitchToGreen": {
			[
				[WL2_fnc_checkIndependents],
				[WL2_fnc_checkGreenSwitch]
			]
		};
		default {
			if (_category in ["Fast Travel", "Strategy"]) then {
				[]
			} else {
				private _assetConditions = [
					[WL2_fnc_checkRequirements, [_sector, _requirements]],
					[WL2_fnc_checkInfantryAvailable, [_class]],
					[WL2_fnc_checkCarrierHeavy, [_sector, _category]],
					[WL2_fnc_checkAssetLimit],
					[WL2_fnc_checkNearbyEnemies],
					[WL2_fnc_checkPlayerInVehicle, [_requirements]],
					[WL2_fnc_checkInFriendlySector, [_requirements]],
					[WL2_fnc_checkIsOrdering],
					[WL2_fnc_checkUAVLimit, [_class]],
					[WL2_fnc_checkCommTower, [_class]]
				];

				_assetConditions;
			};
		};
	};
	private _result = [_conditions] call _checkConditions;
	_failures append _result;

	_DLCOwned = [_class, "IsOwned"] call WL2_fnc_purchaseMenuHandleDLC;
	_DLCTooltip = [_class, "GetTooltip"] call WL2_fnc_purchaseMenuHandleDLC;

	if (count _failures > 0) exitWith {
		_ret = false;
		_tooltip = _failures;
	};
};

[_ret, _tooltip, _DLCOwned, _DLCTooltip];