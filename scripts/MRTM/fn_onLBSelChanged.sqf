/*
	Author: MrThomasM

	Description: Updates the group buttons/data.
*/

_data = lbData [4006, (lbCurSel 4006)];
_unit = _data call BIS_fnc_getUnitByUID;
ctrlEnable [4101, (!((getPlayerUID _unit) in (missionNamespace getVariable [(format ["MRTM_invitesOut_%1", getPlayerUID player]), []])) && {(leader player == player)})];
ctrlShow [4105, ((getPlayerUID _unit) in (missionNamespace getVariable [(format ["MRTM_invitesIn_%1", getPlayerUID player]), []]))];
ctrlShow [4102, ((getPlayerUID _unit) in (missionNamespace getVariable [(format ["MRTM_invitesIn_%1", getPlayerUID player]), []]))];

_data = lbData [4005, (lbCurSel 4005)];
_unit = _data call BIS_fnc_getUnitByUID;
if (_unit == player && {(count ((units player) select {isPlayer _x})) > 1}) then {
	ctrlShow [4104, false];
	ctrlShow [4106, false];
	ctrlShow [4103, true];
} else {
	ctrlShow [4103, false];
	ctrlShow [4104, (_unit != player && {isPlayer _unit && {leader player == player}})];
	ctrlShow [4106, (_unit != player && {isPlayer _unit && {leader player == player}})];
};