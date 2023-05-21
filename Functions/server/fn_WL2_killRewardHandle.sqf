#include "..\warlords_constants.inc"

params ["_unit", "_killer", "_instigator"];

if (!(_unit isKindOf "Man") && (((serverNamespace getVariable "killRewards") getOrDefault [typeOf _unit, 69]) == 69)) exitWith {};

if (isNull _instigator) then {_instigator = (if (!isNil {(leader (_killer getVariable "BIS_WL_ownerAsset"))}) then [{(leader (_killer getVariable "BIS_WL_ownerAsset"))}, {((UAVControl _killer) # 0)}])};
if (isNull _instigator) then {_instigator = (_killer)};
[format ["%1 isNull", (isNull _instigator)]] remoteExec ["hint", 0, true];
if !(isNull _instigator) then {
	_responsibleLeader = leader _instigator;
	[format ["%1 Players", (_responsibleLeader in allPlayers)]] remoteExec ["hint", 0, true];
	if (_responsibleLeader in allPlayers) then {
		_killerSide = if !(isNil {(side (_responsibleLeader getVariable "BIS_WL_ownerAsset"))}) then {
			(side (_responsibleLeader getVariable "BIS_WL_ownerAsset"));
		} else {
			(switch ((getNumber (configFile >> "CfgVehicles" >> typeOf _responsibleLeader >> "side"))) do {
				case 0: {east};
				case 1: {west};
				case 2: {Independent};
				default {Independent};
			});
		};
		_unitSide = if !(isNil {(side (_unit getVariable "BIS_WL_ownerAsset"))}) then {
			(side (_unit getVariable "BIS_WL_ownerAsset"));
		} else {
			(switch ((getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side"))) do {
				case 0: {east};
				case 1: {west};
				case 2: {Independent};
				default {Independent};
			});
		};
		[format ["%1, unit: %2, killer: %3 unitName: %4, killerName: %5", (_unitSide in [west, east, independent]), _unitSide, _killerSide, (name _unit), (name _responsibleLeader)]] remoteExec ["hint", 0, true];
		if ((_killerSide != _unitSide) && (_unitSide in [west, east, independent])) then {
			if (_unit isKindOf "Man") then {
				_killReward = (if (isPlayer _unit) then {75} else {30});
			} else {
				_killReward = (serverNamespace getVariable "killRewards") getOrDefault [typeOf _unit, 69];
			};
			_uid = getPlayerUID _responsibleLeader;
			[_unit, _killReward, false, _uid] remoteExec ["BIS_fnc_WL2_killRewardClient", (owner _responsibleLeader)];
			_unit setVariable ["BIS_WL_killer", _responsibleLeader, true];
			[_uid, _killReward] spawn BIS_fnc_WL2_fundsDatabaseWrite;
		};
	};
};

_list = ((_unit getVariable ["assistList", []]) select {((getPlayerUID _x) != (getPlayerUID (_unit getVariable ["BIS_WL_killer", _unit])))});
_cond = (count _list);
if (_cond > 0) then {
	_assistList = _list;
	_killReward = if (_unit isKindOf "Man") then {
		if (isPlayer _unit) then {
			75;
		} else {
			30;
		};
	} else {
		(serverNamespace getVariable "killRewards") getOrDefault [(typeOf _unit), 69];
	};
	_killReward = (round ((_killReward / 100) * 30));
	{
		_uid = getPlayerUID _x;
		[_uid, _killReward] spawn BIS_fnc_WL2_fundsDatabaseWrite;
		[_unit, _killReward, true, _uid] remoteExec ["BIS_fnc_WL2_killRewardClient", (owner _x)];
	} forEach _assistList;
	_unit setVariable ["assistList", [], true];
	_unit setVariable ["BIS_WL_killer", nil, true];
};