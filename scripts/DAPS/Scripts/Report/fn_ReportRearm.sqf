private _v=_this;
if!((vehicle player)==_v)exitWith{};
systemChat format["%1 rearmed",_v getVariable"dapsType"];
[_v,"",0,FALSE]spawn DAPS_fnc_Report;