//db EH
"fundsDatabaseClients" addPublicVariableEventHandler {
	[] spawn BIS_fnc_WL2_refreshOSD;
};

//Voice system EH
player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	VIC_ENTERED = true;
	if ((typeOf _vehicle == "B_Plane_Fighter_01_F") || {(typeOf _vehicle == "B_Plane_CAS_01_dynamicLoadout_F") || {(typeOf _vehicle == "B_Heli_Attack_01_dynamicLoadout_F") || {(typeOf _vehicle == "B_T_VTOL_01_armed_F") || {(typeOf _vehicle == "B_T_VTOL_01_vehicle_F") || {(typeOf _vehicle == "B_T_VTOL_01_infantry_F")}}}}}) then  {
		[["voiceWarningSystem", "betty"], 0, "", 25, "", false, true, false, true] call BIS_fnc_advHint;
		0 spawn BIS_fnc_WL2_betty;
	};
	if ((typeOf _vehicle == "O_Plane_Fighter_02_F") || {(typeOf _vehicle == "O_Plane_CAS_02_dynamicLoadout_F") || {(typeOf _vehicle == "O_Heli_Attack_02_dynamicLoadout_F") || {(typeOf _vehicle == "O_T_VTOL_02_vehicle_dynamicLoadout_F")}}}) then {
		[["voiceWarningSystem", "rita"], 0, "", 25, "", false, true, false, true] call BIS_fnc_advHint;
		0 spawn BIS_fnc_WL2_rita;
	};
}];

//Inv block EH
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

//Last loadout EH
player addEventHandler ["Killed", {
	BIS_WL_loadoutApplied = FALSE;
	["RequestMenu_close"] call BIS_fnc_WL2_setupUI;
	
	BIS_WL_lastLoadout = +getUnitLoadout player;
	private _varName = format ["BIS_WL_purchasable_%1", BIS_WL_playerSide];
	private _gearArr = (missionNamespace getVariable _varName) # 5;
	private _lastLoadoutArr = _gearArr # 0;
	private _text = _savedLoadoutArr # 5;
	private _text = localize "STR_A3_WL_last_loadout_info";
	_text = _text + "<br/><br/>";
	{
		switch (_forEachIndex) do {
			case 0;
			case 1;
			case 2;
			case 3;
			case 4: {
				if (count _x > 0) then {
					_text = _text + (getText (configFile >> "CfgWeapons" >> _x # 0 >> "displayName")) + "<br/>";
				};
			};
			case 5: {
				if (count _x > 0) then {
					_text = _text + (getText (configFile >> "CfgVehicles" >> _x # 0 >> "displayName")) + "<br/>";
				};
			};
		};
	} forEach BIS_WL_lastLoadout;
	_lastLoadoutArr set [5, _text];
	_gearArr set [0, _lastLoadoutArr];
	(missionNamespace getVariable _varName) set [5, _gearArr];

	_connectedUAV = getConnectedUAV player;
	if (_connectedUAV != objNull) exitWith {
		player connectTerminalToUAV objNull;
	};
}];

//Safezone EH
player addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];
	_base = (([BIS_WL_base1, BIS_WL_base2] select {(_x getVariable "BIS_WL_owner") == (side group _unit)}) # 0);
	if ((_unit inArea (_base getVariable "objectAreaComplete")) && {((_base getVariable ["BIS_WL_baseUnderAttack", false]) == false)}) then {
		0;
	} else {
		_damage;
	};
}];

//Marker EH
addMissionEventHandler ["MarkerCreated", {
	params ["_marker", "_channelNumber", "_owner", "_local"];
	
	if ((isPlayer _owner) && {(_channelNumber == 0)}) then {
		deleteMarker _marker;
	};
}];

//Key press EH
0 spawn {
	waituntil {sleep 0.1; !isnull (findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["KeyDown", {
		params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
		private _settingsKey = actionKeysNames "user2";
		private _groupKey = actionKeysNames "user3";
		private _emotesKey = actionKeysNames "user4";
		private _keyName = (keyName _key);
		
		if (_keyName == _settingsKey) exitWith {
			private _d = [4000, 5000, 6000, 7000, 8000];
			{
				if !(isNull (findDisplay _x)) then {
					(findDisplay _x) closeDisplay 1;
				};
			} forEach _d;
			0 spawn MRTM_fnc_openMenu;
		};
		if (_keyName == _groupKey) exitWith {
			private _d = [4000, 5000, 6000, 7000, 8000];
			{
				if !(isNull (findDisplay _x)) then {
					(findDisplay _x) closeDisplay 1;
				};
			} forEach _d;
			0 spawn MRTM_fnc_openGroupMenu;
		};
		if (_keyName == _emotesKey) exitWith {
			private _d = [4000, 5000, 6000, 7000, 8000];
			{
				if !(isNull (findDisplay _x)) then {
					(findDisplay _x) closeDisplay 1;
				};
			} forEach _d;
			0 spawn MRTM_fnc_openEmoteMenu;
		};

		private _zeusKey = actionKeysNames "curatorInterface";
		private _viewKey = actionKeysNames "tacticalView";
		private _e = false;
		_e = (_keyName == _zeusKey && {!((getPlayerUID player) in (getArray (missionConfigFile >> "adminIDs")))});
		_e = (_keyName == _viewKey);
		_e;
	}];
};