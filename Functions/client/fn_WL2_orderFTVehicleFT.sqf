"RequestMenu_close" call BIS_fnc_WL2_setupUI;

private _side = [west, east] find BIS_WL_playerSide;
private _vic = ["B_Truck_01_medical_F", "O_Truck_03_medical_F"] select _side;

{
	titleCut ["", "BLACK OUT", 1];
	openMap false;
	"Fast_travel" call BIS_fnc_WL2_announcer;
	[toUpper localize "STR_A3_WL_popup_travelling_FTVehicle"] spawn BIS_fnc_WL2_smoothText;
	sleep 1;
	player moveInCargo _x;
	sleep 1;
	titleCut ["", "BLACK IN", 1];
} forEach ((entities _vic) select {alive _x});