params [["_sender", objNull, [objNull]], ["_action", "", [""]], "_param1", "_param2", "_param3", "_param4"];

if (isNull _sender) exitWith {};
if !(isServer) exitWith {};
if (remoteExecutedOwner != (owner _sender)) exitWith {};

#include "..\server_macros.inc"
_uid = getPlayerUID _sender;

private _broadcastActionToSide = {
	params ["_side", "_message"];
	{
		[[_side, "Base"], _message] remoteExec ["commandChat", owner _x];
	} forEach (allPlayers select {side group _x == _side});
};

if (_action == "orderAsset") exitWith {
	private _position = _param1;
	private _class = _param2;

	// Griefer check
	private _nearbyEntities = [];
	if (!(_class isKindOf "Air") && !(isNil "_param4")) then {
		private _simulatedObject = [_class, ATLToASL _position, _param4, true, false, true] call BIS_fnc_createSimpleObject;

		private _circleA = boundingBoxReal [_simulatedObject, "FireGeometry"];
		private _radiusA = _circleA select 2;

		private _BUFFER = 1;
		_nearbyEntities = _simulatedObject nearEntities 30 select {
			private _circleB = boundingBoxReal [_x, "FireGeometry"];
			private _radiusB = _circleB select 2;
			private _assetOwner = _x getVariable ["BIS_WL_ownerAsset", "notAsset"];

			(_x distance _simulatedObject) < (_radiusA + _radiusB + _BUFFER)
			&& !(_x isKindOf "Man") 
			&& _assetOwner != "notAsset"
			&& _uid != (_x getVariable ["BIS_WL_ownerAsset", "123"])
		};

		deleteVehicle _simulatedObject;
	};

	if (count _nearbyEntities > 0) exitWith {
		private _owner = owner _sender;
		_sender setVariable ["BIS_WL_isOrdering", false, [2, _owner]];

		private _nearbyObject = _nearbyEntities # 0;
		private _nearbyObjectName = getText (configFile >> "CfgVehicles" >> typeOf _nearbyObject >> "displayName");
		private _nearbyObjectPosition = getPosASL _nearbyObject;

		playSound3D ["a3\3den\data\sound\cfgsound\notificationwarning.wss", objNull, false, _nearbyObjectPosition, 5];
		[format ["Too close to another %1!", _nearbyObjectName]] remoteExec ["systemChat", _owner];
	};

	private _cost = ((serverNamespace getVariable "WL2_costs") getOrDefault [_param2, 50001]);
	private _hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call BIS_fnc_WL2_fundsDatabaseWrite;
		if (_class isKindOf "Ship") exitWith {
			[_sender, _position, _class] spawn BIS_fnc_orderNaval;
		};

		if (_class isKindOf "Air") exitWith {
			[_sender, _param1, _class, _cost] spawn BIS_fnc_orderAir;
		};

		if (_param3) exitWith {
			[_sender, _position, _class, _param4] spawn BIS_fnc_orderDefence;
		};

		[_sender, _position, _class, _param4] spawn BIS_fnc_orderGround;
	};
};

if (_action == "lastLoadout") exitWith {
	_cost = (getMissionConfigValue ["BIS_WL_lastLoadoutCost", 100]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call BIS_fnc_WL2_fundsDatabaseWrite;

		0 remoteExec ["BIS_fnc_WL2_orderLastLoadout", remoteExecutedOwner];
	};
};

if (_action == "savedLoadout") exitWith {
	_cost = (getMissionConfigValue ["BIS_WL_savedLoadoutCost", 500]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call BIS_fnc_WL2_fundsDatabaseWrite;

		["apply"] remoteExec ["BIS_fnc_WL2_orderSavedLoadout", remoteExecutedOwner];
	};
};

if (_action == "orderArsenal") exitWith {
	_cost = (getMissionConfigValue ["BIS_WL_arsenalCost", 1000]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call BIS_fnc_WL2_fundsDatabaseWrite;	

		0 remoteExec ["BIS_fnc_WL2_orderArsenal", remoteExecutedOwner];
	};
};

if (_action == "fastTravelContested") exitWith {
	_cost = (getMissionConfigValue ["BIS_WL_fastTravelCostContested", 200]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call BIS_fnc_WL2_fundsDatabaseWrite;
	};
};

