#include "..\warlords_constants.inc"

params ["_unit", "_killer", "_instigator"];

if (!(_unit isKindOf "Man") && (((serverNamespace getVariable "killRewards") getOrDefault [typeOf _unit, 69]) == 69)) exitWith {};

_killReward = 0;
if (isNull _instigator) then {_instigator = (if (!isNil {(leader (_killer getVariable "BIS_WL_ownerAsset"))}) then [{(leader (_killer getVariable "BIS_WL_ownerAsset"))}, {((UAVControl _killer) # 0)}])};
if (isNull _instigator) then {_instigator = (_killer)};
if !(isNull _instigator) then {
	_responsibleLeader = leader _instigator;
	if (_responsibleLeader in allPlayers) then {
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
		if (_killerSide != _unitSide && _unitSide in BIS_WL_sidesArray) then {
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

_list = ((_unit getVariable ["assistList", []]) select {((getPlayerUID _x) != (getPlayerUID (_unit getVariable ["BIS_WL_killer", objNull])))});
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