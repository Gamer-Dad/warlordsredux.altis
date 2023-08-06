params ["_control", "_lbCurSel", "_lbSelection"];

if (vehicle player != player) exitWith {};
_emote = lbData [5004, _lbCurSel];

player switchMove "AmovPercMstpSrasWrflDnon";
player playMoveNow _emote;

closeDialog 1;