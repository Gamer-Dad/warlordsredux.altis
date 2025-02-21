#include "..\warlords_constants.inc"

player addEventHandler ["HandleRating", {
	params ["_unit", "_rating"];
	0;
}];

player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	VIC_ENTERED = true;
	if ((typeOf _vehicle == "B_Plane_Fighter_01_F") || {(typeOf _vehicle == "B_Plane_CAS_01_dynamicLoadout_F") || {(typeOf _vehicle == "B_Heli_Attack_01_dynamicLoadout_F") || {(typeOf _vehicle == "B_T_VTOL_01_armed_F") || {(typeOf _vehicle == "B_T_VTOL_01_vehicle_F") || {(typeOf _vehicle == "B_T_VTOL_01_infantry_F")}}}}}) then  {
		0 spawn WL2_fnc_betty;
	};
	if ((typeOf _vehicle == "O_Plane_Fighter_02_F") || {(typeOf _vehicle == "O_Plane_CAS_02_dynamicLoadout_F") || {(typeOf _vehicle == "O_Heli_Attack_02_dynamicLoadout_F") || {(typeOf _vehicle == "O_T_VTOL_02_vehicle_dynamicLoadout_F")}}}) then {
		0 spawn WL2_fnc_rita;
	};
	if ((_vehicle getVariable "BIS_WL_ownerAsset") == (getPlayerUID player)) then {
		_vehicle setVariable ["BIS_WL_lastActive", 0];
	};
	[_vehicle] spawn WL2_fnc_drawAssetName;
}];

player addEventHandler ["SeatSwitchedMan", {
	params ["_unit1", "_unit2", "_vehicle"];
	[_vehicle] spawn WL2_fnc_drawAssetName;
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
	"RequestMenu_close" call WL2_fnc_setupUI;

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
	private _homeBase = ([BIS_WL_base1, BIS_WL_base2] select {
		(_x getVariable "BIS_WL_owner") == (side group _unit)
	}) # 0;
	private _baseUnderAttack = _homeBase getVariable ["BIS_WL_baseUnderAttack", false];
	private _inHomeBase = _unit inArea (_homeBase getVariable "objectAreaComplete");

	if (_inHomeBase && !_baseUnderAttack) then {
		0;
	} else {
		if (_damage >= 1) then {
			_unit setUnconscious true;
			_unit setCaptive true;
			moveOut _unit;
			[_unit] spawn {
				params ["_unit"];
				private _unconsciousTime = _unit getVariable ["WL_unconsciousTime", 0];
				if (_unconsciousTime > 0) exitWith {};

				private _startTime = serverTime;
				private _downTime = 0;
				while { alive _unit && lifeState _unit == "INCAPACITATED" && _downTime < 90 } do {
					_downTime = serverTime - _startTime;
					hintSilent format ["Downed for %1", round _downTime];
					_unit setVariable ["WL_unconsciousTime", _downTime];
					sleep 1;
				};
				hintSilent "";
				_downTime = serverTime - _startTime;
				if (_downTime >= 90) then {
					setPlayerRespawnTime 5;
					forceRespawn _unit;
				};
			};
			[_unit, _source, _instigator] remoteExec ["WL2_fnc_handleEntityRemoval", 2];
			0.99;
		} else {
			_damage;
		};
	};
}];

player addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret", "_isEject"];
	if (((_vehicle getVariable "BIS_WL_ownerAsset") == (getPlayerUID player)) && (pricehash getOrDefault [typeOf _vehicle, 300] <= 200)) then {
		_vehicle setVariable ["BIS_WL_lastActive", serverTime + 600];
	};
}];

player addEventHandler ["InventoryOpened", {
	params ["_unit", "_container", "_secondaryContainer"];

    private _access = [_container, player, "cargo"] call WL2_fnc_accessControl;
    if !(_access # 0) then {
        systemChat format ["Inventory locked. (%1)", _access # 1];
        playSoundUI ["AddItemFailed"];
        true;
    } else {
        false;
    };
}];

player addEventHandler ["Fired", {
	params ["_unit", "_object", "_score"];
	WAS_fired = true;
}];

player addEventHandler ["Respawn", {
    params ["_unit", "_corpse"];

    private _voiceChannels = missionNamespace getVariable ["SQD_VoiceChannels", [-1, -1]];
    switch (side group _unit) do {
        case WEST: {
            _sideCustomChannel = _voiceChannels # 0;
            _sideCustomChannel radioChannelAdd [_unit];
        };
        case EAST: {
            _sideCustomChannel = _voiceChannels # 1;
            _sideCustomChannel radioChannelAdd [_unit];
        };
    };
}];