if (_action == "fastTravelSquadLeader") exitWith {
	_cost = (getMissionConfigValue ["BIS_WL_fastTravelCostSquadLeader", 10]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call BIS_fnc_WL2_fundsDatabaseWrite;
	};
};

private _side = side group _sender;
if (_action == "scan") exitWith {
	_cost = (getMissionConfigValue ["BIS_WL_scanCost", 750]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call BIS_fnc_WL2_fundsDatabaseWrite;

		private _sectorName = _param2 getVariable ["BIS_WL_name", "???"];
		private _message = format ["%1 has initiated sector scan on %2.", name _sender, _sectorName];
		[_side, _message] call _broadcastActionToSide;

		_param2 setVariable [format ["BIS_WL_lastScanEnd_%1", _side], (serverTime + 30), true];
		_revealTrigger = createTrigger ["EmptyDetector", position _param2];
		_revealTrigger setTriggerArea (_param2 getVariable "objectArea");
		_revealTrigger setTriggerActivation ["ANY", "PRESENT", false];
		_param2 setVariable ["BIS_WL_revealTrigger", _revealTrigger, true];
		[_param2, _side] remoteExec ["BIS_fnc_WL2_sectorScanHandle", [0, -2] select isDedicated];
		waitUntil {sleep 0.25; BIS_WL_competingSides findIf {(_param2 getVariable [format ["BIS_WL_lastScanEnd_%1", _x], -9999]) > serverTime} == -1};
		deleteVehicle _revealTrigger;
		_param2 setVariable ["BIS_WL_revealTrigger", nil, true];
	};
};

if (_action == "orderFTVehicle") exitWith {
	_cost = (getMissionConfigValue ["BIS_WL_orderFTVehicleCost", 200]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call BIS_fnc_WL2_fundsDatabaseWrite;

		if ((count ((entities getFTVehicle) select {alive _x})) == 0) then {
			_asset = createVehicle [getFTVehicle, _sender, [], 0, "NONE"];
			_asset setVariable ["BIS_WL_ownerAsset", _uid, [2, (owner _sender)]];
			_asset setVariable ["BIS_WL_rewardedStack", createHashMap];
			
			_asset spawn {
				_asset = _this;
				while {alive _asset} do {
					// wipe the reward stack every 2 minutes
					sleep 120;
					_asset setVariable ["BIS_WL_rewardedStack", createHashMap];
				};
			};

			[_asset, _sender] remoteExec ["BIS_fnc_WL2_newAssetHandle", remoteExecutedOwner];
		};
	};
};

if (_action == "orderFTPod") exitWith {
	_cost = (getMissionConfigValue ["BIS_WL_orderFTVehicleCost", 200]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call BIS_fnc_WL2_fundsDatabaseWrite;

		if ((count (entities getFTPod)) == 0) then {
			_asset = createVehicle [getFTPod, _sender, [], 0, "NONE"];
			_asset setVariable ["BIS_WL_ownerAsset", _uid, [2, (owner _sender)]];
			_asset setVariable ["BIS_WL_rewardedStack", createHashMap];

			_asset spawn {
				_asset = _this;
				while {alive _asset} do {
					sleep 120;
					_asset setVariable ["BIS_WL_rewardedStack", createHashMap];
				};
			};

			[_asset, _sender] remoteExec ["BIS_fnc_WL2_newAssetHandle", remoteExecutedOwner];
		};
	};
};

if (_action == "ftSupportPoints") exitWith {
	private _ftVehicle = _param1;
	private _reward = 5;

	private _targets = [
		missionNamespace getVariable "BIS_WL_currentTarget_west", 
		missionNamespace getVariable "BIS_WL_currentTarget_east"
	] select {
		!(isNull _x)
	};

	if ((_targets findIf {_sender inArea (_x getVariable "objectAreaComplete")}) != -1) then {	
		_reward = 10;
	};

	private _ftVehicleOwner = _ftVehicle getVariable ["BIS_WL_ownerAsset", "123"];
	private _rewardStack = _ftVehicle getVariable ["BIS_WL_rewardedStack", createHashMap];

	private _eligible = !(_rewardStack getOrDefault [getPlayerUID _sender, false]) && _ftVehicleOwner != _uid;
	if (_eligible) then {
		_uid = _ftVehicleOwner;
		_reward call BIS_fnc_WL2_fundsDatabaseWrite;

		_rewardStack set [getPlayerUID _sender, true];
		_ftVehicle setVariable ["BIS_WL_rewardedStack", _rewardStack];

		[objNull, _reward, false, localize "STR_A3_spawn_reward"] remoteExec ["BIS_fnc_WL2_killRewardClient", _ftVehicleOwner];
	};
};

