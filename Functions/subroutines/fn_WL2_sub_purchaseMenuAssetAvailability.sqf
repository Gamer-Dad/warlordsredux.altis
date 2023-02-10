#include "..\warlords_constants.inc"

private ["_ret", "_tooltip", "_class", "_DLCOwned", "_DLCTooltip"];

_ret = TRUE;
_tooltip = "";
_class = _assetDetails # 0;
_DLCOwned = TRUE;
_DLCTooltip = "";

if (_cost > _funds) then {_ret = FALSE; _tooltip = localize "STR_A3_WL_low_funds"};
if (!alive player) then {_ret = FALSE; _tooltip = localize "STR_A3_WL_fasttravel_restr6"};
if (lifeState player == "INCAPACITATED") then {_ret = FALSE; _tooltip = format [localize "STR_A3_Revive_MSG_INCAPACITATED", name player]};

if (_ret) then {
	switch (_class) do {
		case "FTSeized": {
			if (vehicle player != player) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_fasttravel_restr3"};
			if !(WL_TARGET_FRIENDLY getVariable ["BIS_WL_fastTravelEnabled", TRUE]) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_fasttravel_restr2"};
			if (BIS_WL_currentSelection == WL_ID_SELECTION_FAST_TRAVEL) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_menu_resetvoting_restr1"};
			if (triggerActivated BIS_WL_enemiesCheckTrigger) exitWith {_ret = FALSE; _tooltip =  localize "STR_A3_WL_fasttravel_restr4"};
		};
		case "FTConflict": {
			if (isNull WL_TARGET_FRIENDLY) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_no_conflict"};
			if (WL_TARGET_FRIENDLY in WL_BASES) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_fasttravel_restr1"};
			if !(WL_TARGET_FRIENDLY getVariable ["BIS_WL_fastTravelEnabled", TRUE]) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_fasttravel_restr2"};
			if !(WL_TARGET_FRIENDLY in (BIS_WL_sectorsArray # 1)) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_fasttravel_restr5"};
			if (vehicle player != player) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_fasttravel_restr3"};
			if (BIS_WL_currentSelection == WL_ID_SELECTION_FAST_TRAVEL) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_menu_resetvoting_restr1"};
			if (triggerActivated BIS_WL_enemiesCheckTrigger) exitWith {_ret = FALSE; _tooltip =  localize "STR_A3_WL_fasttravel_restr4"};
		};
		case "LastLoadout": {
			if (count BIS_WL_lastLoadout == 0) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_no_loadout_saved"};
			if (BIS_WL_loadoutApplied) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_loadout_reapply_info"};
			_visitedSectorID = (BIS_WL_sectorsArray # 0) findIf {player inArea (_x getVariable "objectAreaComplete")};
			if (_visitedSectorID == -1) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_menu_arsenal_restr1"};
		};
		case "SavedLoadout": {
			if (count BIS_WL_savedLoadout == 0) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_no_loadout_saved"};
			_visitedSectorID = (BIS_WL_sectorsArray # 0) findIf {player inArea (_x getVariable "objectAreaComplete")};
			if (_visitedSectorID == -1) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_menu_arsenal_restr1"};
		};
		case "FundsTransfer": {
			if (count (BIS_WL_allWarlords select {side group _x == side group player}) < 2) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_transfer_restr1_TODO_REWRITE"};
		};
		case "TargetReset": {
			if (isNull WL_TARGET_FRIENDLY) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_no_conflict"};
			_sectorSelectedTimestampVarID = format ["BIS_WL_sectorSelectedTimestamp_%1", BIS_WL_playerSide];
			_targetResetVotingVarID = format ["BIS_WL_targetResetVotingSince_%1", BIS_WL_playerSide];
			if (WL_SYNCED_TIME < ((missionNamespace getVariable [_sectorSelectedTimestampVarID, 0]) + BIS_WL_targetResetTimeout)) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_menu_resetvoting_restr1"};
			if (WL_SYNCED_TIME < ((missionNamespace getVariable [_targetResetVotingVarID, 0]) + WL_TARGET_RESET_VOTING_TIME + 60)) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_menu_resetvoting_restr1"};
		};
		case "Arsenal": {
			_visitedSectorID = (BIS_WL_sectorsArray # 0) findIf {player inArea (_x getVariable "objectAreaComplete")};
			if (_visitedSectorID == -1) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_menu_arsenal_restr1"};
		};
		case "RemoveUnits": {
			if (count ((groupSelectedUnits player) - [player]) == 0) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_info_no_units_selected"};
		};
		case "RespawnVic": {
			_visitedSectorID = (BIS_WL_sectorsArray # 0) findIf {player inArea (_x getVariable "objectAreaComplete")};
			if (_visitedSectorID == -1) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_ftVehicle_restr1"};
			private _sideP = side player;
			private _ftVehicle = if (_sideP == west) then {missionNamespace getVariable "ftVehicleExistsBlu"} else {missionNamespace getVariable "ftVehicleExistsOpf"};
			if (_ftVehicle) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_ftVehicle_restr"};
		};
		case "RespawnVicFT": {
			private _sideP = side player;
			private _ftVehicle = if (_sideP == west) then {missionNamespace getVariable "ftVehicleExistsBlu"} else {missionNamespace getVariable "ftVehicleExistsOpf"};
			/*
			if (_sideP == west) then {
				{
					altitudeBluFT = getPosATL _x;
					missionNamespace setVariable ["BluFTPos", altitudeBluFT];
				} forEach entities "B_Truck_01_medical_F";
				
				if (_ftVehicle == false && (missionNamespace getVariable "BluFTPos" select 2) > 2) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_ftVehicle_ft_restr"};
			} else {
				{
					altitudeOpfFT = getPosATL _x;
					missionNamespace setVariable ["OpfFTPos", altitudeOpfFT];
				} forEach entities "O_Truck_02_medical_F";

				if (_ftVehicle == false && (missionNamespace getVariable "OpfFTPos" select 2) > 2) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_ftVehicle_ft_restr"};
			}; 
			*/
			if (true) exitwith {_ret = FALSE; _tooltip = localize "STR_A3_WL_ftVehicle_ft_restr"};
		};
		case "Surrender": {
			private _sideP =  side player;
			if (_sideP == west) then {
				if !(playersNumber west >= 80) then {_ret = FALSE; _tooltip = localize "STR_A3_WL_surrender_restr"};
			} else {
				if !(playersNumber east >= 80) then {_ret = FALSE; _tooltip = localize "STR_A3_WL_surrender_restr"};
			};
		};
		default {
			_servicesAvailable = BIS_WL_sectorsArray # 5;
			_vehiclesCnt = count WL_PLAYER_VEHS;
			
			if (_requirements findIf {!(_x in _servicesAvailable)} >= 0) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_airdrop_restr1"};
			if (_category == "Infantry" && (count units group player) - 1 + BIS_WL_matesInBasket >= BIS_WL_matesAvailable) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_airdrop_restr2"};
			if (_category in ["Vehicles", "Gear", "Defences", "Aircraft", "Naval"] && _vehiclesCnt + BIS_WL_vehsInBasket >= BIS_WL_assetLimit) exitWith {_ret = FALSE; _tooltip = localize "STR_A3_WL_popup_asset_limit_reached"};
			if (_category == "Defences") exitWith {
				if (vehicle player != player) then {
					_ret = FALSE;
					_tooltip = localize "STR_A3_WL_defence_restr1"
				} else {
					if (triggerActivated BIS_WL_enemiesCheckTrigger) then {
						_ret = FALSE;
						_tooltip = localize "STR_A3_WL_tooltip_deploy_enemies_nearby";
					} else {
						_visitedSectorID = (BIS_WL_sectorsArray # 0) findIf {player inArea (_x getVariable "objectAreaComplete")};
						if (_visitedSectorID == -1) then {
							_ret = FALSE;
							_tooltip = localize "STR_A3_WL_defence_restr1";
						};
						if (getNumber (configFile >> "CfgVehicles" >> _class >> "isUav") == 1) then {
							if (({getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "isUav") == 1} count WL_PLAYER_VEHS) >= BIS_WL_autonomous_limit) then {
								_ret = FALSE;
								_tooltip = format [localize "STR_A3_WL_tip_max_autonomous", BIS_WL_autonomous_limit];
							};
						};
					};
				};
			};
			_DLCOwned = [_class, "IsOwned"] call BIS_fnc_WL2_sub_purchaseMenuHandleDLC;
			_DLCTooltip = [_class, "GetTooltip"] call BIS_fnc_WL2_sub_purchaseMenuHandleDLC;
		};
	};
};

[_ret, _tooltip, _DLCOwned, _DLCTooltip]