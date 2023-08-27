/*
	Author: MrThomasM

	Description: Updates the role apply button.
*/

params ["_control", "_lbCurSel", "_lbSelection"];

if ((_lbCurSel == -1) || {(lbCurSel 4005) == -1}) exitWith {};

_data = lbData [4005, (lbCurSel 4005)];
_unit = _data call BIS_fnc_getUnitByUID;