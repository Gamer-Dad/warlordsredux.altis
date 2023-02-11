private["_v","_s","_d","_indicator","_text"];
_v=_this select 0;
_s=_this select 1;
_d=_this select 2;
_indicator=_this select 3;
if(dapsDebug)then{
	//"DAPS REPORT"remoteExec["systemChat"];
	systemChat"DAPS REPORT";
	execVM"scripts\DAPS\Scripts\Report\DetailedReport.sqf";
	sleep 2;
};
if!((vehicle player)==_v)exitWith{};
if!((typeOf _v)in dapsAPStypes)exitWith{};
sleep .3;
_text="";
if((typeOf _v)in dapsDouble)then{
	_text=format["%1 charges:<br/><br/>L: %2/%3         R: %4/%5",(_v getVariable"dapsType"),(_v getVariable"dapsAmmoL"),(_v getVariable"dapsAmmoMaxL"),(_v getVariable"dapsAmmoR"),(_v getVariable"dapsAmmoMaxR")];
}else{
	_text=format["%1 charges:<br/><br/>%2/%3",(_v getVariable"dapsType"),(_v getVariable"dapsAmmo"),(_v getVariable"dapsAmmoMax")];
};
if!(_indicator)exitWith{hint(parseText format["%1",_text])};
if((typeOf _v)in dapsDazzler)then{_text="Dazzler active"};
if(_d<1)then{_d=1};
_d=ceil(_d/22.5);
//if(_d<1)then{_d=1};
_colour="#999999";
_pic=format["scripts\DAPS\Pics\dir%1.paa",_d];
hint(parseText format["<img size='7' color='%1' img image='%2'/><br/><br/>%3",_colour,_pic,_text]);
playSound"Alarm";