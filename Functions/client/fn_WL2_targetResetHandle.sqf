#include "..\warlords_constants.inc"

BIS_WL_playerSide spawn {
	_varName = format ["BIS_WL_recentTargetReset_%1", _this];
	_target = objNull;
	
	while {!BIS_WL_missionEnd} do {
		waitUntil {sleep WL_TIMEOUT_STANDARD; !isNull WL_TARGET_FRIENDLY};
		
		_target = WL_TARGET_FRIENDLY;
		waitUntil {sleep WL_TIMEOUT_STANDARD; isNull WL_TARGET_FRIENDLY};
		
		_t = serverTime + 3;
		waitUntil {sleep WL_TIMEOUT_SHORT; serverTime > _t || {(_target getVariable "BIS_WL_owner") == BIS_WL_playerSide || {(missionNamespace getVariable [_varName, false])}}};
		
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
		waitUntil {sleep WL_TIMEOUT_SHORT; serverTime > _t || {(_target getVariable "BIS_WL_owner") == BIS_WL_playerSide || {((missionNamespace getVariable [_varName, ""]) != "")}}};
		
		if ((missionNamespace getVariable [_varName, ""]) != "") then {
			missionNamespace setVariable [_varName, ""];
			[toUpper format [localize "STR_A3_WL_popup_voting_reset_user", _this call BIS_fnc_WL2_sideToFaction]] spawn BIS_fnc_WLSmoothText;
			missionNamespace setVariable [_varName, ""];
		};
	};
};