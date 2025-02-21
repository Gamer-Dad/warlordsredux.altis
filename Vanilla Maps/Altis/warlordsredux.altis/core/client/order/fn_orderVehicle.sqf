params ["_orderedClass", "_cost", "_offset"];

player setVariable ["BIS_WL_isOrdering", true, [2, clientOwner]];

private _class = missionNamespace getVariable ["WL2_spawnClass", createHashMap] getOrDefault [_orderedClass, _orderedClass];

if (_class isKindOf "Man") then {
	_asset = (group player) createUnit [_class, getPosATL player, [], 2, "NONE"];
	_asset setVehiclePosition [getPosATL player, [], 0, "CAN_COLLIDE"];
	_asset setVariable ["BIS_WL_ownerAsset", getPlayerUID player, [2, clientOwner]];
	[player, "orderAI", _class] remoteExec ["WL2_fnc_handleClientRequest", 2];
	[_asset, player] spawn WL2_fnc_newAssetHandle;
	player setVariable ["BIS_WL_isOrdering", false, [2, clientOwner]];
} else {
	if (visibleMap) then {
		openMap [false, false];
		titleCut ["", "BLACK IN", 0.5];
	};

	if (count _offset != 3) then {
		_offset = [0, 8, 0];
	};

	private _deploymentResult = [_class, _orderedClass, _offset, 100, false] call WL2_fnc_deployment;

	if (_deploymentResult # 0) then {
		private _pos = _deploymentResult # 1;

		// Griefer check
		private _uid = getPlayerUID player;
		private _nearbyEntities = [_class, ATLToASL [_pos # 0, _pos # 1, 0], direction player, _uid, []] call WL2_fnc_grieferCheck;

		if (count _nearbyEntities > 0) then {
			private _nearbyObject = _nearbyEntities # 0;
			private _nearbyObjectName = [_nearbyObject] call WL2_fnc_getAssetTypeName;
			private _nearbyObjectPosition = getPosASL _nearbyObject;

			playSound3D ["a3\3den\data\sound\cfgsound\notificationwarning.wss", objNull, false, _nearbyObjectPosition, 5];
			systemChat format ["Too close to another %1!", _nearbyObjectName];
			player setVariable ["BIS_WL_isOrdering", false, [2, clientOwner]];
		} else {
			playSound "assemble_target";
			[player, "orderAsset", "vehicle", [_pos # 0, _pos # 1, 0], _orderedClass, direction player] remoteExec ["WL2_fnc_handleClientRequest", 2];
		};
	} else {
		"Canceled" call WL2_fnc_announcer;
		[toUpper localize "STR_A3_WL_deploy_canceled"] spawn WL2_fnc_smoothText;
		player setVariable ["BIS_WL_isOrdering", false, [2, clientOwner]];
	};
};

sleep 0.1;
showCommandingMenu "";