private _m=_this select 0;
private _targets=[];
private _target=objNull;
private _tPos=[];
private _frag=FALSE;
private _range=(getNumber(configfile>>"CfgAmmo">>(typeOf _m)>>"indirectHitRange")*2.7);
// 1.5 is more damaging
// 2 is more accurate
systemChat format["SAM prox fuse is %1 meters",round _range];
sleep 1;
while{TRUE}do{
	if!(alive _m)exitWith{};
	_targets=nearestObjects[_m,["AIR"],_range];
	if((count _targets)>0)exitWith{_frag=TRUE;_target=(_targets select 0)};
	sleep .01;
};
if!(_frag)exitWith{};
if((count _targets)<1)exitWith{};
_target=(_targets select 0);
//systemChat str(typeOf _target);
_tPos=getPos _target;
private _pos=getPos _m; // frag at missile position
triggerAmmo _m;
private _d=_pos distance _tPos;
systemChat format["SAM detonated %1 meters from target",round _d];
sleep 1;
if(isNull _target)exitWith{systemChat"Target destroyed"};
if!(alive _target)exitWith{systemChat"Target destroyed"};
systemChat format["Target damage: %1",getDammage _target];