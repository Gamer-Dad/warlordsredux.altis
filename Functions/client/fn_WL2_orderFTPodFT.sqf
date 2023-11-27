"RequestMenu_close" call BIS_fnc_WL2_setupUI;

if (playerSide == west) exitWith {
	{
		private _ambuPosBlu = getPosATL _x;
		private _center = _ambuPosBlu;
		private _radius = 15;
		private _angle = random 360;					
		private _randomSquareRoot = sqrt random 1;			
		private _distance = _radius * _randomSquareRoot;	
		private _positionFT = _center getPos [_distance, _angle];

		titleCut ["", "BLACK OUT", 1];
		openMap false;
		"Fast_travel" call BIS_fnc_WL2_announcer;
		[toUpper localize "STR_A3_WL_popup_travelling_FTVehicle"] spawn BIS_fnc_WL2_smoothText;
		sleep 1;
		player setPos _positionFT;
		sleep 1;
		titleCut ["", "BLACK IN", 1];
	} forEach entities "B_Slingload_01_Medevac_F";
};

if (playerSide == east) exitWith {
	{
		titleCut ["", "BLACK OUT", 1];
		openMap false;
		"Fast_travel" call BIS_fnc_WL2_announcer;
		[toUpper localize "STR_A3_WL_popup_travelling_FTVehicle"] spawn BIS_fnc_WL2_smoothText;
		sleep 1;
		player moveInCargo _x;
		sleep 1;
		titleCut ["", "BLACK IN", 1];
	} forEach entities "Land_Pod_Heli_Transport_04_medevac_F";
};