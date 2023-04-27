private["_v","_d","_colour","_pic"];
private _v=_this select 0;
private _d=_this select 1;
if(_d<1)then{_d=1};
_d=ceil(_d/45);
private _colour="#999999";
private _pic=format["scripts\DAPS\Pics\d%1.paa",_d];
hintSilent(parseText format["<img size='7' color='%1' img image='%2'/>%3",_colour,_pic," "]);
playSound"Alarm";