params ["_sender", "_action", "_pos", "_target", "_isStatic", "_direction"];

if (isNull _sender) exitWith {};

if (_action == "orderAsset") exitWith {
	_playerFunds = ((serverNamespace getVariable "fundsDatabase") getOrDefault [(getPlayerUID _sender), 0]);
	_cost = ((serverNamespace getVariable "BIS_WL2_costs") getOrDefault [_target, 50002]);
	_hasFunds = (_playerFunds >= _cost);
	if (_hasFunds) then {
		private _uid = getPlayerUID _sender;
		[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;
		
		_class = _target;
		if (_class isKindOf "Ship") exitWith {
			[_sender, _pos, _class] spawn BIS_fnc_WL2_orderNaval;
		};

		if (_class isKindOf "Air") exitWith {
			[_sender, _pos, _class] spawn BIS_fnc_WL2_orderAir;
		};

		if (_isStatic) exitWith {
			[_sender, _pos, _class, _direction] spawn BIS_fnc_WL2_orderDefence;
		};

		[_sender, _pos, _class, _direction] spawn BIS_fnc_WL2_orderGround;
	};
};

if (_action == "lastLoadout") exitWith {
	_playerFunds = ((serverNamespace getVariable "fundsDatabase") getOrDefault [(getPlayerUID _sender), 0]);
	_cost = (getMissionConfigValue ["BIS_WL_lastLoadoutCost", 100]);
	_hasFunds = (_playerFunds >= _cost);
	if (_hasFunds) then {
		private _uid = getPlayerUID _sender;
		[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;

		0 remoteExec ["BIS_fnc_WL2_orderLastLoadout", remoteExecutedOwner];
	};
};

if (_action == "savedLoadout") exitWith {
	_playerFunds = ((serverNamespace getVariable "fundsDatabase") getOrDefault [(getPlayerUID _sender), 0]);
	_cost = (getMissionConfigValue ["BIS_WL_savedLoadoutCost", 500]);
	_hasFunds = (_playerFunds >= _cost);
	if (_hasFunds) then {
		private _uid = getPlayerUID _sender;
		[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;

		["apply"] remoteExec ["BIS_fnc_WL2_orderSavedLoadout", remoteExecutedOwner];
	};
};

if (_action == "orderArsenal") exitWith {
	_playerFunds = ((serverNamespace getVariable "fundsDatabase") getOrDefault [(getPlayerUID _sender), 0]);
	_cost = (getMissionConfigValue ["BIS_WL_arsenalCost", 1000]);
	_hasFunds = (_playerFunds >= _cost);
	if (_hasFunds) then {
		private _uid = getPlayerUID _sender;
		[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;	

		0 remoteExec ["BIS_fnc_WL2_orderArsenal", remoteExecutedOwner];
	};
};

if (_action == "fastTravelContested") exitWith {
	_playerFunds = ((serverNamespace getVariable "fundsDatabase") getOrDefault [(getPlayerUID _sender), 0]);
	_cost = (getMissionConfigValue ["BIS_WL_fastTravelCostContested", 200]);
	_hasFunds = (_playerFunds >= _cost);
	if (_hasFunds) then {
		private _uid = getPlayerUID _sender;
		[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;

		_sender setVehiclePosition [_pos, [], 2, "NONE"];
	};
};

if (_action == "scan") exitWith {
	_playerFunds = ((serverNamespace getVariable "fundsDatabase") getOrDefault [(getPlayerUID _sender), 0]);
	_cost = (getMissionConfigValue ["BIS_WL_scanCost", 750]);
	_hasFunds = (_playerFunds >= _cost);
	if (_hasFunds) then {
		private _uid = getPlayerUID _sender;
		[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;

		_target setVariable [format ["BIS_WL_lastScanEnd_%1", side _sender], (serverTime + 30), true];
		_revealTrigger = createTrigger ["EmptyDetector", position _target];
		_revealTrigger setTriggerArea (_target getVariable "objectArea");
		_revealTrigger setTriggerActivation ["ANY", "PRESENT", false];
		_target setVariable ["BIS_WL_revealTrigger", _revealTrigger, true];
		[_target, side group _sender] remoteExec ["BIS_fnc_WL2_sectorScanHandle", [0, -2] select isDedicated];
		waitUntil {sleep 0.25; BIS_WL_competingSides findIf {(_target getVariable [format ["BIS_WL_lastScanEnd_%1", _x], -9999]) > serverTime} == -1};
		deleteVehicle _revealTrigger;
		_target setVariable ["BIS_WL_revealTrigger", nil, true];
	};
};

if (_action == "orderFTVehicle") exitWith {
	_playerFunds = ((serverNamespace getVariable "fundsDatabase") getOrDefault [(getPlayerUID _sender), 0]);
	_cost = (getMissionConfigValue ["BIS_WL_orderFTVehicleCost", 200]);
	_hasFunds = (_playerFunds >= _cost);
	if (_hasFunds) then {
		private _uid = getPlayerUID _sender;
		[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;

		if (_target == west) then {
			if ((count ((entities "B_Truck_01_medical_F") select {alive _x})) == 0) then {
				_asset = createVehicle ["B_Truck_01_medical_F", _sender, [], 0, "NONE"];
				[_sender, _asset] remoteExec ["BIS_fnc_WL2_newAssetHandle", remoteExecutedOwner];
			};
		} else {
			if ((count ((entities "O_Truck_03_medical_F") select {alive _x})) == 0) then {
				_asset = createVehicle ["O_Truck_03_medical_F", _sender, [], 0, "NONE"];
				[_sender, _asset] remoteExec ["BIS_fnc_WL2_newAssetHandle", remoteExecutedOwner];
			};
		};
	};
};

if (_action == "orderFTPod") exitWith {
	_playerFunds = ((serverNamespace getVariable "fundsDatabase") getOrDefault [(getPlayerUID _sender), 0]);
	_cost = (getMissionConfigValue ["BIS_WL_orderFTVehicleCost", 200]);
	_hasFunds = (_playerFunds >= _cost);
	if (_hasFunds) then {
		private _uid = getPlayerUID _sender;
		[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;

		if (_target == west) then {
			if ((count (entities "B_Slingload_01_Medevac_F")) == 0) then {
				_asset = createVehicle ["B_Slingload_01_Medevac_F", _sender, [], 0, "NONE"];
				[_sender, _asset] remoteExec ["BIS_fnc_WL2_newAssetHandle", remoteExecutedOwner];
			};
		} else {
			if ((count (entities "Land_Pod_Heli_Transport_04_medevac_F")) == 0) then {
				_asset = createVehicle ["Land_Pod_Heli_Transport_04_medevac_F", _sender, [], 0, "NONE"];
				[_sender, _asset] remoteExec ["BIS_fnc_WL2_newAssetHandle", remoteExecutedOwner];
			};
		};
	};
};

if (_action == "targetReset") exitWith {
	_playerFunds = ((serverNamespace getVariable "fundsDatabase") getOrDefault [(getPlayerUID _sender), 0]);
	_cost = (getMissionConfigValue ["BIS_WL_targetResetCost", 500]);
	_hasFunds = (_playerFunds >= _cost);
	if (_hasFunds) then {
		private _uid = getPlayerUID _sender;
		[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;

		missionNamespace setVariable [format ["BIS_WL_targetResetVotingSince_%1", side _sender], serverTime, true];
		missionNamespace setVariable [format ["BIS_WL_targetResetOrderedBy_%1", side _sender], name _sender, true];
		_sender setVariable ["BIS_WL_targetResetVote", 1, [2, remoteExecutedOwner]];

		[side _sender] spawn BIS_fnc_WL2_targetResetHandleServer;
		[side _sender] remoteExec ["BIS_fnc_WL2_targetResetHandleVote", [0, -2] select isDedicated];
	};
};

if (_action == "orderAI") exitWith {
	_cost = ((serverNamespace getVariable "BIS_WL2_costs") getOrDefault [_pos, 150]);
	private _uid = getPlayerUID _sender;
	[_uid, -_cost] spawn BIS_fnc_WL2_fundsDatabaseWrite;
};

if (_action == "fundsTransfer") exitWith {
	_playerFunds = ((serverNamespace getVariable "fundsDatabase") getOrDefault [(getPlayerUID _sender), 0]);
	if (_playerFunds >= _pos) then {
		_targetUID = getPlayerUID _target;
		_uid = getPlayerUID _sender;

		[_targetUID, _pos] spawn BIS_fnc_WL2_fundsDatabaseWrite;
		[_uid, -_pos] spawn BIS_fnc_WL2_fundsDatabaseWrite;
		serverNamespace setVariable [format ["BIS_WL_isTransferring_%1", _uid], false];
		{
			[[side group _x, "Base"], (format [ localize "STR_A3_WL_donate_cp", name _sender, name _target, _pos])] remoteExec ["commandChat", (owner _x)];
		} forEach (allPlayers select {side group _x == side group _sender});
	};
};

if (_action == "fundsTransferCancel") exitWith {
	private _uid = getPlayerUID _sender;
	if (serverNamespace getVariable (format ["BIS_WL_isTransferring_%1", _uid])) then {
		[_uid, (getMissionConfigValue ["BIS_WL_fundsTransferCost", 2000])] spawn BIS_fnc_WL2_fundsDatabaseWrite;
		serverNamespace setVariable [format ["BIS_WL_isTransferring_%1", _uid], false];
	};
};

if (_action == "fundsTransferBill") exitWith {
	private _uid = getPlayerUID _sender;
	[_uid, -(getMissionConfigValue ["BIS_WL_fundsTransferCost", 2000])] spawn BIS_fnc_WL2_fundsDatabaseWrite;
	
	serverNamespace setVariable [format ["BIS_WL_isTransferring_%1", _uid], true];
};

if (_action == "repair") exitWith {
	if ((!isNil {_pos}) && {_pos <= serverTime}) then {
		_isStatic setDamage _target;
	};
};

if (_action == "kill") exitWith {
	if (remoteExecutedOwner == _pos) then {
		_sender setDamage 1;
	};
};

if (_action == "10K" && {!(["(EU) #11", serverName] call BIS_fnc_inString)}) exitWith {
	private _uid = getPlayerUID _sender;
	[_uid, 10000] spawn BIS_fnc_WL2_fundsDatabaseWrite;	
};