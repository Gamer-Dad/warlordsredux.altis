params ["_warlord"];

_warlord setVariable ["BIS_WL_detectedByServer", true];
_owner = owner _warlord;

private _iterations = 0;
private _uid = "";
while { _uid == "" } do {
	private _playerUid = getPlayerUID _warlord;
	if (!isNil "_playerUid" && {_playerUid != ""}) then {
		_uid = _playerUid;
	} else {
		diag_log "Cannot find player UID, retrying...";
	};

	private _playerId = getPlayerID _warlord;
	private _playerUidFromId = _playerId getUserInfo 2;
	if (!isNil "_playerUidFromId" && {_playerUidFromId != ""}) then {
		_uid = _playerUidFromId;
	} else {
		diag_log "Cannot find player UID from ID, retrying...";
	};
	sleep 0.5;

	if (_iterations > 60) then {
		diag_log "Cannot find player UID for over 30 seconds.";
		break;
	} else {
		_iterations = _iterations + 1;
	};

	if (isNull _warlord) then {
		diag_log "Cannot find player UID, warlord is null, aborting.";
		break;
	};
};

if (_uid == "") exitWith {
	diag_log "Cannot find player UID, aborting.";
};

private _pFunds = (serverNamespace getVariable "fundsDatabase") getOrDefault [_uid, -1];
if (_pFunds == -1) then {
	1000 call WL2_fnc_fundsDatabaseWrite;
} else {
	0 call WL2_fnc_fundsDatabaseWrite;
};

_varSwitch = format ["teamBlocked_%1", _uid];
_varImb = format ["balanceBlocked_%1", _uid];
_sideW = side group _warlord;

_pList = serverNamespace getVariable "playerList";
_boundToTeam = (_pList getOrDefault [_uid, [false]]) # 0;
if (_boundToTeam) then {
	_correctSide = ((_pList get _uid) # 1) == _sideW;
	missionNamespace setVariable [_varSwitch, !_correctSide, _owner];
	missionNamespace setVariable [_varImb, false, _owner];

	if (_correctSide) then {
		_warlord setVariable ["BIS_WL_ownerAsset", _uid, true];
		_warlord setVariable ["WL2_accessControl", 0, true];
		_friendlyFireVarName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", _uid];
		if ((serverNamespace getVariable _friendlyFireVarName) > serverTime) then {
			[(serverNamespace getVariable _friendlyFireVarName)] remoteExec ["WL2_fnc_friendlyFireHandleClient", _owner];
		};
	};
} else {
	missionNamespace setVariable [_varSwitch, _boundToTeam, _owner];

	if (((missionNamespace getVariable "gameStart") + 300) < serverTime) then {
		_friendlyCnt = playersNumber _sideW;
		_enemyside = ([west, east] select {_x != _sideW}) # 0;
		_enemyCnt = playersNumber _enemyside;
		_imb = ((_friendlyCnt - _enemyCnt) > 3);
		missionNamespace setVariable [_varImb, _imb, _owner];
		if (!_imb) then {
			_warlord setVariable ["BIS_WL_ownerAsset", _uid, true];
			_warlord setVariable ["WL2_accessControl", 0, true];
			_pList set [_uid, [true, _sideW]];
			serverNamespace setVariable ["playerList", _pList];
		};
	} else {
		_warlord setVariable ["BIS_WL_ownerAsset", _uid, true];
		_warlord setVariable ["WL2_accessControl", 0, true];
		_pList set [_uid, [true, _sideW]];
		serverNamespace setVariable ["playerList", _pList];
		missionNamespace setVariable [_varImb, false, _owner];
	};
};

call WL2_fnc_calcImbalance;