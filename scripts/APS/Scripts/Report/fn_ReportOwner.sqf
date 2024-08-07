private _v=_this select 0;
private _d=_this select 1;
private _indicator=_this select 2;

if !((vehicle player) == _v) exitWith {};
if !((typeOf _v) in apsAPSAll) exitWith {};

private _type = switch (_v getVariable "apsType") do {
	case 2: { "Heavy APS" };
	case 1: { "Medium APS" };
	case 0: { "Light APS" };
	default { "Dazzler" };
};

_text = "";
if (!_indicator) then {
	_text = format["%1 is now %2<br/>", _type, (if (_v call APS_fnc_active) then {"active"} else {"inactive"})];
};
if !((typeOf _v) in ["O_T_Truck_03_device_ghex_F", "O_Truck_03_device_F"]) then {
	_text = _text + format["Charges: %1/%2", (_v getVariable"apsAmmo"), (_v call APS_fnc_getMaxAmmo)];
};

if (!_indicator) exitWith {
	hintSilent(parseText format["%1",_text]);
	sleep 5;
	hintSilent "";
};

if(_d<1)then{_d=1};
_d=ceil(_d/22.5);
_colour="#999999";
_pic=format["scripts\APS\Pics\dir%1.paa",_d];
playSound"Alarm";
hintSilent(parseText format["<img size='7' color='%1' img image='%2'/><br/><br/>%3",_colour,_pic,_text]);
sleep 3;
hintSilent "";