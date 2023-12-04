params ["_warlord"];

_warlord setVariable ["BIS_WL_detectedByServer", true];
_owner = owner _warlord;

private _uid = getPlayerUID _warlord;
private _pFunds = (serverNamespace getVariable "fundsDatabase") getOrDefault [_uid, -1];
if (_pFunds == -1) then {
	1000 call BIS_fnc_WL2_fundsDatabaseWrite;
} else {
	0 call BIS_fnc_WL2_fundsDatabaseWrite;
};

_varSwitch = format ["teamBlocked_%1", _uid];
_varImb = format ["balanceBlocked_%1", _uid];
_sideW = side group _warlord;
["Server L17"] remoteExec ["diag_log", _owner];
_pList = serverNamespace getVariable "playerList";
[format ["Server L19: %1", _pList]] remoteExec ["diag_log", _owner];
_boundToTeam = (_pList getOrDefault [_uid, [false]]) # 0;
[format ["Server L21: %1", _boundToTeam]] remoteExec ["diag_log", _owner];
if (_boundToTeam) then {
	_correctSide = ((_pList get _uid) # 1) == _sideW;
	[format ["Server L24: %1", _correctSide]] remoteExec ["diag_log", _owner];
	missionNamespace setVariable [_varSwitch, _correctSide, _owner];

	if (_correctSide) then {
		_friendlyFireVarName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", _uid];
		if ((serverNamespace getVariable _friendlyFireVarName) > serverTime) then {
			[(serverNamespace getVariable _friendlyFireVarName)] remoteExec ["BIS_fnc_WL2_friendlyFireHandleClient", _owner];
		};
	};
} else {
	missionNamespace setVariable [_varSwitch, false, _owner];

	_friendlyCnt = playersNumber _sideW;
	_enemyside = ([west, east] select {_x != _sideW}) # 0;
	_enemyCnt = playersNumber _enemyside;
	_imb = ((_friendlyCnt - _enemyCnt) > 3);
	[format ["Server L40: %1|%2|%3|%4", _friendlyCnt, _enemyside, _enemyCnt, _imb]] remoteExec ["diag_log", _owner];
	if (_imb) then {
		_pList set [_uid, [true, _enemyside]];
		serverNamespace setVariable ["playerList", _pList];
		missionNamespace setVariable [_varImb, _imb, _owner];
	} else {
		_pList set [_uid, [true, _sideW]];
		serverNamespace setVariable ["playerList", _pList];
		missionNamespace setVariable [_varImb, _imb, _owner];
	};
};

call BIS_fnc_WL2_calcImbalance;