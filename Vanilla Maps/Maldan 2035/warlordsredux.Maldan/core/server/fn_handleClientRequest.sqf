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
	private _orderType = _param1;
	private _position = _param2;
	private _orderedClass = _param3;

	private _cost = ((serverNamespace getVariable "WL2_costs") getOrDefault [_orderedClass, 50001]);
	private _hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call WL2_fnc_fundsDatabaseWrite;

		switch (_orderType) do {
			case "air" : {
				[_sender, _position, _orderedClass, _cost] spawn WL2_fnc_orderAir;
			};
			case "naval" : {
				[_sender, _position, _orderedClass] spawn WL2_fnc_orderWater;
			};
			default {
				private _direction = _param4;
				[_sender, _position, _orderedClass, _direction] spawn WL2_fnc_orderGround;
			};
		};
	};
};

if (_action == "resetVehicle") exitWith {
	private _cost = 10;
	private _hasFunds = playerFunds >= _cost;
	private _asset = _param1;
	private _position = _param2;
	private _direction = _param3;
	if (_hasFunds) then {
		(-_cost) call WL2_fnc_fundsDatabaseWrite;
		_asset setDir _direction;
		_asset setVehiclePosition [_position, [], 0, "CAN_COLLIDE"];
	};
};

if (_action == "equip") exitWith {
	private _cost = _param1 max 0;
	(-_cost) call WL2_fnc_fundsDatabaseWrite;
};

if (_action == "buySectorHQ") exitWith {
	private _cost = 3000;
	private _hasFunds = playerFunds >= _cost;
	if (_hasFunds) then {
		(-_cost) call WL2_fnc_fundsDatabaseWrite;
	};
};

if (_action == "lastLoadout") exitWith {
	_cost = (getMissionConfigValue ["BIS_WL_lastLoadoutCost", 100]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call WL2_fnc_fundsDatabaseWrite;

		0 remoteExec ["WL2_fnc_orderLastLoadout", remoteExecutedOwner];
	};
};

if (_action == "savedLoadout") exitWith {
	_cost = (getMissionConfigValue ["BIS_WL_savedLoadoutCost", 500]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call WL2_fnc_fundsDatabaseWrite;

		["apply"] remoteExec ["WL2_fnc_orderSavedLoadout", remoteExecutedOwner];
	};
};

if (_action == "orderArsenal") exitWith {
	_cost = (getMissionConfigValue ["BIS_WL_arsenalCost", 1000]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call WL2_fnc_fundsDatabaseWrite;

		0 remoteExec ["WL2_fnc_orderArsenal", remoteExecutedOwner];
	};
};

if (_action == "fastTravelContested") exitWith {
	_cost = _param1;
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call WL2_fnc_fundsDatabaseWrite;
	};
};

if (_action == "fastTravelSquadLeader") exitWith {
	_cost = (getMissionConfigValue ["BIS_WL_fastTravelCostSquadLeader", 10]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call WL2_fnc_fundsDatabaseWrite;
	};
};

private _side = side group _sender;
if (_action == "scan") exitWith {
	_cost = (getMissionConfigValue ["BIS_WL_scanCost", 750]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call WL2_fnc_fundsDatabaseWrite;

		private _sectorName = _param2 getVariable ["BIS_WL_name", "???"];
		private _message = format ["%1 has initiated sector scan on %2.", name _sender, _sectorName];
		[_side, _message] call _broadcastActionToSide;

		_param2 setVariable [format ["BIS_WL_lastScanEnd_%1", _side], (serverTime + 30), true];
		_revealTrigger = createTrigger ["EmptyDetector", position _param2];
		_revealTrigger setTriggerArea (_param2 getVariable "objectArea");
		_revealTrigger setTriggerActivation ["ANY", "PRESENT", false];
		_param2 setVariable ["BIS_WL_revealTrigger", _revealTrigger, true];
		[_param2, _side] remoteExec ["WL2_fnc_sectorScanHandle", [0, -2] select isDedicated];

		waitUntil {sleep 0.25; BIS_WL_competingSides findIf {(_param2 getVariable [format ["BIS_WL_lastScanEnd_%1", _x], -9999]) > serverTime} == -1};
		deleteVehicle _revealTrigger;
		_param2 setVariable ["BIS_WL_revealTrigger", nil, true];
	};
};

if (_action == "orderFTVehicle") exitWith {
	_cost = (getMissionConfigValue ["BIS_WL_orderFTVehicleCost", 200]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call WL2_fnc_fundsDatabaseWrite;

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

			[_asset, _sender] remoteExec ["WL2_fnc_newAssetHandle", remoteExecutedOwner];
		};
	};
};

