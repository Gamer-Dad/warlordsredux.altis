#include "..\warlords_constants.inc"
["RequestMenu_close"] spawn BIS_fnc_WL2_setupU;

if (side player == west) exitWith {
	{
		titleCut ["", "BLACK OUT", 1];
		openMap false;
		"Fast_travel" call BIS_fnc_WL2_announcer;
		[toUpper localize "STR_A3_WL_popup_travelling_FTVehicle"] spawn BIS_fnc_WL2_smoothText;
		sleep 1;
		player moveInCargo _x;
		sleep 1;
		titleCut ["", "BLACK IN", 1];
	} forEach ((entities "B_Truck_01_medical_F") select {alive _x});
};

if (side player == east) exitWith {
	{
		titleCut ["", "BLACK OUT", 1];
		openMap false;
		"Fast_travel" call BIS_fnc_WL2_announcer;
		[toUpper localize "STR_A3_WL_popup_travelling_FTVehicle"] spawn BIS_fnc_WL2_smoothText;
		sleep 1;
		player moveInCargo _x;
		sleep 1;
		titleCut ["", "BLACK IN", 1];
	} forEach ((entities "O_Truck_03_medical_F") select {alive _x});
};