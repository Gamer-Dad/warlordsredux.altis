"fundsDatabaseClients" addPublicVariableEventHandler {
	false spawn BIS_fnc_WL2_refreshOSD;
};

addMissionEventHandler ["GroupIconClick", BIS_fnc_WL2_groupIconClickHandle];
addMissionEventHandler ["GroupIconOverEnter", BIS_fnc_WL2_groupIconEnterHandle];
addMissionEventHandler ["GroupIconOverLeave", BIS_fnc_WL2_groupIconLeaveHandle];

player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	VIC_ENTERED = true;
	if ((typeOf _vehicle == "B_Plane_Fighter_01_F") || {(typeOf _vehicle == "B_Plane_CAS_01_dynamicLoadout_F") || {(typeOf _vehicle == "B_Heli_Attack_01_dynamicLoadout_F") || {(typeOf _vehicle == "B_T_VTOL_01_armed_F") || {(typeOf _vehicle == "B_T_VTOL_01_vehicle_F") || {(typeOf _vehicle == "B_T_VTOL_01_infantry_F")}}}}}) then  {
		0 spawn BIS_fnc_WL2_betty;
	};
	if ((typeOf _vehicle == "O_Plane_Fighter_02_F") || {(typeOf _vehicle == "O_Plane_CAS_02_dynamicLoadout_F") || {(typeOf _vehicle == "O_Heli_Attack_02_dynamicLoadout_F") || {(typeOf _vehicle == "O_T_VTOL_02_vehicle_dynamicLoadout_F")}}}) then {
		0 spawn BIS_fnc_WL2_rita;
	};
}];

player addEventHandler ["InventoryOpened",{
	params ["_unit","_container"];
	_override = false;
	_allUnitBackpackContainers = (player nearEntities ["Man", 50]) select {isPlayer _x} apply {backpackContainer _x};

	if (_container in _allUnitBackpackContainers) then {
		systemchat "Access denied!";
		_override = true;
	};
	_override;
}];

player addEventHandler ["Killed", {
	BIS_WL_loadoutApplied = FALSE;
	"RequestMenu_close" call BIS_fnc_WL2_setupUI;
	
	BIS_WL_lastLoadout = +getUnitLoadout player;
	private _varName = format ["BIS_WL_purchasable_%1", BIS_WL_playerSide];
	private _gearArr = (missionNamespace getVariable _varName) # 5;
	private _lastLoadoutArr = _gearArr # 1;
	private _text = localize "STR_A3_WL_last_loadout_info";
	_text = _text + "<br/><br/>";
	{
		if (_forEachIndex in [0,1,2,3,4]) then {
			if (count _x > 0) then {
				_text = _text + (getText (configFile >> "CfgWeapons" >> _x # 0 >> "displayName")) + "<br/>";
			};
		};
		if (_forEachIndex == 5) then {
			if (count _x > 0) then {
				_text = _text + (getText (configFile >> "CfgVehicles" >> _x # 0 >> "displayName")) + "<br/>";
			};
		};
	} forEach BIS_WL_lastLoadout;
	_lastLoadoutArr set [5, _text];
	_gearArr set [1, _lastLoadoutArr];
	(missionNamespace getVariable _varName) set [5, _gearArr];

	_connectedUAV = getConnectedUAV player;
	if (_connectedUAV != objNull) exitWith {
		player connectTerminalToUAV objNull;
	};
	player setVariable ["BIS_WL_isOrdering", false, [2, clientOwner]];
	_canUse = player isUniformAllowed (uniform player);
	if !(_canUse) then {
		[format ["Player:%1, player's UID:%2: Uses a uniform from another faction: %3", player, getPlayerUID player, uniform player]] remoteExec ["diag_log", 2];
	};
	closeDialog 2;
}];

player addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];
	_base = (([BIS_WL_base1, BIS_WL_base2] select {(_x getVariable "BIS_WL_owner") == (side group _unit)}) # 0);
	if ((_unit inArea (_base getVariable "objectAreaComplete")) && {!(_base getVariable ["BIS_WL_baseUnderAttack", false])}) then {
		0;
	} else {
		_damage;
	};
}];

player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	if ((_vehicle getVariable "BIS_WL_ownerAsset") == (getPlayerUID player)) then {
		_vehicle setVariable ["BIS_WL_lastActive", 0];
	};
}];

player addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret", "_isEject"];
	if (((_vehicle getVariable "BIS_WL_ownerAsset") == (getPlayerUID player)) && (pricehash getOrDefault [typeOf _vehicle, 300] <= 200)) then {
		_vehicle setVariable ["BIS_WL_lastActive", serverTime + 600];
	};
}];

