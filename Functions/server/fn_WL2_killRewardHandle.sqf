#include "..\warlords_constants.inc"

params ["_unit", "_killer", "_instigator"];

if (!(_unit isKindOf "Man") && (((serverNamespace getVariable "BIS_WL2_killRewards") getOrDefault [(typeOf _unit), 69]) == 69)) exitWith {};

if (isNull _instigator) then {_instigator = (if (!isNil {(leader (_killer getVariable "BIS_WL_ownerAsset"))}) then [{(leader (_killer getVariable "BIS_WL_ownerAsset"))}, {((UAVControl vehicle _killer) # 0)}])};
if (isNull _instigator) then {_instigator = (vehicle _killer)};
if !(isNull _instigator) then {
	_responsibleLeader = leader _instigator;
	if (_responsibleLeader in BIS_WL_allWarlords) then {
		_killerSide = side group _responsibleLeader;
		_unitSide = if (_unit isKindOf "Man") then {
			side group _unit;
		} else {
			if !(isNil {(side (_unit getVariable "BIS_WL_ownerAsset"))}) then {
				(side (_unit getVariable "BIS_WL_ownerAsset"))
			} else {
				(switch ((getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side"))) do {
					case 0: {east};
					case 1: {west};
					case 2: {Independent};
					default {Independent};
				});
			};
		};
		if ((_killerSide != _unitSide) && (_unitSide in [west, east, independent])) then {
			_killReward = 0;
			if (_unit isKindOf "Man") then {
				_killReward = (if (isPlayer _unit) then {75} else {40});
			} else {
				_killReward = (serverNamespace getVariable "BIS_WL2_killRewards") getOrDefault [(typeOf _unit), 69];
			};
			if (_responsibleLeader getVariable ["MRTM_3rdPersonDisabled", false]) then {
				_killReward = (_killReward * 1.5);
			};
			_uid = getPlayerUID _responsibleLeader;
			[_unit, _killReward, false, _uid] remoteExec ["BIS_fnc_WL2_killRewardClient", (owner _responsibleLeader)];
			_unit setVariable ["BIS_WL_killer", _responsibleLeader, true];
			[_uid, _killReward] spawn BIS_fnc_WL2_fundsDatabaseWrite;
			if ((objectParent _responsibleLeader) != _responsibleLeader) then {
				{
					if (_x in (_unit getVariable ["assistList", []])) then {
						_l = (_unit getVariable ["assistList", []]) + [_x];
						_unit setVariable ["assistList", _l, true];
					};
				} forEach (crew (objectParent _responsibleLeader)) select {(((_x isEqualTo (gunner (objectParent _responsibleLeader))) || (_x isEqualTo (driver (objectParent _responsibleLeader))) || (_x isEqualTo (commander (objectParent _responsibleLeader)))) && (_x != _responsibleLeader) && (isPlayer _x))};
			};
		};
	};
};

_list = ((_unit getVariable ["assistList", []]) select {((getPlayerUID _x) != (getPlayerUID (_unit getVariable ["BIS_WL_killer", _unit])))});
_cond = (count _list);
if (_cond > 0) then {
	_assistList = _list;
	_killReward = (if (_unit isKindOf "Man") then {
		if (isPlayer _unit) then {
			75;
		} else {
			40;
		};
	} else {
		(serverNamespace getVariable "BIS_WL2_killRewards") getOrDefault [(typeOf _unit), 69];
	});
	_killReward = (round ((_killReward / 100) * 30));
	{
		_uid = getPlayerUID _x;
		[_uid, _killReward] spawn BIS_fnc_WL2_fundsDatabaseWrite;
		[_unit, _killReward, true, _uid] remoteExec ["BIS_fnc_WL2_killRewardClient", (owner _x)];
	} forEach _assistList;
	_unit setVariable ["assistList", [], true];
	_unit setVariable ["BIS_WL_killer", nil, true];
};