private["_v"];
_v=_this;
[typeOf _v,"TrophyHVe"]execVM"DAPS\Scripts\Management\RegisterNewType.sqf";
if(isServer)then{deleteVehicle _v};