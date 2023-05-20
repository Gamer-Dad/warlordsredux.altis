#include "..\warlords_constants.inc"

params ["_unit", "_killer", "_instigator"];

if (!(_unit isKindOf "Man") && (((serverNamespace getVariable "killRewards") getOrDefault [typeOf _unit, 69]) == 69)) exitWith {};

_killReward = 0;
if (isNull _instigator) then {_instigator = leader (_killer getVariable "BIS_WL_ownerAsset")};
if (isNull _instigator) then {_instigator = _killer};
[format ["%1 isNull", isNull _instigator]] remoteExec ["hint", 0, true];
if !(isNull _instigator) then {
	_responsibleLeader = leader _instigator;
	[format ["%1 In players", _responsibleLeader in BIS_WL_allWarlords]] remoteExec ["hint", 0, true];
	if (_responsibleLeader in BIS_WL_allWarlords) then {
		_killerSide = side group _responsibleLeader;
		_unitSide = if (_unit isKindOf "Man") then {
			side group _unit;
		} else {
			switch (true) do {
				case ((side (_unit getVariable "BIS_WL_ownerAsset")) == east): {east};
				case ((side (_unit getVariable "BIS_WL_ownerAsset")) == west): {west};
				case ((getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side")) == 0): {east};
				case ((getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side")) == 1): {west};
				case ((getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side")) == 2): {Independent};
				default {Civilian};
			};
		};
		if (_killerSide != _unitSide && _unitSide in BIS_WL_sidesArray) then {
			[format ["%1 Side", _killerSide != _unitSide && _unitSide in BIS_WL_sidesArray]] remoteExec ["hint", 0, true];
			if (_unit isKindOf "Man") then {
				if (isPlayer _unit) then {
					_killReward = 75;
				} else {
					_killReward = 30;
				};
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

_cond = (count ((_unit getVariable ["assistList", []]) select {_x != _unit getVariable ["BIS_WL_killer", _unit]}));
if (_cond > 0) then {
	_assistList = ((_unit getVariable ["assistList", []]) select {_x != _unit getVariable ["BIS_WL_killer", _unit]});
	_killReward = if (_unit isKindOf "Man") then {
		if (isPlayer _unit) then {
			75;
		} else {
			30;
		};
	} else {
		(serverNamespace getVariable "killRewards") getOrDefault [typeOf _unit, 69];
	};
	_killReward = (round ((_killReward / 100) * 30));
	{
		_uid = getPlayerUID _x;
		[_uid, _killReward] spawn BIS_fnc_WL2_fundsDatabaseWrite;
		[_unit, _killReward, true, _uid] remoteExec ["BIS_fnc_WL2_killRewardClient", -2];
	} forEach _assistList;
	_unit setVariable ["assistList", [], true];
	_unit setVariable ["BIS_WL_killer", nil, true];
};