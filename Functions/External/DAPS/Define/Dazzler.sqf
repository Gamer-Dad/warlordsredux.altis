private["_v"];
_v=_this;
[typeOf _v,"Dazzler"]execVM"DAPS\Scripts\Management\RegisterNewType.sqf";
if(isServer)then{deleteVehicle _v};