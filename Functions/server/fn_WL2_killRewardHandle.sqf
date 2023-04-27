#include "..\warlords_constants.inc"

params ["_unit", "_killer", "_instigator"];

_killReward = 0;
_bounty = 0;
if (isNull _instigator) then {_instigator = (UAVControl vehicle _killer) # 0};
if (isNull _instigator) then {_instigator = _killer};
if !(isNull _instigator) then {
	_responsibleLeader = _instigator;
	if (isPlayer _instigator) then {
		_responsibleLeader = _instigator;
	} else {
		_responsibleLeader = ((_instigator getVariable "BIS_WL_Owned_By") call BIS_fnc_getUnitByUID);
	};
	if (_responsibleLeader in BIS_WL_allWarlords) then {
		_killerSide = side group _responsibleLeader;
		_id = owner _responsibleLeader;
		_unitSide = if (_unit isKindOf "Man") then {
			side group _unit;
		} else {
			side (group ((crew _unit) # 0));
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
				_bounty = _unit getVariable [format ["BIS_WL_Bounty_%1", getPlayerUID _unit], 0];
				_bounty = ((_bounty / 100) * 80);
				_killReward = _killReward + _bounty;
			};
			[format [localize "STR_A3_WL_award_kill", _killReward]] remoteExec ["systemChat", _id];
			private _uid = getPlayerUID _responsibleLeader;
			[_uid, _killReward] spawn BIS_fnc_WL2_fundsDatabaseWrite;
			if (_bounty > 0) then {
				[format ["%1 has collected %2's bounty of %3CP!", name _sender, name _target, _bounty]] remoteExec ["systemChat", -2];
				_unit setVariable [format ["BIS_WL_Bounty_%1", getPlayerUID _unit], 0, true];
			};
		};
	};
};