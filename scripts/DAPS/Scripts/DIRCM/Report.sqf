private _v=_this select 0;
private _d=_this select 1;
private _indicator=_this select 2;
/*
if(dapsDebug)then{
	//"DAPS REPORT"remoteExec["systemChat"];
	systemChat"DAPS REPORT";
	execVM"scripts\DAPS\Scripts\Report\DetailedReport.sqf";
	//sleep 2;
};
*/
if!((vehicle player)==_v)exitWith{};
if!((typeOf _v)in dapsAPStypes)exitWith{};
//if((typeOf _v)in dapsDazzler)then{_text="Dazzler active"};
private _text="INCOMING MISSILE";
if(_d<1)then{_d=1};
_d=ceil(_d/22.5);
_colour="#999999";
_pic=format["scripts\DAPS\Pics\dir%1.paa",_d];
hintSilent(parseText format["<img size='7' color='%1' img image='%2'/><br/><br/>%3",_colour,_pic,_text]);
playSound"Alarm";