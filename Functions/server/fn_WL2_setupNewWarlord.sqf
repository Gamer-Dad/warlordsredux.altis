#include "..\warlords_constants.inc"

params ["_warlord"];

_warlord setVariable ["BIS_WL_detectedByServerSince", serverTime];
_warlord setVariable ["BIS_WL_friendlyKillTimestamps", [], [2, (owner _warlord)]];
serverNamespace setVariable [format ["BIS_WL_isTransferring_%1", getPlayerUID _warlord], false];

//CP database
private _uid = getPlayerUID _warlord;
private _pFunds = (serverNamespace getVariable "fundsDatabase") getOrDefault [_uid, -1];
if (_pFunds == -1) then {
	[_uid, 1000] call BIS_fnc_WL2_fundsDatabaseWrite;
} else {
	[_uid, 0] call BIS_fnc_WL2_fundsDatabaseWrite;
};

_boundToAnotherTeam = false;
if (isPlayer _warlord) then {
	_boundToAnotherTeam = _uid in (missionNamespace getVariable format ["BIS_WL_boundTo%1", ([west, east] select {_x != side group _warlord}) # 0]);
	_playerVarID = format ["BIS_WL_forceOtherTeam_%1", _uid];
	missionNamespace setVariable [_playerVarID, _boundToAnotherTeam, [2, (owner _warlord)]];

	if !(_boundToAnotherTeam) then {
		(missionNamespace getVariable format ["BIS_WL_boundTo%1", side group _warlord]) pushBackUnique _uid;
		_playerSideArr = BIS_WL_playerIDArr # (BIS_WL_competingSides find side group _warlord);
		_playerSideArr pushBackUnique _uid;

		_warlord spawn BIS_fnc_WL2_respawnHandle;
		sleep 1;
		_friendlyFireVarName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", _uid];
		if ((missionNamespace getVariable _friendlyFireVarName) > serverTime) then {
			[(missionNamespace getVariable _friendlyFireVarName)] remoteExec ["BIS_fnc_WL2_friendlyFireHandleClient", (owner _warlord)];
		};
	} else {
		_warlord setVariable ["BIS_WL_ignore", true, true];
		BIS_WL_allWarlords = BIS_WL_allWarlords - [_warlord];
	};

	0 spawn BIS_fnc_WL2_calcImbalance;
};