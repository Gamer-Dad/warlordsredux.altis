params ["_class", "_cost"];

player setVariable ["BIS_WL_isOrdering", true, [2, clientOwner]];

if (_class isKindOf "Man") then {
	_asset = (group player) createUnit [_class, (getPosATL player), [], 2, "NONE"];
	_asset setVariable ["BIS_WL_ownerAsset", getPlayerUID player, [2, clientOwner]];
	[player, "orderAI", _class] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2];
	[_asset, player] spawn BIS_fnc_WL2_newAssetHandle;
	player setVariable ["BIS_WL_isOrdering", false, [2, clientOwner]];
} else {
	_offset = [0, 8, 0];
	_asset = createSimpleObject [_class, (AGLToASL (player modelToWorld _offset)), true];

	_asset setDir direction player;
	_asset lock 2;
	_asset attachTo [player, _offset];
	_h = (position _asset) # 2;
	detach _asset;
	_offset_tweaked = [_offset select 0, _offset select 1, _h];
	_asset attachTo [player, _offset_tweaked];

	[player, "assembly"] call BIS_fnc_WL2_hintHandle;

	BIS_WL_spacePressed = false;
	BIS_WL_backspacePressed = false;

	_deployKeyHandle = (findDisplay 46) displayAddEventHandler ["KeyDown", {
		if (_this # 1 == 57) then {
			if !(BIS_WL_backspacePressed) then {
				BIS_WL_spacePressed = TRUE;
			};
		};
		if (_this # 1 == 14) then {
			if !(BIS_WL_spacePressed) then {
				BIS_WL_backspacePressed = TRUE;
			};
		};
	}];

	uiNamespace setVariable ["BIS_WL_deployKeyHandle", _deployKeyHandle];

	0 spawn {
		waitUntil {
			sleep 0.1;
			BIS_WL_spacePressed ||
			{BIS_WL_backspacePressed ||
			{vehicle player != player ||
			{!alive player ||
			{lifeState player == "INCAPACITATED" ||
			{(count ((allPlayers inAreaArray [player, 100, 100]) select {(_x != player) && {(BIS_WL_playerSide != side group _x) && {alive _x}}}) > 0) ||
			{(getPosATL player) select 2 > 1 ||
			{(BIS_WL_sectorsArray # 0) findIf {player inArea (_x getVariable "objectAreaComplete")} == -1
		}}}}}}}};

		if !(BIS_WL_spacePressed) then {
			BIS_WL_backspacePressed = TRUE;
		};
	};

	waitUntil {sleep 0.1; BIS_WL_spacePressed || {BIS_WL_backspacePressed}};

	(findDisplay 46) displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_WL_deployKeyHandle"];
	uiNamespace setVariable ['BIS_WL_deployKeyHandle', nil];
	_offset set [1, _asset distance2D player];
	detach _asset;
	_p = getPosATL _asset;
	deleteVehicle _asset;

	[player, "assembly", false] call BIS_fnc_WL2_hintHandle;

	if (BIS_WL_spacePressed) then {
		playSound "assemble_target";
		[player, "orderAsset", "vehicle", [(_p # 0), (_p # 1), 0], _class, direction player] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2];
	} else {
		"Canceled" call BIS_fnc_WL2_announcer;
		[toUpper localize "STR_A3_WL_deploy_canceled"] spawn BIS_fnc_WL2_smoothText;
		player setVariable ["BIS_WL_isOrdering", false, [2, clientOwner]];
	};
};

sleep 0.1;
showCommandingMenu "";