private["_v"];
_v=_this;
[typeOf _v,"AfganitE"]execVM"Functions\External\DAPS\Scripts\Management\RegisterNewType.sqf";
if(isServer)then{deleteVehicle _v};