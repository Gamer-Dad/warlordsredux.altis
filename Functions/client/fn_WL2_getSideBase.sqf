params ["_side"];

if !(_side in [west, east]) then {
	objNull;
} else {
	if ((BIS_WL_base1 getVariable "BIS_WL_originalOwner") == _side) then {
		BIS_WL_base1;
	} else {
		BIS_WL_base2;
	};
};