#include "..\warlords_constants.inc"

waitUntil {sleep WL_TIMEOUT_SHORT; (((BIS_WL_base1 getVariable ["BIS_WL_owner", civilian]) == (BIS_WL_base2 getVariable ["BIS_WL_owner", independent])) || {(BIS_WL_missionEnd == true)})};

private _winner = BIS_WL_base1 getVariable "BIS_WL_owner";

if !(isDedicated) then {
	removeMissionEventHandler ["EachFrame", BIS_WL_assetMapHandler];
	removeMissionEventHandler ["MapSingleClick", BIS_WL_assetMapClickHandler];
	removeMissionEventHandler ["Draw3D", missionNamespace getVariable ["BIS_WL_sceneDrawHandler", -1]];
	removeMissionEventHandler ["GroupIconClick", missionNamespace getVariable ["BIS_WL_groupIconClickHandler", -1]];
	removeMissionEventHandler ["GroupIconOverEnter", missionNamespace getVariable ["BIS_WL_groupIconEnterHandler", -1]];
	removeMissionEventHandler ["GroupIconOverLeave", missionNamespace getVariable ["BIS_WL_groupIconLeaveHandler", -1]];
	
	{deleteMarkerLocal _x} forEach ["BIS_WL_targetEnemy", "BIS_WL_targetFriendly"];
	
	if (!isNil {(missionNamespace getVariable "BIS_WL_ffTeam")}) exitWith {
		_victory = ((missionNamespace getVariable ["BIS_WL_ffTeam", Independent]) == side group player);
		if !(_victory) then {["Won"] call MRTM_fnc_statTracker;} else {["Lost"] call MRTM_fnc_statTracker;};
		_audio = if (_victory) then {"Defeat"} else {"Victory"};
		_audio call BIS_fnc_WL2_announcer;
		_debriefing = format ["BIS_WL%1%2", if (_victory) then {"Defeat"} else {"Victory"}, BIS_WL_playerSide];
		_finalVictory = if (_victory) then {false} else {true};
		[_debriefing, _finalVictory] call BIS_fnc_endMission;
	};
	_victory = _winner == BIS_WL_playerSide;
	_debriefing = format ["BIS_WL%1%2", if (_victory) then {"Victory"} else {"Defeat"}, BIS_WL_playerSide];
	[_debriefing, _victory] call BIS_fnc_endMission;
} else {
	sleep 15;
	endMission "End1";
};