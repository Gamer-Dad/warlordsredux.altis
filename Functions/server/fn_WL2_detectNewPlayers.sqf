#include "..\warlords_constants.inc"

while {!BIS_WL_missionEnd} do {
	_newPlayers = BIS_WL_allWarlords select {(!isNull _x) && {((_x getVariable ["BIS_WL_detectedByServerSince", -1]) == -1) || {(isPlayer _x) && {isNil {missionNamespace getVariable format ["BIS_WL_teamCheckOK_%1", getPlayerUID _x]}}}}};
	{
		_x spawn BIS_fnc_WL2_setupNewWarlord;
		
		// Thanks to marii for the AI limiting code; Adjust numbers below for AI buddy count change
        //AI buddy count system
		_players = count BIS_WL_allWarlords;
    	if (_players >= 51) then 
		{
        	BIS_WL_maxSubordinates = 1;
			publicVariable "BIS_WL_maxSubordinates";		
        }
		Else 
		{
			if (_players >= 45) then
			{
				BIS_WL_maxSubordinates = 2;
				publicVariable "BIS_WL_maxSubordinates";
			}
			Else 
			{
				if (_players >= 40) then
				{
					BIS_WL_maxSubordinates = 3;
					publicVariable "BIS_WL_maxSubordinates";
				}
				Else 
				{
					if (_players >= 30) then
					{
						BIS_WL_maxSubordinates = 4;
						publicVariable "BIS_WL_maxSubordinates";
					}
					Else 
					{
						if (_players >= 20) then
						{
							BIS_WL_maxSubordinates = 5;
							publicVariable "BIS_WL_maxSubordinates";
						}
						Else 
						{
							if (_players < 10) then
							{
								BIS_WL_maxSubordinates = 6;
								publicVariable "BIS_WL_maxSubordinates";
							};
						};
					};
				};
			};
		};
	} forEach _newPlayers;
	uiSleep WL_TIMEOUT_STANDARD;
};