if (_action == "orderFTPod") exitWith {
	_cost = (getMissionConfigValue ["BIS_WL_orderFTVehicleCost", 200]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call WL2_fnc_fundsDatabaseWrite;

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

			[_asset, _sender] remoteExec ["WL2_fnc_newAssetHandle", remoteExecutedOwner];
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
	private _ftOwnerPlayer = (allPlayers select {getPlayerUID _x == _ftVehicleOwner}) # 0;

	private _eligible = !(_rewardStack getOrDefault [getPlayerUID _sender, false]) && _ftVehicleOwner != _uid;
	if (_eligible) then {
		_uid = _ftVehicleOwner;
		_reward call WL2_fnc_fundsDatabaseWrite;

		_rewardStack set [getPlayerUID _sender, true];
		_ftVehicle setVariable ["BIS_WL_rewardedStack", _rewardStack];


		[objNull, _reward, localize "STR_A3_spawn_reward"] remoteExec ["WL2_fnc_killRewardClient", _ftOwnerPlayer];
	};
};

if (_action == "targetReset") exitWith {
	_cost = (getMissionConfigValue ["BIS_WL_targetResetCost", 500]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call WL2_fnc_fundsDatabaseWrite;

		missionNamespace setVariable [format ["BIS_WL_targetResetVotingSince_%1", _side], serverTime, true];
		missionNamespace setVariable [format ["BIS_WL_targetResetOrderedBy_%1", _side], name _sender, true];
		_sender setVariable ["BIS_WL_targetResetVote", 1, [2, remoteExecutedOwner]];

		_side spawn WL2_fnc_targetResetHandleServer;
		[_side] remoteExec ["WL2_fnc_targetResetHandleVote", [0, -2] select isDedicated];

		private _message = format ["%1 has initiated a vote to reset the target sector.", name _sender];
		[_side, _message] call _broadcastActionToSide;
	};
};

if (_action == "orderAI") exitWith {
	_cost = ((serverNamespace getVariable "WL2_costs") getOrDefault [_param1, 150]);
	(-_cost) call WL2_fnc_fundsDatabaseWrite;
};

if (_action == "orderRespawnBag") exitWith {
	_cost = 50;
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call WL2_fnc_fundsDatabaseWrite;
	};
};

if (_action == "fundsTransfer") exitWith {
	private _incomeBlocked = serverNamespace getVariable ["BIS_WL_incomeBlockedList", []];
	private _transferCost = getMissionConfigValue ["BIS_WL_fundsTransferCost", 2000];
	private _transferAmount = _param1;
	private _recipient = _param2;
	if (playerFunds >= (_transferAmount + _transferCost)) then {
		_uid = getPlayerUID _recipient;
		if !(_uid in _incomeBlocked) then {
			_transferAmount call WL2_fnc_fundsDatabaseWrite;

      		private _oldTransfer = serverNamespace getVariable [format ["BIS_WL_WLAC_%1", _uid], 0];
		  	serverNamespace setVariable [format ["BIS_WL_WLAC_%1", _uid], _oldTransfer + _transferAmount];

			_uid = getPlayerUID _sender;
			-(_transferAmount + _transferCost) call WL2_fnc_fundsDatabaseWrite;

			serverNamespace setVariable [format ["BIS_WL_isTransferring_%1", _uid], false];

			private _sentMoney = format ["%1%2", [_side] call WL2_fnc_getMoneySign, _transferAmount];
			private _message = format [localize "STR_A3_WL_donate_cp", name _sender, name _recipient, _sentMoney];

			[_side, _message] call _broadcastActionToSide;
		};
	};
};

if (_action == "fundsTransferCancel") exitWith {
	if (serverNamespace getVariable (format ["BIS_WL_isTransferring_%1", _uid])) then {
		serverNamespace setVariable [format ["BIS_WL_isTransferring_%1", _uid], false];
	};
};

if (_action == "fundsTransferBill") exitWith {
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
		10000 call WL2_fnc_fundsDatabaseWrite;
	};
};

if (_action == "updateZeus") exitWith {
	if (getPlayerUID _sender in (getArray (missionConfigFile >> "adminIDs"))) then {
		private _allEntities = entities [[], ["Logic"], true];
		private _allNonLocalEntities = _allEntities select { owner _x != 0 };
		{
			_x addCuratorEditableObjects [_allNonLocalEntities, true];
		} forEach allCurators;
	};
};

if (_action == "droneExplode") then {
	private _drone = vehicle _param1;
	private _expl = createVehicle ["IEDUrbanBig_Remote_Ammo", getPos _drone, [], 0, "FLY"];
	_expl setShotParents [_drone, _sender];
	triggerAmmo _expl;
	deleteVehicle _drone;
}