params ["_control", "_lbCurSel", "_lbSelection"];

if (vehicle player != player) exitWith {};
_emote = lbData [5004, _lbCurSel];

player switchMove "AmovPercMstpSrasWrflDnon";
player playMoveNow _emote;

private _d = [4000, 5000, 6000, 7000, 8000];
{
	if !(isNull (findDisplay _x)) then {
		(findDisplay _x) closeDisplay 1;
	};
} forEach _d;