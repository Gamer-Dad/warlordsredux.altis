private _m=_this select 0;
private _targets=[];
private _target=objNull;
private _tPos=[];
private _frag=FALSE;
private _type=typeOf _m;
private _range=(getNumber(configfile>>"CfgAmmo">>_type>>"indirectHitRange")*3.0);
// 1.5 is more damaging
// 2 is more accurate
systemChat format["SAM prox fuse is %1 meters",round _range];
sleep 1;
private _forceHit=TRUE;
if((random 100)>0)then{_forceHit=FALSE}; // Change 0 to percent chance if forced frag hit
while{TRUE}do{
	if!(alive _m)exitWith{};
	_targets=nearestObjects[_m,["AIR"],_range]; // nearEntities for better perf 
	if((count _targets)>0)exitWith{_frag=TRUE;_target=(_targets select 0)};
	sleep .01;
};
if!(_frag)exitWith{};
if((count _targets)<1)exitWith{};
_target=(_targets select 0);
//systemChat str(typeOf _target);
_tPos=getPos _target;
private _pos=getPos _m; // frag at missile position
private _dir=getDir _m;
triggerAmmo _m;
//deleteVehicle _m;
private _d=_pos distance _tPos;
systemChat format["SAM detonated %1 meters from target",round _d];

// Secondary at target location
_type="ammo_Missile_rim116";
//_type="GrenadeHand"; // very light damage even when detonated at 0m
//_type="M_SPG9_HE";
//_type="R_80mm_HE";
//_type="R_60mm_HE"; // Will kill a jet reliablych
private _m2=createVehicle[_type,_tPos,[],45,"FLY"]; // The number is the max possible radius from target. This at 5 is very deadly
triggerAmmo _m2;

/*
private _z=_pos select 2;
_pos=_pos getPos[(_range*1),_dir];
_pos=[_pos select 0,_pos select 1,_z];
private _m2=createVehicle[_type,_pos,[],0,"FLY"];
triggerAmmo _m2;
*/

sleep 1;
if(isNull _target)exitWith{systemChat"Target destroyed"};
if!(alive _target)exitWith{systemChat"Target destroyed"};
//systemChat format["Target damage: %1",getDammage _target]; //Testing Purposes Only