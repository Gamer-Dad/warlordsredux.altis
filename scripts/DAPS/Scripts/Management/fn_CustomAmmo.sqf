// Customizes the ammo on a single vehicle
private["_v","_type","_max"];
_v=_this select 0;
_max=_this select 1;
//if!(local _v)exitWith{};
_type=typeOf _v;
if!(_type in dapsAPStypes)exitWith{};
if(_type in dapsDouble)exitWith{
	_v setVariable["dapsAmmoL",_max,true];
	_v setVariable["dapsAmmoR",_max,true];
	_v setVariable["dapsAmmoMaxL",_max,true];
	_v setVariable["dapsAmmoMaxR",_max,true];
};
_v setVariable["dapsAmmo",_max,true];
_v setVariable["dapsAmmoMax",_max,true];