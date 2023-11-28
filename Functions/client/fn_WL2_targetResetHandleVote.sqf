#include "..\warlords_constants.inc"

params ["_side"];

if (BIS_WL_playerSide != _side) exitWith {};

_varNameVoting = format ["BIS_WL_targetResetVotingSince_%1", _side];
_varNameReset = format ["BIS_WL_targetResetOrderedBy_%1", _side];

[toUpper format [localize "STR_A3_WL_popup_voting_reset_user_TODO_REWRITE", missionNamespace getVariable _varNameReset]] spawn BIS_fnc_WLSmoothText;
missionNamespace setVariable [_varNameReset, ""];

if ((player getVariable ["BIS_WL_targetResetVote", -1]) == -1) then {
	[player, "targetResetVoting"] call BIS_fnc_WL2_hintHandle;

	BIS_WL_ctrlDown = false;

	BIS_WL_targetResetVoteEH1 = (findDisplay 46) displayAddEventHandler ["KeyUp", {
		params ["_display", "_key"];
		
		if (_key == 29) then {BIS_WL_ctrlDown = false};
	}];

	BIS_WL_targetResetVoteEH2 = (findDisplay 46) displayAddEventHandler ["KeyDown", {
		params ["_display", "_key"];
		
		if (_key == 29) then {BIS_WL_ctrlDown = TRUE};
		if (_key == 21) then {if (BIS_WL_ctrlDown) then {_remove = TRUE; playSound "AddItemOK"; player setVariable ["BIS_WL_targetResetVote", 1, [2, clientOwner]]}};
		if (_key == 49) then {if (BIS_WL_ctrlDown) then {_remove = TRUE; playSound "AddItemFailed"; player setVariable ["BIS_WL_targetResetVote", 0, [2, clientOwner]]}};
		if (_remove) then {
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", BIS_WL_targetResetVoteEH1];
			(findDisplay 46) displayRemoveEventHandler ["KeyUp", BIS_WL_targetResetVoteEH2];
		};
	}];

	waitUntil {sleep WL_TIMEOUT_SHORT; serverTime >= ((missionNamespace getVariable _varNameVoting) + WL_TARGET_RESET_VOTING_TIME) || {isNull WL_TARGET_FRIENDLY || {(player getVariable ["BIS_WL_targetResetVote", -1]) != -1}}};

	[player, "targetResetVoting", FALSE] call BIS_fnc_WL2_hintHandle;
};