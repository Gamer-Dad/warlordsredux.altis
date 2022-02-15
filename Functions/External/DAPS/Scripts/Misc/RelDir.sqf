// Compare the directions of a projectile and a vehicle/turret facing and return relative direction based on turret facing
private["_i","_v","_id","_wd"];
_i=_this select 0;
_v=_this select 1;
_id=getDir _i;
_id=_id-180;if(_id<0)then{_id=_id+360};
_wd=_v call DAPS_fnc_GetDirection;
_id=_id-_wd;
if(_id<0)then{_id=_id+360};
_id