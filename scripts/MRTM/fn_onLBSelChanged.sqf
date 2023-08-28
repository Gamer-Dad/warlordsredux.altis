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
		if (count (units player) == 1 && {count (units _unit) == 1}) then {
			ctrlEnable [4101, true];
		} else {
			ctrlEnable [4101, false];
		};
	} else {
		ctrlEnable [4101, false];
	};
	if ((getPlayerUID _unit) in (missionNamespace getVariable [(format ["MRTM_invitesIn_%1", getPlayerUID player]), []])) then {
		if (count (units player) == 1 && {count (units _unit) == 1}) then {
			ctrlEnable [4105, true];
			ctrlEnable [4102, true];
		} else {
			ctrlEnable [4105, false];
			ctrlEnable [4102, true];
		};
	} else {
		ctrlEnable [4105, false];
		ctrlEnable [4102, false];
	};
} else {
	if ((lbCurSel 4005) < 0) exitWith {};
	_data = lbData [4005, (lbCurSel 4005)];
	_unit = _data call BIS_fnc_getUnitByUID;
	if (_unit == player && {(count ((units player) select {isPlayer _x})) > 1}) then {
		ctrlEnable [4103, true];
		ctrlEnable [4104, false];
	} else {
		ctrlEnable [4103, false];
		if (_unit != player && {isPlayer _unit && {leader player == player}}) then {
			ctrlEnable [4104, true];
		} else {
			ctrlEnable [4104, false];
		};
	};
};

0 spawn MRTM_fnc_openGroupMenu;