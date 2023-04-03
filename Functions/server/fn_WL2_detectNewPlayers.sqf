#include "..\warlords_constants.inc"

[] spawn {
	while {!BIS_WL_missionEnd} do {
		_players = count BIS_WL_allWarlords;
    	if (_players >= 51) then 
		{	
			["Player count at 51 or greater. Max AI now at 1, human interaction encouraged!"] remoteExec ["systemchat", -2];
        }
		Else 
		{
			if (_players >= 45) then
			{
				["Player count at 45 or greater. Max AI now at 2, make em count!"] remoteExec ["systemchat", -2];
			}
			Else 
			{
				if (_players >= 40) then
				{
					["Player count at 40 or greater. Max AI now at 3, put them to work!"] remoteExec ["systemchat", -2];
				}
				Else 
				{
					if (_players >= 30) then
					{
						["Player count at 30 or greater. Max AI now at 4, squad size!"] remoteExec ["systemchat", -2];
					}
					Else 
					{
						if (_players >= 20) then
						{
							["Player count at 20 or greater. Max AI now at 5, you can make it work!"] remoteExec ["systemchat", -2];
						}
						Else 
						{
							if (_players < 10) then
							{
								["Player count at less than 10. Max AI now at 6, full company size!"] remoteExec ["systemchat", -2];
							};
						};
					};
				};
			};
		};
		uiSleep 900;
	};
};

while {!BIS_WL_missionEnd} do {
	_newPlayers = BIS_WL_allWarlords select {!isNull _x && ((_x getVariable ["BIS_WL_detectedByServerSince", -1]) == -1) || (isPlayer _x && isNil {missionNamespace getVariable format ["BIS_WL_teamCheckOK_%1", getPlayerUID _x]})};
	{
		_westCnt = playersNumber west;
		_eastCnt = playersNumber east;

		if (side _x == west) then {
			if (_westCnt > _eastCnt) then {
				if ((abs (_westCnt - _eastCnt)) > 3) then {
					["imbalance", false, 1, false, true] remoteExec ["BIS_fnc_endMission", (owner _x)];
				} else {
					_x spawn BIS_fnc_WL2_setupNewWarlord;
				};
			} else {
				_x spawn BIS_fnc_WL2_setupNewWarlord;
			};
		} else {
			if (_eastCnt > _westCnt) then {
				if ((abs (_eastCnt - _westCnt)) > 3) then {
					["imbalance", false, true, false, true] remoteExec ["BIS_fnc_endMission", (owner _x)];
				} else {
					_x spawn BIS_fnc_WL2_setupNewWarlord;
				};
			} else {
				_x spawn BIS_fnc_WL2_setupNewWarlord;
			};
		};

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