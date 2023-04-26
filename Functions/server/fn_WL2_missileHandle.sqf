#include "..\warlords_constants.inc"

params ["_m"];

_reg =  [];

while {alive _m} do {
	{
		if !(_x in _reg) then {
			_reg pushBackUnique _x;
			(_x getVariable "incomming") pushBackUnique _m;
			_x setVariable ["incomming", (_x getVariable "incomming"), true];
		};
	} forEach (_m nearEntities 6000) select {_x getVariable "cramActivated" && typeOf _x == "B_AAA_System_01_F"};
	Sleep 1;
};