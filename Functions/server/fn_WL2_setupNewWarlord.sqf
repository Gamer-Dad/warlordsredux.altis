params ["_warlord"];

_warlord setVariable ["BIS_WL_detectedByServerSince", serverTime];
_warlord setVariable ["BIS_WL_friendlyKillTimestamps", [], [2, (owner _warlord)]];
serverNamespace setVariable [format ["BIS_WL_isTransferring_%1", getPlayerUID _warlord], false];

//CP database
private _uid = getPlayerUID _warlord;
private _pFunds = (serverNamespace getVariable "fundsDatabase") getOrDefault [_uid, -1];
if (_pFunds == -1) then {
	1000 call BIS_fnc_WL2_fundsDatabaseWrite;
} else {
	0 call BIS_fnc_WL2_fundsDatabaseWrite;
};

_boundToAnotherTeam = false;
if (isPlayer _warlord) then {
	_boundToAnotherTeam = _uid in (serverNamespace getVariable format ["BIS_WL_boundTo%1", ([west, east] select {_x != side group _warlord}) # 0]);
	_playerVarID = format ["BIS_WL_forceOtherTeam_%1", _uid];
	missionNamespace setVariable [_playerVarID, _boundToAnotherTeam, [2, (owner _warlord)]];

	if !(_boundToAnotherTeam) then {
		(serverNamespace getVariable format ["BIS_WL_boundTo%1", side group _warlord]) pushBackUnique _uid;

		_warlord addEventHandler ["HandleDamage", {
			params ["_unit", "_selection", "_damage", "_source"];
			call BIS_fnc_WL2_setAssist;
		}];

		_friendlyFireVarName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", _uid];
		if ((serverNamespace getVariable _friendlyFireVarName) > serverTime) then {
			[(serverNamespace getVariable _friendlyFireVarName)] remoteExec ["BIS_fnc_WL2_friendlyFireHandleClient", (owner _warlord)];
		};
	} else {
		_warlord setVariable ["BIS_WL_ignore", true, true];
	};

	call BIS_fnc_WL2_calcImbalance;
};