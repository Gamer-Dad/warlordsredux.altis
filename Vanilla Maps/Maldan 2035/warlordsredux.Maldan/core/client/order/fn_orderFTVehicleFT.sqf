"RequestMenu_close" call WL2_fnc_setupUI;

private _side = [west, east] find BIS_WL_playerSide;
private _vic = ["B_Truck_01_medical_F", "O_Truck_03_medical_F"] select _side;

{
	titleCut ["", "BLACK OUT", 1];
	openMap false;
	"Fast_travel" call WL2_fnc_announcer;
	[toUpper localize "STR_A3_WL_popup_travelling_FTVehicle"] spawn WL2_fnc_smoothText;
	sleep 1;
	player moveInCargo _x;

	[player, "ftSupportPoints", _x] remoteExec ["WL2_fnc_handleClientRequest", 2];
	sleep 1;
	titleCut ["", "BLACK IN", 1];
} forEach ((entities _vic) select {alive _x});

["TaskFastTravelFTVehicle"] call WLT_fnc_taskComplete;