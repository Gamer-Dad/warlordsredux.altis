private["_pv"];
_pv=FALSE;
{if!(_x in dapsRegistered)then{dapsRegistered pushBack _x;_x remoteExec["DAPS_fnc_RegisterVehicle"];_pv=true}}forEach vehicles;
if(_pv)then{publicVariable"dapsRegistered"};