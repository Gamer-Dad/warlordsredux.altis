// Checks if a vehicle is a SAM by checking if it is not an air vehicle and can fire missiles at aircraft
private["_v","_ammo","_isSAM","_mags","_parents"];
_v=_this;
_isSAM=false;
_ammo="";
_mags=magazinesAllTurrets _v;
_parents=[];
if(_v isKindOf"LandVehicle")then{
	{
	_ammo=getText(configfile>>"CfgMagazines">>(_x select 0)>>"ammo");
	_parents=[configfile>>"CfgAmmo">>_ammo,true]call BIS_fnc_returnParents;
	if(("MissileBase"in _parents)OR("MissileCore"in _parents))then{
		if((getNumber(configfile>>"CfgAmmo">>_ammo>>"airLock"))==2)exitWith{_isSAM=true};
	};
	}forEach _mags;
};
_isSAM