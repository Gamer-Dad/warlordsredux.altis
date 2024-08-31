params ["_unit", "_responsibleLeader"];

if (!(_unit isKindOf "Man") && {(((serverNamespace getVariable "WL2_killRewards") getOrDefault [(typeOf _unit), 0]) == 0)}) exitWith {};

private _killerSide = side group _responsibleLeader;
private _unitSide = if (_unit isKindOf "Man") then {
	side group _unit;
} else {
	private _groupSide = side group _unit;
	private _backupSide = if (_groupSide == sideUnknown || _groupSide == civilian) then {
		private _typeSide = switch (getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side")) do {
			case 0: { east };
			case 1: { west };
			case 2: { independent };
			default { independent };
		};
		typeSide;
	} else {
		_groupSide;
	};

	_unit getVariable ["BIS_WL_ownerAssetSide", _backupSide];
};

if (_killerSide != _unitSide) then {
	_targets = [missionNamespace getVariable "BIS_WL_currentTarget_west", missionNamespace getVariable "BIS_WL_currentTarget_east"] select {!(isNull _x)};
	_killReward = 0;
	if (_unit isKindOf "Man") then {
		_killReward = (if (isPlayer _unit) then {60} else {30});
	} else {
		_killReward = (serverNamespace getVariable "WL2_killRewards") get (typeOf _unit);
	};
	if (_responsibleLeader getVariable ["MRTM_3rdPersonDisabled", false]) then {
		_killReward = _killReward * 2;
	};
	if ((_targets findIf {_unit inArea (_x getVariable "objectAreaComplete")}) != -1) then {
		_killReward = _killReward * 1.2;
	};

	private _squadmatesIDs = ["getSquadmates", [getPlayerID _responsibleLeader]] call SQD_fnc_server;
	if (count _squadmatesIDs > 1) then {
		_squadReward = round (_killReward * 1.5 / (count _squadmatesIDs));
		{
			_uid = getUserInfo _x # 2;
			_squadReward call BIS_fnc_WL2_fundsDatabaseWrite;
			[_unit, _squadReward] remoteExec ["BIS_fnc_WL2_killRewardClient", (getUserInfo _x) # 1];
		} forEach _squadmatesIDs;
	} else {
		_uid = getPlayerUID _responsibleLeader;
		_killReward = round _killReward;
		_killReward call BIS_fnc_WL2_fundsDatabaseWrite;
		[_unit, _killReward] remoteExec ["BIS_fnc_WL2_killRewardClient", (owner _responsibleLeader)];
	};

	["earnPoints", [getPlayerID _responsibleLeader, _killReward]] call SQD_fnc_server;

	_reward = round (_killReward / 4);
	_crew = ((crew (objectParent _responsibleLeader)) select {((_x isEqualTo (gunner (objectParent _responsibleLeader))) || {(_x isEqualTo (commander (objectParent _responsibleLeader))) || {(_x isEqualTo (driver (objectParent _responsibleLeader)))}}) && {_x != _responsibleLeader && {isPlayer _x}}});
	{
		_uid = getPlayerUID _x;
		_reward call BIS_fnc_WL2_fundsDatabaseWrite;
		[_unit, _reward] remoteExec ["BIS_fnc_WL2_killRewardClient", (owner _x)];
	} forEach _crew;
};