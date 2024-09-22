params ["_unit", "_responsibleLeader"];

if (!(_unit isKindOf "Man") && {(((serverNamespace getVariable "WL2_killRewards") getOrDefault [(typeOf _unit), 0]) == 0)}) exitWith {};

// One last sanity check
if (!isPlayer _responsibleLeader) exitWith {};
if ((_unit isKindOf "Building") && !(_unit getVariable ["WL_structure", false])) exitWith {};

private _killerSide = side group _responsibleLeader;
private _unitSide = [_unit] call BIS_fnc_WL2_getAssetSide;

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

	private _playerId = getPlayerID _responsibleLeader;
	private _squadmatesIDs = ["getSquadmates", [_playerId]] call SQD_fnc_server;
	if (count _squadmatesIDs > 1) then {
		private _squadReward = round (_killReward * 0.5 / (sqrt (count _squadmatesIDs)));
		{
			private _userInfo = getUserInfo _x;
			if (count _userInfo < 3) then {
				continue;
			};
			_uid = _userInfo # 2;
			_squadReward call BIS_fnc_WL2_fundsDatabaseWrite;
			[_unit, _squadReward, "Squad assist", "#7a7ab9"] remoteExec ["BIS_fnc_WL2_killRewardClient", (getUserInfo _x) # 1];
		} forEach _squadmatesIDs;
	};

	_uid = getPlayerUID _responsibleLeader;
	_killReward = round _killReward;
	_killReward call BIS_fnc_WL2_fundsDatabaseWrite;
	[_unit, _killReward] remoteExec ["BIS_fnc_WL2_killRewardClient", owner _responsibleLeader];

	["earnPoints", [_playerId, _killReward]] call SQD_fnc_server;

	_reward = round (_killReward / 4);
	_crew = ((crew (objectParent _responsibleLeader)) select {((_x isEqualTo (gunner (objectParent _responsibleLeader))) || {(_x isEqualTo (commander (objectParent _responsibleLeader))) || {(_x isEqualTo (driver (objectParent _responsibleLeader)))}}) && {_x != _responsibleLeader && {isPlayer _x}}});
	{
		_uid = getPlayerUID _x;
		_reward call BIS_fnc_WL2_fundsDatabaseWrite;
		[_unit, _reward] remoteExec ["BIS_fnc_WL2_killRewardClient", (owner _x)];
	} forEach _crew;
};