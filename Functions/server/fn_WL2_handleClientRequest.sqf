params [["_sender", objNull, [objNull]], ["_action", "", [""]], "_param1", "_param2", "_param3", "_param4"];

if (isNull _sender) exitWith {};
if !(isServer) exitWith {};
if (remoteExecutedOwner != (owner _sender)) exitWith {};

#include "..\server_macros.inc"
_uid = getPlayerUID _sender;

if (_action == "orderAsset") exitWith {
	_cost = ((serverNamespace getVariable "WL2_costs") getOrDefault [_param2, 50001]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call BIS_fnc_WL2_fundsDatabaseWrite;
		
		_class = _param2;
		if (_class isKindOf "Ship") exitWith {
			[_sender, _param1, _class] spawn BIS_fnc_orderNaval;
		};

		if (_class isKindOf "Air") exitWith {
			[_sender, _param1, _class] spawn BIS_fnc_orderAir;
		};

		if (_param3) exitWith {
			[_sender, _param1, _class, _param4] spawn BIS_fnc_orderDefence;
		};

		[_sender, _param1, _class, _param4] spawn BIS_fnc_orderGround;
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

		_sender setVehiclePosition [_param1, [], 2, "NONE"];
	};
};

private _side = side group _sender;
if (_action == "scan") exitWith {
	_cost = (getMissionConfigValue ["BIS_WL_scanCost", 750]);
	_hasFunds = (playerFunds >= _cost);
	if (_hasFunds) then {
		(-_cost) call BIS_fnc_WL2_fundsDatabaseWrite;

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
			[_asset, _sender] remoteExec ["BIS_fnc_WL2_newAssetHandle", remoteExecutedOwner];
		};
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
		{
			[[side group _x, "Base"], (format [ localize "STR_A3_WL_donate_cp", name _sender, name _param2, _param1])] remoteExec ["commandChat", (owner _x)];
		} forEach (allPlayers select {side group _x == _side});
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