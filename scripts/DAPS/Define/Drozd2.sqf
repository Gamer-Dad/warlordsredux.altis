private["_v"];
_v=_this;
[typeOf _v,"Drozd2"]execVM"scripts\DAPS\Scripts\Management\RegisterNewType.sqf";
if(isServer)then{deleteVehicle _v};