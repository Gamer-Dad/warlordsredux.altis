#include "..\warlords_constants.inc"

private ["_ret", "_tooltip", "_class", "_DLCOwned", "_DLCTooltip"];

_ret = true;
_tooltip = "";
_class = _assetDetails # 0;
_DLCOwned = true;
_DLCTooltip = "";

if (_cost > _funds) then {_ret = false; _tooltip = localize "STR_A3_WL_low_funds"};
if (!alive player) then {_ret = false; _tooltip = localize "STR_A3_WL_fasttravel_restr6"};
if (lifeState player == "INCAPACITATED") then {_ret = false; _tooltip = format [localize "STR_A3_Revive_MSG_INCAPACITATED", name player]};

if (_ret) then {
	switch (_class) do {
		case "FTSeized": {
			if (vehicle player != player) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_fasttravel_restr3"};
			if (BIS_WL_currentSelection == WL_ID_SELECTION_FAST_TRAVEL) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_menu_resetvoting_restr1"};
			if ((count (allPlayers select {alive _x && {(_x distanceSqr player < 2000) && {side group _x != side group player}}})) > 0) exitWith {_ret = false; _tooltip =  localize "STR_A3_WL_fasttravel_restr4"};
		};
		case "FTConflict": {
			if (isNull WL_TARGET_FRIENDLY) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_no_conflict"};
			if (WL_TARGET_FRIENDLY in WL_BASES) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_fasttravel_restr1"};
			if !(WL_TARGET_FRIENDLY in (BIS_WL_sectorsArray # 1)) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_fasttravel_restr5"};
			if (vehicle player != player) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_fasttravel_restr3"};
			if (BIS_WL_currentSelection == WL_ID_SELECTION_FAST_TRAVEL) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_menu_resetvoting_restr1"};
			if ((count (allPlayers select {alive _x && {(_x distanceSqr player < 2000) && {side group _x != side group player}}})) > 0) exitWith {_ret = false; _tooltip =  localize "STR_A3_WL_fasttravel_restr4"};
		};
		case "LastLoadout": {
			if (count BIS_WL_lastLoadout == 0) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_no_loadout_saved"};
			if (BIS_WL_loadoutApplied) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_loadout_reapply_info"};
			if (BIS_WL_lastLoadout isEqualTo (getUnitLoadout player)) exitWith {_ret = false; _tooltip = "You have the same gear as last time."};
			_possibleSectors = (BIS_WL_sectorsArray # 0);
			_visitedSectorID = _possibleSectors findIf {player inArea (_x getVariable "objectAreaComplete")};
			if (_visitedSectorID == -1) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_menu_arsenal_restr1"};
			if ((count (allPlayers select {alive _x && {(_x distanceSqr player < 2000) && {side group _x != side group player}}})) > 0) exitWith {_ret = false; _tooltip =  localize "STR_A3_WL_fasttravel_restr4"};
		};
		case "SavedLoadout": {
			if (count BIS_WL_savedLoadout == 0) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_no_loadout_saved"};
			_possibleSectors = (BIS_WL_sectorsArray # 0);
			_visitedSectorID = _possibleSectors findIf {player inArea (_x getVariable "objectAreaComplete")};
			if (_visitedSectorID == -1) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_menu_arsenal_restr1"};
			if ((count (allPlayers select {alive _x && {(_x distanceSqr player < 2000) && {side group _x != side group player}}})) > 0) exitWith {_ret = false; _tooltip =  localize "STR_A3_WL_fasttravel_restr4"};
		};
		case "FundsTransfer": {
			if (count (BIS_WL_allWarlords select {side group _x == side group player}) < 2) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_transfer_restr1_TODO_REWRITE"};
		};
		case "TargetReset": {
			if (isNull WL_TARGET_FRIENDLY) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_no_conflict"};
			_sectorSelectedTimestampVarID = format ["BIS_WL_sectorSelectedTimestamp_%1", BIS_WL_playerSide];
			_targetResetVotingVarID = format ["BIS_WL_targetResetVotingSince_%1", BIS_WL_playerSide];
			if (serverTime < ((missionNamespace getVariable [_sectorSelectedTimestampVarID, 0]) + (getMissionConfigValue ["BIS_WL_sectorResetTimeout", 300]))) exitWith {_ret = false; _tooltip = ([(((missionNamespace getVariable [_sectorSelectedTimestampVarID, 0]) + (getMissionConfigValue ["BIS_WL_sectorResetTimeout", 300])) - serverTime), "MM:SS"] call BIS_fnc_secondsToString)};
			if (serverTime < ((missionNamespace getVariable [_targetResetVotingVarID, 0]) + WL_TARGET_RESET_VOTING_TIME + 60)) exitWith {_ret = false; _tooltip = ([(((missionNamespace getVariable [_targetResetVotingVarID, 0]) + WL_TARGET_RESET_VOTING_TIME + 60) - serverTime), "MM:SS"] call BIS_fnc_secondsToString)};
		};
		case "forfeitVote": {
			_countSide = (playersNumber (side (group player)));
			_forfeitVotingVarID = format ["BIS_WL_forfeitVotingSince_%1", BIS_WL_playerSide];
			if (_countSide < 10) exitWith {_ret = false; _tooltip = format ["%1/10 Players", _countSide]};
			if (serverTime < ((missionNamespace getVariable [_forfeitVotingVarID, 0]) + 1200)) exitWith {_ret = false; _tooltip = ([(((missionNamespace getVariable [_forfeitVotingVarID, 0]) + 1200) - serverTime), "MM:SS"] call BIS_fnc_secondsToString)};
		};
		case "Arsenal": {
			if (vehicle player != player) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_fasttravel_restr3"};
			_possibleSectors = (BIS_WL_sectorsArray # 0);
			_visitedSectorID = _possibleSectors findIf {player inArea (_x getVariable "objectAreaComplete")};
			if (_visitedSectorID == -1) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_menu_arsenal_restr1"};
			if !(isNull (findDisplay 602)) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_menu_arsenal_restr2"};
			if ((count (allPlayers select {alive _x && {(_x distanceSqr player < 2000) && {side group _x != side group player}}})) > 0) exitWith {_ret = false; _tooltip =  localize "STR_A3_WL_fasttravel_restr4"};
		};
		case "RemoveUnits": {
			if (count ((groupSelectedUnits player) select {_x != player && {(_x getVariable ["BIS_WL_ownerAsset", "123"]) == (getPlayerUID player)}}) == 0) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_info_no_units_selected"};
		};
		case "RespawnVic": {
			if ((count (allPlayers select {alive _x && {(_x distanceSqr player < 2000) && {side group _x != side group player}}})) > 0) exitWith {_ret = false; _tooltip =  localize "STR_A3_WL_fasttravel_restr4"};
			_visitedSectorID = (BIS_WL_sectorsArray # 0) findIf {player inArea (_x getVariable "objectAreaComplete")};
			if (_visitedSectorID == -1) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_restr1"};
			private _sideP = side group player;
			private _ftVehicle = if (_sideP == west) then {((count ((entities "B_Truck_01_medical_F") select {alive _x})) > 0)} else {((count ((entities "O_Truck_03_medical_F") select {alive _x})) > 0)};
			if (_ftVehicle) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_restr"};
		};
		case "RespawnVicFT": {
			if ((count (allPlayers select {alive _x && {(_x distanceSqr player < 2000) && {side group _x != side group player}}})) > 0) exitWith {_ret = false; _tooltip =  localize "STR_A3_WL_fasttravel_restr4"};
			private _sideP = side group player;
			if (_sideP == west) then {
				private _ftBlu = (((entities "B_Truck_01_medical_F") select {alive _x}) # 0);
				if ((count ((entities "B_Truck_01_medical_F") select {alive _x})) > 0) then {
					if (((getPosATL _ftBlu) select 2) > 5) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_ft_restr"};
					if ((count fullCrew [_ftBlu, "cargo", false]) >= 15) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_ft_restr"};
					if ((speed _ftBlu) > 0) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_ft_restr"};
				} else {
					if ((count ((entities "B_Truck_01_medical_F") select {alive _x})) == 0) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_ft_restr"};
				};
			} else {
				private _ftOpf = (((entities "O_Truck_03_medical_F") select {alive _x}) # 0);
				if ((count ((entities "O_Truck_03_medical_F") select {alive _x})) > 0) then {
					if (((getPosATL _ftOpf) select 2) > 5) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_ft_restr"};
					if ((count fullCrew [_ftOpf, "cargo", false]) >= 15) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_ft_restr"};
					if ((speed _ftOpf) > 0) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_ft_restr"};
				} else {
					if ((count ((entities "O_Truck_03_medical_F") select {alive _x})) == 0) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_ft_restr"};
				};
			}; 
		};
		case "RespawnPod": {
			if ((count (allPlayers select {alive _x && {(_x distanceSqr player < 2000) && {side group _x != side group player}}})) > 0) exitWith {_ret = false; _tooltip =  localize "STR_A3_WL_fasttravel_restr4"};
			_visitedSectorID = (BIS_WL_sectorsArray # 0) findIf {player inArea (_x getVariable "objectAreaComplete")};
			if (_visitedSectorID == -1) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_restr1"};
			private _sideP = side group player;
			private _ftVehicle = if (_sideP == west) then {((count (entities "B_Slingload_01_Medevac_F")) > 0)} else {((count (entities "Land_Pod_Heli_Transport_04_medevac_F")) > 0)};
			if (_ftVehicle) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_restr"};
		};
		case "RespawnPodFT" : {
			if ((count (allPlayers select {alive _x && {(_x distanceSqr player < 2000) && {side group _x != side group player}}})) > 0) exitWith {_ret = false; _tooltip =  localize "STR_A3_WL_fasttravel_restr4"};
			private _sideP = side group player;
			if (_sideP == west) then {
				private _ftBlu = ((entities "B_Slingload_01_Medevac_F") # 0);
				if ((count (entities "B_Slingload_01_Medevac_F")) > 0) then {
					if (((getPosATL _ftBlu) select 2) > 5) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_ft_restr"};
					if ((speed _ftBlu) > 0) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_ft_restr"};
				} else {
					if ((count (entities "B_Slingload_01_Medevac_F")) == 0) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_ft_restr"};
				};
			} else {
				private _ftOpf = ((entities "Land_Pod_Heli_Transport_04_medevac_F") # 0);
				if ((count (entities "Land_Pod_Heli_Transport_04_medevac_F")) > 0) then {
					if (((getPosATL _ftOpf) select 2) > 5) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_ft_restr"};
					if ((count fullCrew [_ftOpf, "cargo", false]) >= 4) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_ft_restr"};
					if ((speed _ftOpf) > 0) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_ft_restr"};
				} else {
					if ((count (entities "Land_Pod_Heli_Transport_04_medevac_F")) == 0) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_ft_restr"};
				};
			}; 			
		};
		default {
			_possibleSectors = (BIS_WL_sectorsArray # 0);
			_visitedSectorID = _possibleSectors findIf {player inArea (_x getVariable "objectAreaComplete")};
			_servicesAvailable = BIS_WL_sectorsArray # 5;
			_vehiclesCnt = count WL_PLAYER_VEHS;
			_units = ((units group player) select {((_x getVariable ["BIS_WL_ownerAsset", "123"]) == getPlayerUID player) && {_x != player}});
			
			if (_requirements findIf {!(_x in _servicesAvailable)} >= 0) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_airdrop_restr1"};
			if (_category == "Infantry" && {(count _units) >= BIS_WL_matesAvailable}) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_airdrop_restr2"};
			if (_category in ["Vehicles", "Gear", "Defences", "Aircraft", "Naval"] && {_vehiclesCnt >= (getMissionConfigValue ["BIS_WL_assetLimit", 10])}) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_popup_asset_limit_reached"};
			if (_category in ["Infantry", "Vehicles", "Gear", "Defences", "Aircraft", "Naval"] && {((count (allPlayers select {alive _x && {(_x distanceSqr player < 2000) && {side group _x != side group player}}})) > 0)}) exitWith {_ret = false; _tooltip =  localize "STR_A3_WL_tooltip_deploy_enemies_nearby"};
			if (_category in ["Vehicles", "Infantry", "Gear"] && {(_visitedSectorID == -1)}) exitWith {_ret = false; _tooltip = localize "STR_A3_WL_ftVehicle_restr1"};
			if (_category in ["Infantry", "Vehicles", "Gear", "Defences", "Aircraft", "Naval"] && {((player getVariable ["BIS_WL_isOrdering", false]) == true)}) exitWith {_ret = false; _tooltip =  "Another order is in progress!"};
			if (_category == "Aircraft") exitWith {
				if (getNumber (configFile >> "CfgVehicles" >> _class >> "isUav") == 1) then {
					if (({getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "isUav") == 1} count WL_PLAYER_VEHS) >= (getMissionConfigValue ["BIS_WL_autonomous_limit", 2])) then {
						_ret = false;
						_tooltip = format [localize "STR_A3_WL_tip_max_autonomous", (getMissionConfigValue ["BIS_WL_autonomous_limit", 2])];
					};
				};
			};

			if (_category == "Defences") exitWith {
				if (vehicle player != player) then {
					_ret = false;
					_tooltip = localize "STR_A3_WL_defence_restr1"
				} else {
					if ((count (allPlayers select {alive _x && {(_x distanceSqr player < 2000) && {side group _x != side group player}}})) > 0) then {
						_ret = false;
						_tooltip = localize "STR_A3_WL_tooltip_deploy_enemies_nearby";
					} else {
						_visitedSectorID = (BIS_WL_sectorsArray # 0) findIf {player inArea (_x getVariable "objectAreaComplete")};
						if (_visitedSectorID == -1) then {
							_ret = false;
							_tooltip = localize "STR_A3_WL_defence_restr1";
						};
						if (getNumber (configFile >> "CfgVehicles" >> _class >> "isUav") == 1) then {
							if (({getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "isUav") == 1} count WL_PLAYER_VEHS) >= (getMissionConfigValue ["BIS_WL_autonomous_limit", 2])) then {
								_ret = false;
								_tooltip = format [localize "STR_A3_WL_tip_max_autonomous", (getMissionConfigValue ["BIS_WL_autonomous_limit", 2])];
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

[_ret, _tooltip, _DLCOwned, _DLCTooltip];