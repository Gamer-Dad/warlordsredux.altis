#include "..\warlords_constants.inc"

params ["_warlord"];

private _startingPos = position _warlord;
private _markers = (side group _warlord) call BIS_fnc_WL2_getRespawnMarkers;


_warlord setVariable ["BIS_WL_detectedByServerSince", serverTime];
_warlord setVariable ["BIS_WL_friendlyKillTimestamps", [], [2, (owner _warlord)]];
serverNamespace setVariable [format ["BIS_WL_isTransferring_%1", getPlayerUID _warlord], false];

//CP database
private _uid = getPlayerUID _warlord;
private _fundsDB = (serverNamespace getVariable "fundsDatabase");
private _pFunds = ((serverNamespace getVariable "fundsDatabase") getOrDefault [_uid, 1000]);
_fundsDB set [_uid, _pFunds];
[(serverNamespace getVariable "fundsDatabase"), _uid] call BIS_fnc_WL2_fundsDatabaseUpdate;


_boundToAnotherTeam = FALSE;

if (isPlayer _warlord) then {
	_playerVarID = format ["BIS_WL_teamCheckOK_%1", getPlayerUID _warlord];
	_boundToAnotherTeam = (getPlayerUID _warlord) in (missionNamespace getVariable format ["BIS_WL_boundTo%1", (BIS_WL_competingSides - [side group _warlord]) # 0]);
	missionNamespace setVariable [_playerVarID, !_boundToAnotherTeam];
	(owner _warlord) publicVariableClient _playerVarID;
	
	
	if !(_boundToAnotherTeam) then {
		(missionNamespace getVariable format ["BIS_WL_boundTo%1", side group _warlord]) pushBackUnique getPlayerUID _warlord;
		_playerSideArr = BIS_WL_playerIDArr # (BIS_WL_competingSides find side group _warlord);
		_playerSideArr pushBackUnique getPlayerUID _warlord;
		0 spawn BIS_fnc_WL2_calcImbalance;
	} else {
		_warlord setVariable ["BIS_WL_ignore", TRUE, TRUE];   //think this code block is server side blocking team switching
		_warlord enableSimulationGlobal FALSE;
		_warlord hideObjectGlobal TRUE;
		BIS_WL_allWarlords = BIS_WL_allWarlords - [_warlord];
	};    
};

if !(_boundToAnotherTeam) then {
	_friendlyFireVarName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", getPlayerUID _warlord];
	if ((missionNamespace getVariable _friendlyFireVarName) > serverTime) then {
		(owner _warlord) publicVariableClient _friendlyFireVarName;
	};

	[_warlord] call BIS_fnc_WL2_respawnHandle;
	
	_respawnPos = markerPos selectRandom _markers;
	while {_warlord distance2D _respawnPos > 150} do {
		[_warlord, [_respawnPos, [], 10, "NONE"]] remoteExec ["setVehiclePosition", _warlord];
		sleep 1;
	};
};