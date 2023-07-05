params [["_veh", objNull, [objNull]]]; 

if (isNull _veh) exitWith{false}; 
vectorUp _veh vectorCos surfaceNormal getPos _veh < 0.45;