if ((getPlayerUID player) in (getArray (missionConfigFile >> "adminIDs"))) then {
	addMissionEventHandler ["HandleChatMessage", {
		params ["_channel", "_owner", "_from", "_text"];
		_text = toLower _text;
		_list = getArray (missionConfigFile >> "adminFilter");
		_return = ((_list findIf {[_x, _text] call BIS_fnc_inString}) != -1);

		if (_owner == clientOwner) then {
			_input = _text splitString " ";
			_command = _input # 0;
			_count = count _input;
			if (_count == 1 && {_command == "!updateZeus"}) then {
				[player, 'updateZeus'] remoteExec ['BIS_fnc_WL2_handleClientRequest', 2];
			};
		};
		_return;
	}];
} else {
	addMissionEventHandler ["HandleChatMessage", {
		params ["_channel", "_owner", "_from", "_text"];
		_text = toLower _text;
		_list = getArray (missionConfigFile >> "adminFilter");
		_return = ((_list findIf {[_x, _text] call BIS_fnc_inString}) != -1);

		_return;
	}];
};

0 spawn {
	waituntil {sleep 0.1; !isnull (findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["KeyUp", {
		_key = _this # 1;
		if (_key in actionKeys "Gear") then {
			BIS_WL_gearKeyPressed = false;
		};
	}];

	(findDisplay 46) displayAddEventHandler ["KeyDown", {
		params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
		private _e = false;
		private _zeusKey = actionKeys "curatorInterface";
		private _viewKey = actionKeys "tacticalView";
		_e = ((_key in _viewKey || {_key in _zeusKey}) && {!((getPlayerUID player) in (getArray (missionConfigFile >> "adminIDs")))});

		if (inputAction "cycleThrownItems" > 0.01) exitWith {
			[vehicle player, 0, false] spawn APS_fnc_Report;
		};

		if (_key in actionKeys "Gear" && {!(missionNamespace getVariable ["BIS_WL_gearKeyPressed", false]) && {alive player && {!BIS_WL_penalized}}}) then {
			if !(isNull (uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull])) then {
				"RequestMenu_close" call BIS_fnc_WL2_setupUI;
			} else {
				BIS_WL_gearKeyPressed = true;
				0 spawn {
					_t = time + 0.5;
					waitUntil {!BIS_WL_gearKeyPressed || {time >= _t}};
					if (time < _t) then {
						if (isNull findDisplay 602) then {
							if (vehicle player == player) then {
								if (cursorTarget distanceSqr player <= 25 && {!(cursorTarget isKindOf "House") && {(!alive cursorTarget || {!(cursorTarget isKindOf "Man")})}}) then {
									player action ["Gear", cursorTarget];
								} else {
									player action ["Gear", objNull];
								};
							} else {
								vehicle player action ["Gear", vehicle player];
							};
						} else {
							closeDialog 602;
						};
					} else {
						if (BIS_WL_gearKeyPressed && {!(player getVariable ["BIS_WL_menuLocked", false])}) then {
							if (BIS_WL_currentSelection in [0, 2]) then {
								"RequestMenu_open" call BIS_fnc_WL2_setupUI;
							} else {
								playSound "AddItemFailed";
								_action = if (BIS_WL_currentSelection == 1) then {
									localize "STR_A3_WL_popup_voting";
								} else {
									if (BIS_WL_currentSelection in [3,8]) then {
										localize "STR_A3_WL_action_destination_select";
									} else {
										if (BIS_WL_currentSelection in [4,5,7]) then {
											localize "STR_A3_WL_action_scan_select";
										} else {
											"";
										};
									};
								};
								[toUpper format [(localize "STR_A3_WL_another_action") + (if (_action == "") then {"."} else {" (%1)."}), _action]] spawn BIS_fnc_WL2_smoothText;
							};
						};
					};
				};
			};
			_e = true;
		};
		
		_e;
	}];
};

//***Fetch price from requisitions.hpp using "priceHash getOrDefault [typeOf _asset, 200]"***/
priceHash = createHashMap;
_fullList = (missionNamespace getVariable (format ["BIS_WL_purchasable_%1", side player]));
{
	if (_forEachIndex < 7) then {
		_category = _x;
		{
			_x params["_name", "_cost"];
			priceHash set [_name, _cost]
		}forEach _category;
	};
}forEach _fullList;

missionNamespace setVariable ["BIS_WL2_rearmTimers", 
	compileFinal createHashMapFromArray [
//***Blufor***/
	//***Light***/
		["B_G_Offroad_01_armed_F", 120], //Offroad Armed
		["B_G_Offroad_01_AT_F", 180], //Offroad AT
		["B_LSV_01_armed_F", 120], //Prowler HMG
		["B_LSV_01_AT_F", 200], //Prowler AT
		["B_MRAP_01_gmg_F", 300], //Hunter GMG
		["B_MRAP_01_hmg_F", 300], //Hunter HMG
	//***APC/IFV***/
		["B_APC_Wheeled_01_cannon_F", 500], //Marshall
		["B_APC_Wheeled_03_cannon_F", 500], //Gorgon
		["B_APC_Tracked_01_rcws_F", 400], //Panther
		["B_APC_Tracked_01_AA_F", 500], //Cheetah
	//***Tanks/TDs***/
		["B_AFV_Wheeled_01_cannon_F", 500], //Rhino
		["B_AFV_Wheeled_01_up_cannon_F", 500], //Rhino UP
		["B_MBT_01_cannon_F", 600], //Slammer
		["B_MBT_01_TUSK_F", 600], //Slammer UP
	//***Helicopters/VTOLs***/
		["B_Heli_Light_01_dynamicLoadout_F", 300], //Pawnee
		["B_Heli_Attack_01_dynamicLoadout_F", 700], //Blackfoot
		["B_T_UAV_03_dynamicLoadout_F", 600], //Falcon
		["B_T_VTOL_01_armed_F", 500], //Blackfish Armed
	//***Planes***/
		["B_UAV_02_dynamicLoadout_F", 500], //Greyhawk
		["B_UAV_05_F", 500], //Sentinel
		["B_Plane_CAS_01_dynamicLoadout_F", 900], //Wipeout
		["I_Plane_Fighter_04_F", 900], //Gryphon
		["B_Plane_Fighter_01_F", 900], //Black Wasp
		["B_Plane_Fighter_01_Stealth_F", 900], //Black Wasp Stealth
	//***Artillery***/
		["B_MBT_01_arty_F", 1800], //Scorcher
		["B_MBT_01_mlrs_F", 1800], //Sandstorm
	//***Statics***/
		["B_Mortar_01_F", 900], //Mortar
		["B_Ship_Gun_01_F", 2700], //Hammer
		["B_SAM_System_03_F", 450], //Defender

//***Shared***/
		["B_AAA_System_01_F", 300], //Praetorian
		["B_SAM_System_01_F", 600], //Spartan
		["B_SAM_System_02_F", 600], //Centurion
		["B_Ship_MRLS_01_F", 2700], //VLS

//***Opfor***/
	//***Light***/
		["O_G_Offroad_01_armed_F", 120], //Offroad Armed
		["O_G_Offroad_01_AT_F", 180], //Offroad AT
		["O_LSV_02_armed_F", 120], //Quilin
		["O_LSV_02_AT_F", 200], //Quilin AT
		["O_MRAP_02_hmg_F", 300], //Ifrit HMG
		["O_MRAP_02_gmg_F", 300], //Ifrit GMG
	//***APC/IFV***/
		["O_APC_Wheeled_02_rcws_v2_F", 400], //Marid
		["O_APC_Tracked_02_cannon_F", 500], //Kamysh
		["O_APC_Tracked_02_AA_F", 500], //Tigris
	//***Tanks/TDs***/
		["O_MBT_02_cannon_F", 600], //T-100
		["O_MBT_02_railgun_F", 600], //T-100X
		["O_MBT_04_cannon_F", 600], //T-140
		["O_MBT_04_command_F", 600], // T-140K
	//***Helicopters/VTOLs***/
		["O_Heli_Light_02_dynamicLoadout_F", 300], //Orca Armed
		["O_Heli_Attack_02_dynamicLoadout_F", 700], //Kajman
		["O_T_VTOL_02_vehicle_dynamicLoadout_F", 700], //Xi'an
	//***Planes***/
		["O_UAV_02_dynamicLoadout_F", 330], //Ababil-3
		["O_T_UAV_04_CAS_F", 500], //Fenghuang
		["I_Plane_Fighter_03_dynamicLoadout_F", 900], //Buzzard
		["O_Plane_CAS_02_dynamicLoadout_F", 900], //Neophron
		["O_Plane_Fighter_02_F", 900], //Shikra
		["O_Plane_Fighter_02_Stealth_F", 900], //Shikra Stealth
	//***Artillery***/
		["O_MBT_02_arty_F", 1800], //Sorcher
		["I_Truck_02_MRL_F", 1800], //Zamak MLRS
	//***Statics***/
		["O_Mortar_01_F", 900], //Mortar
		["O_SAM_System_04_F", 450] //Rhea
	]
];