"RequestMenu_close" call WL2_fnc_setupUI;

switch (side group player) do {
	case west: {
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
			"Fast_travel" call WL2_fnc_announcer;
			[toUpper localize "STR_A3_WL_popup_travelling_FTVehicle"] spawn WL2_fnc_smoothText;
			sleep 1;
			player setPos _positionFT;

			[player, "ftSupportPoints", _x] remoteExec ["WL2_fnc_handleClientRequest", 2];
			sleep 1;
			titleCut ["", "BLACK IN", 1];
		} forEach entities "B_Slingload_01_Medevac_F";
	};
	case east: {
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
		} forEach entities "Land_Pod_Heli_Transport_04_medevac_F";
	};
};

["TaskFastTravelFTPod"] call WLT_fnc_taskComplete;