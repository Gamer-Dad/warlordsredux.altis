#include "..\warlords_constants.inc"

while {true} do {
	{
		_pos = getPosASLW _x;
		if (_pos select 2 < -2.5) then {
			[_x, _pos] spawn {
				sleep 2;
				if ((_this # 1) select 2 < -2.5) then {
					(_this # 0) setDamage 1;
					deleteVehicle (_this # 0);
				};
			};
		};	
	} forEach ((missionNamespace getVariable [format ["BIS_WL_%1_ownedVehicles", getPlayerUID player], []]) select {(alive _x) && !(_x isKindOf "Man")});
	sleep 10;
};