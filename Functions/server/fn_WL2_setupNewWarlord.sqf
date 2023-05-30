#include "..\warlords_constants.inc"

params ["_warlord"];

private _startingPos = position _warlord;
private _markers = (side group _warlord) call BIS_fnc_WL2_getRespawnMarkers;
private _varFormat = "";


_warlord setVariable ["BIS_WL_detectedByServerSince", WL_SYNCED_TIME];
_warlord setVariable ["BIS_WL_friendlyKillTimestamps", []];
serverNamespace setVariable [format ["BIS_WL_isTransferring_%1", getPlayerUID _warlord], false];

//CP database
private _uid = getPlayerUID _warlord;
private _fundsDB = (serverNamespace getVariable "fundsDatabase");
private _pFunds = ((serverNamespace getVariable "fundsDatabase") getOrDefault [_uid, 1000]);
_fundsDB set [_uid, _pFunds];
[(serverNamespace getVariable "fundsDatabase"), _uid] spawn BIS_fnc_WL2_fundsDatabaseUpdate;


_boundToAnotherTeam = FALSE;

if (isPlayer _warlord) then {
	_playerVarID = format ["BIS_WL_teamCheckOK_%1", getPlayerUID _warlord];
	_boundToAnotherTeam = (getPlayerUID _warlord) in (missionNamespace getVariable format ["BIS_WL_boundTo%1", (BIS_WL_competingSides deleteAt (BIS_WL_competingSides find (side group _warlord))) # 0]);
	missionNamespace setVariable [_playerVarID, !_boundToAnotherTeam];
	(owner _warlord) publicVariableClient _playerVarID;
	
	
	if !(_boundToAnotherTeam) then {
		(missionNamespace getVariable format ["BIS_WL_boundTo%1", side group _warlord]) pushBackUnique getPlayerUID _warlord;
		_playerSideArr = BIS_WL_playerIDArr # (BIS_WL_competingSides find side group _warlord);
		_playerSideArr pushBackUnique getPlayerUID _warlord;
		
		_varFormat = format ["BIS_WL_%1_repositionDone", getPlayerUID _warlord];
		waitUntil {!(missionNamespace getVariable [_varFormat, TRUE])};
	} else {
		_warlord setVariable ["BIS_WL_ignore", TRUE, TRUE];   //think this code block is server side blocking team switching
		_warlord enableSimulationGlobal FALSE;
		_warlord hideObjectGlobal TRUE;
		BIS_WL_allWarlords = (BIS_WL_allWarlords deleteAt (BIS_WL_allWarlords find _warlord));
	};    
};

if !(_boundToAnotherTeam) then {
	_respawnPos = markerPos selectRandom _markers;

	while {if (isPlayer _warlord) then {!(missionNamespace getVariable [_varFormat, FALSE])} else {_warlord distance2D _respawnPos > 100}} do {
		[_warlord, [_respawnPos, [], 10, "NONE"]] remoteExec ["setVehiclePosition", _warlord];
		uiSleep WL_TIMEOUT_STANDARD;
	};
	
	if (_varFormat != "") then {
		missionNamespace setVariable [_varFormat, FALSE];
	};
	
	_friendlyFireVarName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", getPlayerUID _warlord];
	if ((missionNamespace getVariable _friendlyFireVarName) > WL_SYNCED_TIME) then {
		(owner _warlord) publicVariableClient _friendlyFireVarName;
	};

	[_warlord] call BIS_fnc_WL2_respawnHandle;
};