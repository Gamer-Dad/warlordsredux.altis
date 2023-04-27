// Compare the directions of a projectile and a vehicle/turret facing and return relative direction based on turret facing
private _id=_this select 0;
private _v=_this select 1;
_id=_id-180;if(_id<0)then{_id=_id+360};
private _wd=_v call DAPS_fnc_GetDirection;
_id=_id-_wd;
if(_id<0)then{_id=_id+360};
_id