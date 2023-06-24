//-- KiloSwiss 19:07 05/05/2018
params [ ["_vehicle", objNull, [objNull]] ];

if ( isNull _vehicle ) exitWith { false };

if !(isServer) exitWith {
	[_vehicle] remoteExec ["KS_fnc_unflipVehicle", 2];
};

private ["_vectorDiff","_upsideDown","_vehicleBank","_turnLeft","_forceParams","_force","_addForcePointX","_addForcePointZ"];

_vectorDiff = vectorUp _vehicle vectorDotProduct surfaceNormal getPos _vehicle;
_upsideDown = _vectorDiff < -0.75; //_upsideDown = abs _vehicleBank > 135;
_vehicleBank = _vehicle call BIS_fnc_getPitchBank select 1;
_turnLeft = [false, true] select ( _vehicleBank >= 0 );

//-- Reverse bool on _turnLeft if vehicle is upside down.
if ( _upsideDown ) then
{
	_turnLeft = [true, false] select _turnLeft;
};

//-- Get the correct multiplicator to calculate the right amount of force for different vehicles.
_forceParams = [ [1.5, 5], [2.5, 6] ] select ( _vehicle isKindOf "MRAP_03_base_F" );	//-- Strider
_forceParams = [ _forceParams, [1.2, 8] ] select ( _vehicle isKindOf "B_APC_Tracked_01_base_F" || { _vehicle isKindOf "MBT_01_base_F" } );	//-- Panther OR Slammer

_force = getMass _vehicle * (_forceParams select _upsideDown);

_addForcePointX = boundingBoxReal _vehicle select ([0, 1] select _turnLeft) select 0;
_addForcePointZ = boundingBoxReal _vehicle select ([1, 0] select _upsideDown) select 2;

_vehicle addForce [_vehicle vectorModelToWorld [[_force, - _force]select _turnLeft, 0, 0], [_addForcePointX, 0, _addForcePointZ]];

true