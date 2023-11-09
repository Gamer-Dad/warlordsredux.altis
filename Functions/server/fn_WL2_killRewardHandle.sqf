params ["_unit", "_responsibleLeader"];

if (!(_unit isKindOf "Man") && {(((serverNamespace getVariable "BIS_WL2_killRewards") getOrDefault [(typeOf _unit), 0]) == 0)}) exitWith {};

_killerSide = side group _responsibleLeader;
_unitSide = if (_unit isKindOf "Man") then {
	side group _unit;
} else {
	if !(isNull ((_unit getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID)) then {
		_sideOwner = side group ((_unit getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID);
		if (count crew _unit > 0) then {
			side group (crew _unit # 0);
		} else {
			_sideOwner;
		};
	} else {
		(switch ((getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side"))) do {
			case 0: {east};
			case 1: {west};
			case 2: {Independent};
			default {Independent};
		});
	};
};

if (_killerSide != _unitSide) then {
	_targets = [missionNamespace getVariable "BIS_WL_currentTarget_west", missionNamespace getVariable "BIS_WL_currentTarget_east"] select {!(isNull _x)};
	_killReward = 0;
	if (_unit isKindOf "Man") then {
		_killReward = (if (isPlayer _unit) then {75} else {40});
	} else {
		_killReward = (serverNamespace getVariable "BIS_WL2_killRewards") get (typeOf _unit);
	};
	if (_responsibleLeader getVariable ["MRTM_3rdPersonDisabled", false]) then {
		_killReward = _killReward * 2;
	};
	if ((_targets findIf {_unit inArea (_x getVariable "objectAreaComplete")}) != -1) then {
		_killReward = _killReward * 1.2;
	};
	_uid = getPlayerUID _responsibleLeader;
	_killReward = round _killReward;
	[_uid, _killReward] call BIS_fnc_WL2_fundsDatabaseWrite;
	[_unit, _killReward] remoteExec ["BIS_fnc_WL2_killRewardClient", (owner _responsibleLeader)];
	{
		_uid = getPlayerUID _x;
		_reward = round (_killReward * 0.5);
		[_uid, _reward] call BIS_fnc_WL2_fundsDatabaseWrite;
		[_unit, _reward] remoteExec ["BIS_fnc_WL2_killRewardClient", (owner _x)];
	} forEach ((crew (objectParent _responsibleLeader)) select {((_x isEqualTo (gunner (objectParent _responsibleLeader))) || {(_x isEqualTo (commander (objectParent _responsibleLeader))) || {(_x isEqualTo (driver (objectParent _responsibleLeader)))}}) && {_x != _responsibleLeader && {isPlayer _x}}});
};