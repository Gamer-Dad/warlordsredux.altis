params ["_unit", "_responsibleLeader"];

if (!isPlayer _responsibleLeader) exitWith {};

private _assetActualType = _unit getVariable ["WL2_orderedClass", typeOf _unit];
private _killRewardMap = serverNamespace getVariable ["WL2_killRewards", createHashMap];
private _killReward = _killRewardMap getOrDefault [_assetActualType, 0];

if ((_unit isKindOf "Building") && !(_unit getVariable ["WL_structure", false])) exitWith {false};

private _killerSide = side group _responsibleLeader;
private _unitSide = [_unit] call WL2_fnc_getAssetSide;

if (_killerSide == _unitSide) exitWith {};

private _customText = "";

private _noRewardList = ["B_UAV_AI", "O_UAV_AI", "I_UAV_AI"];
if (_unit isKindOf "Man" && !(_unit in _noRewardList)) then {
	if (isPlayer _unit) then {
		_killReward = 60;
		_customText = "Enemy player killed";
	} else {
		_killReward = 30;
	};
} else {
	if (_killReward == 0) exitWith {};
};

private _targets = [missionNamespace getVariable "BIS_WL_currentTarget_west", missionNamespace getVariable "BIS_WL_currentTarget_east"] select {!(isNull _x)};

if (_responsibleLeader getVariable ["MRTM_3rdPersonDisabled", false]) then {
	_killReward = _killReward * 2;
};
if ((_targets findIf {_unit inArea (_x getVariable "objectAreaComplete")}) != -1) then {
	_killReward = _killReward * 1.2;
};

private _playerId = getPlayerID _responsibleLeader;
private _squadmatesIDs = ["getSquadmates", [_playerId]] call SQD_fnc_server;
private _squadReward = round (_killReward * 0.5 / (sqrt (count _squadmatesIDs) max 1));
{
	private _userInfo = getUserInfo _x;
	if (count _userInfo < 3) then {
		continue;
	};
	_uid = _userInfo # 2;
	_squadReward call WL2_fnc_fundsDatabaseWrite;
	[_unit, _squadReward, "Squad assist", "#7a7ab9"] remoteExec ["WL2_fnc_killRewardClient", (getUserInfo _x) # 1];
} forEach _squadmatesIDs;

_uid = getPlayerUID _responsibleLeader;
_killReward = round _killReward;
_killReward call WL2_fnc_fundsDatabaseWrite;

[_unit, _killReward, _customText, "#228b22", _assetActualType] remoteExec ["WL2_fnc_killRewardClient", _responsibleLeader];

["earnPoints", [_uid, _killReward]] call SQD_fnc_server;

// Vehicle crew reward
private _reward = round (_killReward / 4);
private _vehicle = objectParent _responsibleLeader;
private _crew = (crew _vehicle) select {
	_x in [gunner _vehicle, commander _vehicle, driver _vehicle] && _x != _responsibleLeader && isPlayer _x
};
{
	_uid = getPlayerUID _x;
	_reward call WL2_fnc_fundsDatabaseWrite;
	[_unit, _reward] remoteExec ["WL2_fnc_killRewardClient", _x];

	["earnPoints", [_uid, _reward]] call SQD_fnc_server;
} forEach _crew;