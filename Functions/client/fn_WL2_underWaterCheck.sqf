#include "..\warlords_constants.inc"

while {true} do {
	{
		_pos = getPosASLW _x;
		if (_pos select 2 < -2.5) then {
			_x spawn {
				sleep 2;
				if (_pos select 2 < -2.5) then {
					_x setDamage 1;
				};
			};
		};	
	} forEach ((missionNamespace getVariable [format ["BIS_WL_%1_ownedVehicles", getPlayerUID player], []]) select {(alive _x) && !(_x isKindOf "Man")});
	sleep 10;
};