if (_action == "targetReset") exitWith {
	_cost = (getMissionConfigValue ["BIS_WL_targetResetCost", 500]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call BIS_fnc_WL2_fundsDatabaseWrite;

		missionNamespace setVariable [format ["BIS_WL_targetResetVotingSince_%1", _side], serverTime, true];
		missionNamespace setVariable [format ["BIS_WL_targetResetOrderedBy_%1", _side], name _sender, true];
		_sender setVariable ["BIS_WL_targetResetVote", 1, [2, remoteExecutedOwner]];

		_side spawn BIS_fnc_WL2_targetResetHandleServer;
		[_side] remoteExec ["BIS_fnc_WL2_targetResetHandleVote", [0, -2] select isDedicated];

		private _message = format ["%1 has initiated a vote to reset the target sector.", name _sender];
		[_side, _message] call _broadcastActionToSide;
	};
};

if (_action == "orderAI") exitWith {
	_cost = ((serverNamespace getVariable "WL2_costs") getOrDefault [_param1, 150]);
	(-_cost) call BIS_fnc_WL2_fundsDatabaseWrite;
};

if (_action == "fundsTransfer") exitWith {
	if (playerFunds >= _param1) then {
		_uid = getPlayerUID _param2;
		_param1 call BIS_fnc_WL2_fundsDatabaseWrite;
		_uid = getPlayerUID _sender;
		(-_param1) call BIS_fnc_WL2_fundsDatabaseWrite;
		serverNamespace setVariable [format ["BIS_WL_isTransferring_%1", _uid], false];

		private _message = format [localize "STR_A3_WL_donate_cp", name _sender, name _param2, _param1];
		[_side, _message] call _broadcastActionToSide;
	};
};

if (_action == "fundsTransferCancel") exitWith {
	if (serverNamespace getVariable (format ["BIS_WL_isTransferring_%1", _uid])) then {
		(getMissionConfigValue ["BIS_WL_fundsTransferCost", 2000]) call BIS_fnc_WL2_fundsDatabaseWrite;
		serverNamespace setVariable [format ["BIS_WL_isTransferring_%1", _uid], false];
	};
};

if (_action == "fundsTransferBill") exitWith {
	(-(getMissionConfigValue ["BIS_WL_fundsTransferCost", 2000])) call BIS_fnc_WL2_fundsDatabaseWrite;
	
	serverNamespace setVariable [format ["BIS_WL_isTransferring_%1", _uid], true];
};

if (_action == "repair") exitWith {
	if ((!isNil {_param1}) && {_param1 <= serverTime}) then {
		_param3 setDamage _param2;
	};
};

if (_action == "kill") exitWith {
	_sender setDamage 1;
};

if (_action == "10K") exitWith {
	if !(["(EU) #11", serverName] call BIS_fnc_inString) then {
		10000 call BIS_fnc_WL2_fundsDatabaseWrite;
	};
};

if (_action == "updateZeus") exitWith {
	if (getPlayerUID _sender in (getArray (missionConfigFile >> "adminIDs"))) then {
		{
			_l = (vehicles + allUnits) select {(typeOf _x != "Logic") && {(alive _x) && {side group _x != civilian}}};
			_x addCuratorEditableObjects [_l, true];
		} forEach allCurators;
	};
};

if (_action == "droneExplode") then {
	_expl = createVehicle ["IEDUrbanBig_Remote_Ammo", (getPos getConnectedUAV _sender), [], 0, "FLY"]; 
	_expl setShotParents [getConnectedUAV _sender, _sender];
	triggerAmmo _expl; 
	deleteVehicle (getConnectedUAV player);
}