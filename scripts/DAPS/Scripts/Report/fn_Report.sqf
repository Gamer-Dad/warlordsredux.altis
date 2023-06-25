private _v=_this select 0;
private _s=_this select 1; // Obsolete
private _d=_this select 2;
private _indicator=_this select 3;

if!((vehicle player)==_v)exitWith{};

if!((typeOf _v)in dapsAPStypes)exitWith{};
private _type=_v getVariable"dapsType";
if!(_indicator)then{
	hintSilent (format["%1 is ON",_type]);
};
sleep .5;
private _text="";
_text = format["%1 charges:<br/><br/>%2/%3", (_v getVariable"dapsType"), (_v getVariable"dapsAmmo"), (_v getVariable"dapsAmmoMax")];
if((typeOf _v)in dapsDazzler)then{_text="Dazzler active"};
if!(_indicator)exitWith{
	hintSilent(parseText format["%1",_text]);
	sleep 3;
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