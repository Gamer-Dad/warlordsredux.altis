[player, 0] call BIS_fnc_WL2_fundsControl;
private  _id = clientOwner;
[] remoteExec ["BIS_fnc_WL2_clientFundsUpdate",  _id];

["RequestMenu_close"] call BIS_fnc_WL2_setupUI;

if (side player == west) then {
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
		sleep 2;
		player setPos _positionFT;
		titleCut ["", "BLACK IN", 1];

	} forEach entities "B_Truck_01_medical_F";
};

if (side player == east) then {
	{
		private _ambuPosOpf = getPosATL _x;
		private _center = _ambuPosOpf;
		private _radius = 15;

		private _angle = random 360;					
		private _randomSquareRoot = sqrt random 1;			
		private _distance = _radius * _randomSquareRoot;	
		private _positionFT = _center getPos [_distance, _angle];

		titleCut ["", "BLACK OUT", 1];
		openMap false;
		[toUpper localize "STR_A3_WL_popup_travelling_FTVehicle"] spawn BIS_fnc_WL2_smoothText;
		"Fast_travel" call BIS_fnc_WL2_announcer;
		sleep 2;
		player setPos _positionFT;
		titleCut ["", "BLACK IN", 1];

	} forEach entities "O_Truck_02_medical_F";
};