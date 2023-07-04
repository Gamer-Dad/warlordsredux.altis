#include "..\warlords_constants.inc"

while {!BIS_WL_missionEnd} do {
	{
		_pos = getPosASLW _x;
		if (_pos select 2 < -2.5) then {
			[_x, _pos] spawn {
				sleep 2;
				if ((_this # 1) select 2 < -2.5) then {
					deleteVehicle (_this # 0);
				};
			};
		};	
	} forEach ((missionNamespace getVariable [format ["BIS_WL_%1_ownedVehicles", getPlayerUID player], []]) select {((alive _x) && {!(_x isKindOf "Man") && {(!(_x isKindOf "Ship")) && {(!(_x isKindOf "Submarine"))}}})});
	sleep 10;
};