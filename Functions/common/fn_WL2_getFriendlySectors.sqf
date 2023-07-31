params ["_caller"];

if (isServer) then {
	(BIS_WL_sectorsArrays # (BIS_WL_competingSides find (side _caller))) # 0;
} else {
	(BIS_WL_sectorsArray # 0);
};