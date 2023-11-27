/*
	Author: MrThomasM

	Description: Updates the group buttons/data.
*/

_data = lbData [4006, (lbCurSel 4006)];
_unit = _data call BIS_fnc_getUnitByUID;
ctrlEnable [4101, (!((getPlayerUID _unit) in (missionNamespace getVariable [(format ["MRTM_invitesOut_%1", getPlayerUID player]), []])) && {(leader player == player) && {(count ((units _unit) select {isPlayer _x}) == 1)}})];
_cond = ((getPlayerUID _unit) in (missionNamespace getVariable [(format ["MRTM_invitesIn_%1", getPlayerUID player]), []]));
ctrlShow [4105, _cond];
ctrlShow [4102, _cond];

_data = lbData [4005, (lbCurSel 4005)];
_unit = _data call BIS_fnc_getUnitByUID;
_cond = (_data == (getPlayerUID player) && {(count ((units player) select {isPlayer _x})) > 1});
if (_cond) then {
	ctrlShow [4104, !_cond];
	ctrlShow [4106, !_cond];
	ctrlShow [4103, _cond];
} else {
	ctrlShow [4103, false];
	ctrlShow [4104, (_unit != player && {isPlayer _unit && {leader player == player}})];
	ctrlShow [4106, (_unit != player && {isPlayer _unit && {leader player == player}})];
};