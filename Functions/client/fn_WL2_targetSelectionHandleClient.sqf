#include "..\warlords_constants.inc"

{_x setMarkerAlphaLocal 0} forEach BIS_WL_sectorLinks;
_mostVotedVar = format ["BIS_WL_mostVoted_%1", playerSide];

while {!BIS_WL_missionEnd} do {
	_lastTarget = WL_TARGET_FRIENDLY;
	waitUntil {sleep WL_TIMEOUT_STANDARD; isNull WL_TARGET_FRIENDLY};
	if !(isNull (uiNamespace getVariable ["BIS_WL_purchaseMenuDisplay", displayNull])) then {
		[player, "fundsTransferCancel"] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2];
		playSound "AddItemFailed";
	};
	"RequestMenu_close" call BIS_fnc_WL2_setupUI;
	BIS_WL_currentSelection = WL_ID_SELECTION_VOTING;
	0 spawn {
		sleep WL_TIMEOUT_STANDARD;
		if (BIS_WL_missionEnd) exitWith {};
		"Voting" call BIS_fnc_WL2_announcer;
		[toUpper localize "STR_A3_WL_popup_voting"] spawn BIS_fnc_WL2_smoothText;
		sleep WL_TIMEOUT_STANDARD;
		waitUntil {visibleMap || {!isNull WL_TARGET_FRIENDLY}};
		if (visibleMap && isNull BIS_WL_targetVote) then {
			"Sector" call BIS_fnc_WL2_announcer;
			[toUpper localize "STR_A3_WL_info_voting_click"] spawn BIS_fnc_WL2_smoothText;
		};
	};
	if !(isNull _lastTarget) then {
		_t = serverTime + 3;
		waitUntil {(_lastTarget getVariable "BIS_WL_owner") == playerSide || {serverTime > _t}};
	};
	["client"] call BIS_fnc_WL2_updateSectorArrays;
	_mostVotedVar spawn {
		waitUntil {count (missionNamespace getVariable [_this, []]) > 0};
		_data = (missionNamespace getVariable _this);
		["voting", [(_data # 1) - (getMissionConfigValue ["BIS_WL_sectorVotingDuration", 15]), _data # 1, _this]] spawn BIS_fnc_WL2_setOSDEvent;
	};
	
	"voting" spawn BIS_fnc_WL2_sectorSelectionHandle;

	0 spawn {
		waitUntil {!(BIS_WL_currentSelection in [WL_ID_SELECTION_VOTING, WL_ID_SELECTION_VOTED]) || {BIS_WL_missionEnd || {BIS_WL_resetTargetSelection_client}}};
		
		["voting", "end"] spawn BIS_fnc_WL2_sectorSelectionHandle;
	};
	
	if !(isServer) then {
		waitUntil {!isNull WL_TARGET_FRIENDLY || {BIS_WL_missionEnd || {BIS_WL_resetTargetSelection_client}}};
	} else {
		_pass = FALSE;
		while {!_pass} do {
			waitUntil {!isNull WL_TARGET_FRIENDLY || {BIS_WL_missionEnd || {BIS_WL_resetTargetSelection_client}}};
			if (BIS_WL_resetTargetSelection_client) then {
				sleep WL_TIMEOUT_STANDARD;
				if (BIS_WL_resetTargetSelection_client) then {
					_pass = TRUE;
				};
			} else {
				_pass = TRUE;
			};
		};
	};
	
	BIS_WL_targetVote = objNull;
	
	if (BIS_WL_currentSelection in [WL_ID_SELECTION_VOTING, WL_ID_SELECTION_VOTED]) then {
		BIS_WL_currentSelection = WL_ID_SELECTION_NONE;
	};
		
	missionNamespace setVariable [_mostVotedVar, []];
	missionNamespace setVariable [format ["BIS_WL_targetVote_%1", getPlayerUID player], objNull];
	
	if (BIS_WL_resetTargetSelection_client) then {
		BIS_WL_resetTargetSelection_client = FALSE;
		"Reset" call BIS_fnc_WL2_announcer;
		["voting", []] spawn BIS_fnc_WL2_setOSDEvent;
		[toUpper localize "STR_A3_WL_voting_reset"] spawn BIS_fnc_WL2_smoothText;
		sleep 2;
	} else {
		call BIS_fnc_WL2_refreshCurrentTargetData;
		if !(BIS_WL_missionEnd) then {
			waitUntil {sleep WL_TIMEOUT_MIN; !isNull WL_TARGET_FRIENDLY};
			"Selected" call BIS_fnc_WL2_announcer;
			[toUpper format [localize "STR_A3_WL_popup_voting_done", WL_TARGET_FRIENDLY getVariable "BIS_WL_name"]] spawn BIS_fnc_WL2_smoothText;
			["client", TRUE] call BIS_fnc_WL2_updateSectorArrays;
		};
	};
};