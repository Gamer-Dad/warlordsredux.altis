if !(isDedicated) then {
	{deleteMarkerLocal _x} forEach ["BIS_WL_targetEnemy", "BIS_WL_targetFriendly"];
	
	_victory = if (!isNil {(missionNamespace getVariable "BIS_WL_ffTeam")}) then {!((missionNamespace getVariable ["BIS_WL_ffTeam", Independent]) == side group player)} else {(BIS_WL_base1 getVariable "BIS_WL_owner") == side group player};
	private _audio = if (_victory) then {"Victory"} else {"Defeat"};
	_audio call BIS_fnc_WL2_announcer;
	private _debriefing = format ["BIS_WL%1%2", if (_victory) then {"Victory"} else {"Defeat"}, BIS_WL_playerSide];
	private _finalVictory = if (_victory) then {true} else {false};
	[_debriefing, _finalVictory] call BIS_fnc_endMission;
} else {
	sleep 15;
	endMission "End1";
};