#include "..\warlords_constants.inc"

BIS_WL_playerSide spawn {
	_varNameVoting = format ["BIS_WL_targetResetVotingSince_%1", _this];
	_varNameReset = format ["BIS_WL_targetResetOrderedBy_%1", _this];
	
	while {!BIS_WL_missionEnd} do {
		waitUntil {sleep WL_TIMEOUT_STANDARD; serverTime < ((missionNamespace getVariable [_varNameVoting, -1]) + WL_TARGET_RESET_VOTING_TIME) && !isNull WL_TARGET_FRIENDLY && (missionNamespace getVariable [_varNameReset, ""]) != ""};
		
		[toUpper format [localize "STR_A3_WL_popup_voting_reset_user_TODO_REWRITE", missionNamespace getVariable _varNameReset]] spawn BIS_fnc_WLSmoothText;
		missionNamespace setVariable [_varNameReset, ""];
		
		if ((player getVariable ["BIS_WL_targetResetVote", -1]) == -1) then {
			[player, "targetResetVoting"] call BIS_fnc_WL2_hintHandle;
		};
		
		BIS_WL_ctrlDown = FALSE;
		
		BIS_WL_targetResetVoteEH1 = (findDisplay 46) displayAddEventHandler ["KeyUp", {
			params ["_display", "_key"];
			
			if (_key == 29) then {BIS_WL_ctrlDown = FALSE};
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
		
		waitUntil {sleep WL_TIMEOUT_SHORT; serverTime >= ((missionNamespace getVariable _varNameVoting) + WL_TARGET_RESET_VOTING_TIME) || isNull WL_TARGET_FRIENDLY || (player getVariable ["BIS_WL_targetResetVote", -1]) != -1};

		[player, "targetResetVoting", FALSE] call BIS_fnc_WL2_hintHandle;
	};
};

BIS_WL_playerSide spawn {
	_varName = format ["BIS_WL_recentTargetReset_%1", _this];
	_target = objNull;
	
	while {!BIS_WL_missionEnd} do {
		waitUntil {sleep WL_TIMEOUT_STANDARD; !isNull WL_TARGET_FRIENDLY};
		
		_target = WL_TARGET_FRIENDLY;
		waitUntil {sleep WL_TIMEOUT_STANDARD; isNull WL_TARGET_FRIENDLY};
		
		_t = serverTime + 3;
		waitUntil {sleep WL_TIMEOUT_SHORT; serverTime > _t || (_target getVariable "BIS_WL_owner") == BIS_WL_playerSide || (missionNamespace getVariable [_varName, FALSE])};
		
		if (missionNamespace getVariable [_varName, FALSE]) then {
			"Reset" call BIS_fnc_WL2_announcer;
			
			if (player inArea (_target getVariable "objectAreaComplete")) then {
				["seizing", []] spawn BIS_fnc_WL2_setOSDEvent;
			};
			
			if !(isServer) then {
				["client", TRUE] call BIS_fnc_WL2_updateSectorArrays;
			};
		};
	};
};

BIS_WL_enemySide spawn {
	_varName = format ["BIS_WL_targetResetOrderedBy_%1", _this];
	_target = objNull;
	
	while {!BIS_WL_missionEnd} do {
		waitUntil {sleep WL_TIMEOUT_STANDARD; !isNull WL_TARGET_ENEMY};
		
		_target = WL_TARGET_ENEMY;
		waitUntil {sleep WL_TIMEOUT_STANDARD; isNull WL_TARGET_ENEMY};
		
		_t = serverTime + 3;
		waitUntil {sleep WL_TIMEOUT_SHORT; serverTime > _t || (_target getVariable "BIS_WL_owner") == BIS_WL_playerSide || ((missionNamespace getVariable [_varName, ""]) != "")};
		
		if ((missionNamespace getVariable [_varName, ""]) != "") then {
			missionNamespace setVariable [_varName, ""];
			[toUpper format [localize "STR_A3_WL_popup_voting_reset_user", _this call BIS_fnc_WL2_sideToFaction]] spawn BIS_fnc_WLSmoothText;
			missionNamespace setVariable [_varName, ""];
		};
	};
};