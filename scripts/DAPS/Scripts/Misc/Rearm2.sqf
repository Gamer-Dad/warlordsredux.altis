private["_v","_supply","_found","_ammo","_max"];
_v=_this;
_supply=[];
_found=FALSE;
_ammo=0;
_max=0;
if((typeOf _v)in dapsDouble)then{
	_ammo=(_v getVariable"dapsAmmoL")+(_v getVariable"dapsAmmoR");
	_max=(_v getVariable"dapsAmmoMaxL")+(_v getVariable"dapsAmmoMaxR");
}else{
	_ammo=_v getVariable"dapsAmmo";
	_max=_v getVariable"dapsAmmoMax";
};
if!(_ammo<_max)exitWith{};
_supply=nearestObjects[_v,["LandVehicle","ReammoBox_F"],dapsRearmRange];
{
	if((getNumber(configFile>>"cfgVehicles">>(typeOf _x)>>"transportAmmo"))>0)exitWith{_found=TRUE};
	if((getNumber(configFile>>"cfgVehicles">>(typeOf _x)>>"ace_rearm_defaultSupply"))>0)exitWith{_found=TRUE};
	if(_x getVariable"ace_rearm_isSupplyVehicle")exitWith{_found=TRUE};
}forEach _supply;
if!(_found)exitWith{};
_v call DAPS_fnc_RearmAPS;