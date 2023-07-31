private _v=_this select 0;
private _d=_this select 1;
private _indicator=_this select 2;

if!((vehicle player)==_v)exitWith{};
if!((typeOf _v)in dapsAPSAll)exitWith{};

private _type = switch (_v getVariable "dapsType") do {
	case 2: { "Heavy APS" };
	case 1: { "Medium APS" };
	case 0: { "Light APS" };
	default { "Dazzler" };
};

_text = "";
if (!_indicator) then {
	_text = format["%1 is now %2<br/>", _type, (if (_v call DAPS_fnc_active) then {"ON"} else {"OFF"})];
};
if !((typeOf _v) in dapsDazzler) then {
	_text = _text + format["Charges: %1/%2", (_v getVariable"dapsAmmo"), (_v getVariable "dapsAmmoMax")];
};

if (!_indicator) exitWith {
	hintSilent(parseText format["%1",_text]);
	sleep 5;
	hintSilent "";
};

if(_d<1)then{_d=1};
_d=ceil(_d/22.5);
_colour="#999999";
_pic=format["scripts\DAPS\Pics\dir%1.paa",_d];
playSound"Alarm";
hintSilent(parseText format["<img size='7' color='%1' img image='%2'/><br/><br/>%3",_colour,_pic,_text]);
sleep 3;
hintSilent "";