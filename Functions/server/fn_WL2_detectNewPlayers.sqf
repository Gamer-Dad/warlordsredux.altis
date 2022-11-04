#include "..\warlords_constants.inc"

while {!BIS_WL_missionEnd} do {
	_newPlayers = BIS_WL_allWarlords select {!isNull _x && ((_x getVariable ["BIS_WL_detectedByServerSince", -1]) == -1) || (isPlayer _x && isNil {missionNamespace getVariable format ["BIS_WL_teamCheckOK_%1", getPlayerUID _x]})};
	{
		_x spawn BIS_fnc_WL2_setupNewWarlord;
		// Thanks to marii for the AI limiting code; Adjust numbers below for AI buddy count change
        //_text =  format ["# OF PLAYERS ON THE SEVER : %1 ", count BIS_WL_allWarlords];
        //[_text] remoteExec ["systemChat", 0];

       //AI buddy count system
		_players = count BIS_WL_allWarlords;
    	if (_players >= 51) then 
		{
        	BIS_WL_maxSubordinates = 1;
			publicVariable "BIS_WL_maxSubordinates";
			systemchat "Player count at 40 or greater. Max AI now at 0; human interaction now required!";			
        }
		Else 
		{
			if (_players >= 50) then
			{
				BIS_WL_maxSubordinates = 2;
				publicVariable "BIS_WL_maxSubordinates";
				systemchat "Player count at 30 or greater. Max AI now at 2; make em count!";
			}
			Else 
			{
				if (_players >= 40) then
				{
					BIS_WL_maxSubordinates = 4;
					publicVariable "BIS_WL_maxSubordinates";
					systemchat "Player count at 20 or greater. Max AI now at 4; put them to work!";
				}
				Else 
				{
					if (_players >= 30) then
					{
						BIS_WL_maxSubordinates = 8;
						publicVariable "BIS_WL_maxSubordinates";
						systemchat "Player count at 10 or greater. Max AI now at 8; squad size!";
					}
					Else 
					{
						if (_players >= 20) then
						{
							BIS_WL_maxSubordinates = 16;
							publicVariable "BIS_WL_maxSubordinates";
							systemchat "Player count at 6 or greater. Max AI now at 16; you can make it work!";
						}
						Else 
						{
							if (_players < 10) then
							{
								BIS_WL_maxSubordinates = 20;
								publicVariable "BIS_WL_maxSubordinates";
								systemchat "Player count at less than 6. Max AI now at 20; full company size!";
							}
						} 
					} 
				} 
			} 
		};









	} forEach _newPlayers;
	
	uiSleep WL_TIMEOUT_STANDARD;
};