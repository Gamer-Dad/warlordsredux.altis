private["_v"];
_v=_this;
[typeOf _v,"TrophyHV"]execVM"DAPS\Scripts\Management\RegisterNewType.sqf";
if(isServer)then{deleteVehicle _v};