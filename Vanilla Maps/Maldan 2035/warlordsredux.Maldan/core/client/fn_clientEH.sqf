#include "..\warlords_constants.inc"

private _voteLocked = missionNamespace getVariable ["voteLocked", true];
private _start = serverTime + 10;
waitUntil {sleep 0.1; !_voteLocked || (_start < serverTime);};
if (_voteLocked) exitwith {};

"fundsDatabaseClients" addPublicVariableEventHandler {
	false spawn WL2_fnc_refreshOSD;
};

addMissionEventHandler ["GroupIconClick", WL2_fnc_groupIconClickHandle];
addMissionEventHandler ["GroupIconOverEnter", WL2_fnc_groupIconEnterHandle];
addMissionEventHandler ["GroupIconOverLeave", WL2_fnc_groupIconLeaveHandle];

call WL2_fnc_playerEventHandlers;

addMissionEventHandler ["HandleChatMessage", {
	params ["_channel", "_owner", "_from", "_text", "_person", "_name"];

	if (_owner == clientOwner) then {
		private _uid = getPlayerUID player;
		private _isAdmin = _uid in (getArray (missionConfigFile >> "adminIDs"));
		private _isPollster = _uid in (getArray (missionConfigFile >> "pollstersIDs"));

		if (_isAdmin && _text == "!updateZeus") then {
			[player, 'updateZeus'] remoteExec ['WL2_fnc_handleClientRequest', 2];
		};

		if (_text == "!lag") then {
			[player] remoteExec ["WL2_fnc_lagMessageHandler", 2];
		};

		if (_text == "!lowfps") then {
			0 spawn {
				private _messageTemplate = "Client FPS: %1\nClient FPS Min: %2\nEntities Count: %3\nScripts[1]: %4\nScripts[2]: %5\nScripts[3]: %6";
				private _message = [_messageTemplate] call WL2_fnc_scriptCollector;
				[_message] call WL2_fnc_lagMessageDisplay;
			};
		};

		if (_isAdmin || _isPollster) then {
			[_text] call POLL_fnc_chatCommand;
		};
	};

	private _disallowList = getArray (missionConfigFile >> "adminFilter");
	private _containsBannedWord = (_disallowList findIf {
		[_x, toLower _text] call BIS_fnc_inString
	}) != -1;
	private _senderLocked = _person getVariable ["voteLocked", false];

	private _voiceChannels = missionNamespace getVariable ["SQD_VoiceChannels", [-1, -1]];
	private _sideCustomChannel = if (side group _person == WEST) then {
		_voiceChannels # 0
	} else {
		_voiceChannels # 1
	};

	private _outOfSquad = if (_channel == (_sideCustomChannel + 5)) then {
		private _playerId = getPlayerID _person;
		private _isInMySquad = ["isInMySquad", [_playerId]] call SQD_fnc_client;
		!_isInMySquad;
	} else {
		false;
	};

	private _block = _containsBannedWord || _senderLocked || _outOfSquad;
	if (_block) then {
		true;
	} else {
		if (_channel == 1) then {
			private _playerLevel = _person getVariable ["WL_playerLevel", ""];
			private _newFrom = format ["[%1] %2", _playerLevel, _name];
			[_newFrom, _text];
		} else {
			false;
		};
	};
}];

0 spawn {
	waituntil {sleep 0.1; !isnull (findDisplay 46)};
	private _display = findDisplay 46;
	_display displayAddEventHandler ["KeyUp", {
		_key = _this # 1;
		if (_key in actionKeys "Gear") then {
			BIS_WL_gearKeyPressed = false;
		};
	}];

	_display displayAddEventHandler ["KeyDown", {
		_this call WL2_fnc_handleKeypress;
	}];

	// intentionally separate handler
	_display displayAddEventHandler ["KeyDown", {
		private _key = _this # 1;
		[_key] call WL2_fnc_handleBuyMenuKeypress;
	}];

	while { !BIS_WL_missionEnd } do {
		private _purchaseMenu = uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull];
		if (isNull _purchaseMenu) then {
			WL_GEAR_BUY_MENU = false;
			WL_CONTROL_MAP ctrlEnable true;
		};
		sleep 1;
	};
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
		} forEach _category;
	};
} forEach _fullList;

addMissionEventHandler ["EntityCreated", {
	params ["_entity"];
	if (!local _entity) exitWith {};
	_entityType = (typeOf _entity);
	if (isClass (configFile >> "CfgAmmo" >> _entityType)) then {
		_minesDB = (missionNamespace getVariable [format ["BIS_WL2_minesDB_%1", getPlayerUID player], []]);
		if ((_minesDB getOrdefault [_entityType, 0]) isEqualType []) then {
			_limit = (_minesDB get _entityType) # 0;
			_mines = ((_minesDB get _entityType) # 1) select {alive _x};
			if (count _mines >= _limit) then {
				private _t = _mines find objNull;
				if (_t != -1) then {_mines deleteAt _t;};
					if (count _mines >= _limit) then {
						deleteVehicle _entity;
						missionNameSpace setVariable ["mineDisplayActive", serverTime + 5];
						return;
					} else {
						_mines pushBack _entity;
						_minesDB set [_entityType, [_limit, _mines]];
					};
				} else {
				_mines pushBack _entity;
				_minesDB set [_entityType, [_limit, _mines]];
			};
			missionNameSpace setVariable ["mineDisplayActive", serverTime + 5];
			missionNamespace setVariable [format ["BIS_WL2_minesDB_%1", getPlayerUID player], _minesDB, [2, clientOwner]];
		};
	};
}];

addMissionEventHandler ["EntityRespawned", {
	params ["_newEntity", "_oldEntity"];
	private _wasMan = _oldEntity getEntityInfo 0;
	if (_wasMan) then {
		removeAllActions _oldEntity;
	};
}];