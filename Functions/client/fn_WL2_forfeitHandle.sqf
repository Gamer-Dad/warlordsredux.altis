#include "..\warlords_constants.inc"

params ["_side"];

if ((side group player) != _side) exitWith {};

_varNameVoting = format ["BIS_WL_forfeitVotingSince_%1", BIS_WL_playerSide];
_varNameVotingBy = format ["BIS_WL_forfeitOrderedBy_%1", BIS_WL_playerSide];

[toUpper format ["Surrender ordered by %1", missionNamespace getVariable _varNameVotingBy]] spawn BIS_fnc_WLSmoothText;
missionNamespace setVariable [_varNameVotingBy, ""];

if ((player getVariable ["BIS_WL_forfeitVote", -1]) == -1) then {
	[player, "forfeitVoting"] call BIS_fnc_WL2_hintHandle;
};

BIS_WL_ctrlDown = FALSE;

BIS_WL_forfeitVoteEH1 = (findDisplay 46) displayAddEventHandler ["KeyUp", {
	params ["_display", "_key"];
	
	if (_key == 29) then {BIS_WL_ctrlDown = FALSE};
}];

BIS_WL_forfeitVoteEH2 = (findDisplay 46) displayAddEventHandler ["KeyDown", {
	params ["_display", "_key"];
	
	if (_key == 29) then {BIS_WL_ctrlDown = TRUE};
	if (_key == 21) then {if (BIS_WL_ctrlDown) then {_remove = TRUE; playSound "AddItemOK"; player setVariable ["BIS_WL_forfeitVote", 1, [2, clientOwner]]}};
	if (_key == 49) then {if (BIS_WL_ctrlDown) then {_remove = TRUE; playSound "AddItemFailed"; player setVariable ["BIS_WL_forfeitVote", 0, [2, clientOwner]]}};
	if (_remove) then {
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", BIS_WL_forfeitVoteEH1];
		(findDisplay 46) displayRemoveEventHandler ["KeyUp", BIS_WL_forfeitVoteEH2];
	};
}];

waitUntil {sleep WL_TIMEOUT_SHORT; serverTime >= ((missionNamespace getVariable _varNameVoting) + 30) || (player getVariable ["BIS_WL_forfeitVote", -1]) != -1};

[player, "forfeitVoting", FALSE] call BIS_fnc_WL2_hintHandle;