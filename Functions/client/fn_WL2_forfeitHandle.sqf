#include "..\warlords_constants.inc"

BIS_WL_playerSide spawn {
	_varNameVoting = format ["BIS_WL_forfeitVotingSince_%1", _this];
	_varNameVotingBy = format ["BIS_WL_forfeitOrderedBy_%1", _this];
	
	while {!BIS_WL_missionEnd} do {
		waitUntil {sleep WL_TIMEOUT_STANDARD; WL_SYNCED_TIME < ((missionNamespace getVariable [_varNameVoting, -1]) + 60) && (missionNamespace getVariable [_varNameVotingBy, ""]) != ""};
		
		[toUpper format ["Surrender ordered by %1", missionNamespace getVariable _varNameVotingBy]] spawn BIS_fnc_WLSmoothText;
		missionNamespace setVariable [_varNameVotingBy, ""];
		
		if ((player getVariable ["BIS_WL_forfeitVote", -1]) == -1) then {
			[player, "forfeitVoting"] call BIS_fnc_WL2_hintHandle;
		};
		
		BIS_WL_ctrlDown = FALSE;
		
		BIS_WL_forfeitVoteEH1 = WL_DISPLAY_MAIN displayAddEventHandler ["KeyUp", {
			params ["_display", "_key"];
			
			if (_key == 29) then {BIS_WL_ctrlDown = FALSE};
		}];
		
		BIS_WL_forfeitVoteEH2 = WL_DISPLAY_MAIN displayAddEventHandler ["KeyDown", {
			params ["_display", "_key"];
			
			if (_key == 29) then {BIS_WL_ctrlDown = TRUE};
			if (_key == 21) then {if (BIS_WL_ctrlDown) then {_remove = TRUE; playSound "AddItemOK"; player setVariable ["BIS_WL_forfeitVote", 1, TRUE]}};
			if (_key == 49) then {if (BIS_WL_ctrlDown) then {_remove = TRUE; playSound "AddItemFailed"; player setVariable ["BIS_WL_forfeitVote", 0, TRUE]}};
			if (_remove) then {
				WL_DISPLAY_MAIN displayRemoveEventHandler ["KeyDown", BIS_WL_forfeitVoteEH1];
				WL_DISPLAY_MAIN displayRemoveEventHandler ["KeyUp", BIS_WL_forfeitVoteEH2];
			};
		}];
		
		waitUntil {sleep WL_TIMEOUT_SHORT; WL_SYNCED_TIME >= ((missionNamespace getVariable _varNameVoting) + 60) || (player getVariable ["BIS_WL_forfeitVote", -1]) != -1};

		[player, "forfeitVoting", FALSE] call BIS_fnc_WL2_hintHandle;
	};
};