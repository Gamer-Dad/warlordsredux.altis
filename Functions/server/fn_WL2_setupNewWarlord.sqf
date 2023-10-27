#include "..\warlords_constants.inc"

params ["_warlord"];

_warlord setVariable ["BIS_WL_detectedByServerSince", serverTime];
_warlord setVariable ["BIS_WL_friendlyKillTimestamps", [], [2, (owner _warlord)]];
serverNamespace setVariable [format ["BIS_WL_isTransferring_%1", getPlayerUID _warlord], false];

//CP database
private _uid = getPlayerUID _warlord;
private _fundsDB = (serverNamespace getVariable "fundsDatabase");
private _pFunds = (serverNamespace getVariable "fundsDatabase") getOrDefault [_uid, 1000];
_fundsDB set [_uid, _pFunds];
[(serverNamespace getVariable "fundsDatabase"), _uid] spawn BIS_fnc_WL2_fundsDatabaseUpdate;

_boundToAnotherTeam = false;
if (isPlayer _warlord) then {
	_boundToAnotherTeam = _uid in (missionNamespace getVariable format ["BIS_WL_boundTo%1", ([west, east] select {_x != side group _warlord}) # 0]);
	if !(_boundToAnotherTeam) then {
		//Balance
		_checkedIn = _uid in (missionNamespace getVariable format ["BIS_WL_boundTo%1", west]) || {_uid in (missionNamespace getVariable format ["BIS_WL_boundTo%1", east])};
		_imbalanced = false;
		_west = count (allPlayers select {side group _x == west && {_x != _warlord}});
		_east = count (allPlayers select {side group _x == east && {_x != _warlord}});
		if (!(_checkedIn) && {(serverTime > 300) && {abs (_west - _east) > 3}}) then {
			_balanceCheck = ([[_west, _east], [], {_x}, "ASCEND"] call BIS_fnc_sortBy) # 0; //Low -> High
			_imbalanced = (side group _warlord) != _balanceCheck;
		};

		if (_imbalanced) then {
			_imabalanceID = format ["BIS_WL_imbalance_%1", _uid];
			missionNamespace setVariable [_imabalanceID, true, [2, (owner _warlord)]];
			_playerVarID = format ["BIS_WL_forceOtherTeam_%1", _uid];
			missionNamespace setVariable [_playerVarID, false, [2, (owner _warlord)]];

			(missionNamespace getVariable format ["BIS_WL_boundTo%1", ([west, east] select {_x != side group _warlord}) # 0]) pushBackUnique _uid;
		} else {
			_playerVarID = format ["BIS_WL_forceOtherTeam_%1", _uid];
			missionNamespace setVariable [_playerVarID, false, [2, (owner _warlord)]];
			_imabalanceID = format ["BIS_WL_imbalance_%1", _uid];
			missionNamespace setVariable [_imabalanceID, false, [2, (owner _warlord)]];

			(missionNamespace getVariable format ["BIS_WL_boundTo%1", side group _warlord]) pushBackUnique _uid;
			_playerSideArr = BIS_WL_playerIDArr # (BIS_WL_competingSides find side group _warlord);
			_playerSideArr pushBackUnique _uid;

			_warlord spawn BIS_fnc_WL2_respawnHandle;
			sleep 1;
			_friendlyFireVarName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", _uid];
			if ((missionNamespace getVariable _friendlyFireVarName) > serverTime) then {
				[(missionNamespace getVariable _friendlyFireVarName)] remoteExec ["BIS_fnc_WL2_friendlyFireHandleClient", (owner _warlord)];
			};
		};
	} else {
		_playerVarID = format ["BIS_WL_forceOtherTeam_%1", _uid];
		missionNamespace setVariable [_playerVarID, true, [2, (owner _warlord)]];

		_warlord setVariable ["BIS_WL_ignore", true, true];
		BIS_WL_allWarlords = BIS_WL_allWarlords - [_warlord];
	};

	0 spawn BIS_fnc_WL2_calcImbalance;
};