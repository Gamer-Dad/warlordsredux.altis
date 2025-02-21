/*******************************START OF SCRIPTS****************************/

0 spawn APS_fnc_defineVehicles;

if !(isDedicated) then {
	call GFE_fnc_credits;

	waitUntil { !isNull player };
};
/*******************************END OF SCRIPTS****************************/

call WL2_fnc_initCommon;