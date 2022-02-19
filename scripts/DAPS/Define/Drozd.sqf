private["_v"];
_v=_this;
[typeOf _v,"Drozd"]execVM"scripts\DAPS\Scripts\Management\RegisterNewType.sqf";
if(isServer)then{deleteVehicle _v};