#include "..\warlords_constants.inc"

params ["_unit", "_killer", "_instigator"];

if (isNull _instigator) then {_instigator = (UAVControl vehicle _killer) # 0};
if (isNull _instigator) then {_instigator = _killer};
if !(isNull _instigator) then {
	if (local leader _instigator) then {
		_responsibleLeader = leader _instigator;
		if (_responsibleLeader in BIS_WL_allWarlords) then {
			_killerSide = side group _responsibleLeader;
			_unitSide = if (_unit isKindOf "Man") then {
				side group _unit;
			} else {
				switch (getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side")) do {
					case 0: {EAST};
					case 1: {WEST};
					case 2: {RESISTANCE};
					default {CIVILIAN};
				};
			}; //reward == 4 block is fix to gorgan CP reward, by dara, default reward/value is 10,000
			if (_killerSide != _unitSide && _unitSide in BIS_WL_sidesArray) then {
				_reward = round ((getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "cost")) / 4444);
				if(_reward == 9) then {
					_reward = 562;
				};
				if (_responsibleLeader == player) then {
					systemChat format [localize "STR_A3_WL_award_kill", _reward];
				};
				[_responsibleLeader, _reward] call BIS_fnc_WL2_fundsControl;
			};
		};
	};
};