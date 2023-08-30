/*
	Author: MrThomasM

	Description: Updates the group buttons/data.
*/
params ["_lb"];

if (_lb == "Players") then {
	if ((lbCurSel 4006) < 0) exitWith {};

	_data = lbData [4006, (lbCurSel 4006)];
	_unit = _data call BIS_fnc_getUnitByUID;
	if (!((getPlayerUID _unit) in (missionNamespace getVariable [(format ["MRTM_invitesOut_%1", getPlayerUID player]), []])) && {(leader player == player)}) then {
		ctrlEnable [4101, true];
	} else {
		ctrlEnable [4101, false];
	};
	if ((getPlayerUID _unit) in (missionNamespace getVariable [(format ["MRTM_invitesIn_%1", getPlayerUID player]), []])) then {
		ctrlShow [4105, true];
		ctrlShow [4105, true];
	} else {
		ctrlShow [4105, false];
		ctrlShow [4105, false];
	};
} else {
	if ((lbCurSel 4005) < 0) exitWith {};
	_data = lbData [4005, (lbCurSel 4005)];
	_unit = _data call BIS_fnc_getUnitByUID;
	if (_unit == player && {(count ((units player) select {isPlayer _x})) > 1}) then {
		ctrlShow [4104, false];
		ctrlShow [4106, false];
		ctrlShow [4103, true];
	} else {
		ctrlShow [4103, false];
		if (_unit != player && {isPlayer _unit && {leader player == player}}) then {
			ctrlShow [4104, true];
			ctrlShow [4106, true];
		} else {
			ctrlShow [4104, false];
			ctrlShow [4106, false];
		};
	};
};

0 spawn MRTM_fnc_openGroupMenu;