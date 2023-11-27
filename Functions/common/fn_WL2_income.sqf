params ["_side"];

if (isServer) then {
	(BIS_WL_sectorsArrays # (BIS_WL_competingSides find _side)) # 4;
} else {
	if (_side == playerSide) then {BIS_WL_sectorsArray # 4} else {BIS_WL_sectorsArrayEnemy # 4};
};