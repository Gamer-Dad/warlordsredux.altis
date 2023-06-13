#include "..\warlords_constants.inc"

params ["_warlord"];

private _startingPos = position _warlord;
private _markers = (side group _warlord) call BIS_fnc_WL2_getRespawnMarkers;
private _varFormat = "";


_warlord setVariable ["BIS_WL_detectedByServerSince", serverTime];
_warlord setVariable ["BIS_WL_friendlyKillTimestamps", []];
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

		private _countFaction0 = playersNumber west;
		_fac0Percentage = 0.1;
		if ((count allPlayers) > 0) then {
			_fac0Percentage = (1.6 * _countFaction0 / count allPlayers) + 0.2;
		};
		_multiBlu = 2 - _fac0Percentage;
		missionNamespace setVariable ["blanceMultilplierBlu", _multiBlu, true];
		_multiOpf = _fac0Percentage;
		missionNamespace setVariable ["blanceMultilplierOpf", _multiOpf, true];
		{
			_incomeStandard = _x call BIS_fnc_WL2_income;
			_actualIncome = round (_incomeStandard * (if (_x == west) then [{(missionNamespace getVariable "blanceMultilplierBlu")}, {(missionNamespace getVariable "blanceMultilplierOpf")}]));
			if (_x == west) then [{missionNamespace setVariable ["actualIncomeBlu", _actualIncome, true]}, {missionNamespace setVariable ["actualIncomeOpf", _actualIncome, true]}]
		} forEach BIS_WL_competingSides;
		
		_varFormat = format ["BIS_WL_%1_repositionDone", getPlayerUID _warlord];
		waitUntil {!(missionNamespace getVariable [_varFormat, TRUE])};
	} else {
		_warlord setVariable ["BIS_WL_ignore", TRUE, TRUE];   //think this code block is server side blocking team switching
		_warlord enableSimulationGlobal FALSE;
		_warlord hideObjectGlobal TRUE;
		BIS_WL_allWarlords = BIS_WL_allWarlords - [_warlord];
	};    
};

if !(_boundToAnotherTeam) then {
	_respawnPos = markerPos selectRandom _markers;

	while {if (isPlayer _warlord) then {!(missionNamespace getVariable [_varFormat, FALSE])} else {_warlord distance2D _respawnPos > 100}} do {
		[_warlord, [_respawnPos, [], 2, "NONE"]] remoteExec ["setVehiclePosition", _warlord];
		uiSleep WL_TIMEOUT_STANDARD;
	};
	
	if (_varFormat != "") then {
		missionNamespace setVariable [_varFormat, FALSE];
	};
	
	_friendlyFireVarName = format ["BIS_WL_%1_friendlyKillPenaltyEnd", getPlayerUID _warlord];
	if ((missionNamespace getVariable _friendlyFireVarName) > serverTime) then {
		(owner _warlord) publicVariableClient _friendlyFireVarName;
	};

	[_warlord] call BIS_fnc_WL2_respawnHandle;
};