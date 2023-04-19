#include "..\warlords_constants.inc"

params ["_unit", "_killer", "_instigator"];

_killReward = 0;
if (isNull _instigator) then {_instigator = (UAVControl vehicle _killer) # 0};
if (isNull _instigator) then {_instigator = _killer};
if !(isNull _instigator) then {
	_responsibleLeader = leader _instigator;
	if (_responsibleLeader in BIS_WL_allWarlords) then {
		_killerSide = side group _responsibleLeader;
		_id = owner _responsibleLeader;
		_unitSide = if (_unit isKindOf "Man") then {
			side group _unit;
		} else {
			switch (getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side")) do {
				case 0: {EAST};
				case 1: {WEST};
				case 2: {RESISTANCE};
				default {CIVILIAN};
			};
		};
		if (_killerSide != _unitSide && _unitSide in BIS_WL_sidesArray) then {
			if (_unit isKindOf "Man") then {
				if (isPlayer _unit) then {
					_killReward = 75;
				} else {
					_killReward = 50;
				};
			} else {
				_killReward = (serverNamespace getVariable "killRewards") getOrDefault [typeOf _unit, 69];
			};
			[format [localize "STR_A3_WL_award_kill", _killReward]] remoteExec ["systemChat", _id];
			private _uid = getPlayerUID _responsibleLeader;
			[_uid, _killReward] spawn BIS_fnc_WL2_fundsDatabaseWrite;
		};
	};
};