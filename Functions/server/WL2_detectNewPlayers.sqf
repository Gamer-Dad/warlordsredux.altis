#include "..\warlords_constants.inc"

while {!BIS_WL_missionEnd} do {
	_newPlayers = BIS_WL_allWarlords select {!isNull _x && ((_x getVariable ["BIS_WL_detectedByServerSince", -1]) == -1) || (isPlayer _x && isNil {missionNamespace getVariable format ["BIS_WL_teamCheckOK_%1", getPlayerUID _x]})};
	{
		_x spawn BIS_fnc_WL2_setupNewWarlord;
		// Thanks to marii for the AI limiting code; Adjust numbers below for AI buddy count change
        //_text =  format ["# OF PLAYERS ON THE SEVER : %1 ", count BIS_WL_allWarlords];
        //[_text] remoteExec ["systemChat", 0];
        /*
        _players = count BIS_WL_allWarlords;
        if (_players >= 32) then 
		{
        	BIS_WL_maxSubordinates = 2;
			publicVariable "BIS_WL_maxSubordinates"
        }
		Else 
		{
			if (_players >= 18) then
			{
				BIS_WL_maxSubordinates = 4;
				publicVariable "BIS_WL_maxSubordinates"
			} 
		};*/
	} forEach _newPlayers;
	
	uiSleep WL_TIMEOUT_STANDARD;
};