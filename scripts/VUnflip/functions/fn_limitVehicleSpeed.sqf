/*	KiloSwiss 23:45 08/05/2018
	Based on a forum post by das attorney - https://forums.bohemia.net/forums/topic/208700-slow-down-a-vehicle-permanently/?tab=comments#comment-3218789
	
	Limit speed of vehicle if in specified zone.
	
	Preparation:
	In the editor, place markers with the format "limitSpeedMarker_#", beginning with "limitSpeedMarker_0" on the map, covering all areas you want the speed limit to apply.
	Call the script local on each players machine on spawn/respawn, with the speed limit and <true> for metric or <false> for imperial speed.
	
	Parameters:
	0 = <NUMBER> Speed limit
	1 = <BOOL> Metric / kilometers per hour (true) or Imperial / miles per hour (false)
	
	Example:
	[ 30, true] call KS_fnc_limitVehicleSpeed;	//-- Speed limit of 30km/h
	[ 20, false] call KS_fnc_limitVehicleSpeed;	//-- Speed limit of 20mph
	
*/

params [ ["_limitSpeedMaxSpeed", 30, [123]], [ "_metric", true, [true]] ];

//-- Adjust max speed from km/h (Metric) to miles per hour (Imperial):
if ( !_metric ) then { _limitSpeedMaxSpeed = _limitSpeedMaxSpeed * 1.609344 };

//-- Functions to add and remove the necessary eventHandler.
KS_fnc_addVehicleSpeedLimitEH = 
{
	params [ "_stackedEHadded", "_vehicle", "_limitSpeedMaxSpeed" ];
	
	if ( _stackedEHadded ) exitWith { true }; //-- EH is already added.
	
	private _stackedEHID = ["KSEH_limitVehicleSpeed", "onEachFrame", {
		params [ "_vehicle", "_limitSpeedMaxSpeed"];
		if ( speed _vehicle > _limitSpeedMaxSpeed && { isTouchingGround _vehicle } ) then
		{
			private _velocityVeh = velocity _vehicle;
			private _vehicleMass = getMass _vehicle;
			_velocityVeh = _velocityVeh apply {_x * -1};
			_velocityVeh = _velocityVeh vectorMultiply (_vehicleMass / 37) max 10; //-- Minimum 10 for ultra light vehicles like Karts and ATVs.
			_velocityVeh set [2, -(_vehicleMass / 5)];
			_vehicle addForce [ _velocityVeh, [0, 0, (boundingBoxReal _vehicle select 0 select 2) / 2 ] ];
		};
	}, [_vehicle, _limitSpeedMaxSpeed]] call BIS_fnc_addStackedEventHandler;
	private _stackedEHadded = [ true, false] select (_stackedEHID isEqualTo "");
	
	_stackedEHadded
};

KS_fnc_removeVehicleSpeedLimitEH = 
{
	params [ "_stackedEHadded" ];
	
	if !( _stackedEHadded ) exitWith { _stackedEHadded }; //-- EH is already removed.
	
	private _stackedEHremoved = ["KSEH_limitVehicleSpeed", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	private _stackedEHadded = [ true, false] select _stackedEHremoved;
	
	_stackedEHadded
};

private _limitSpeedMarkers = [];
private _limitSpeedMarkersCheckIteration = 0;
private _limitSpeedMarkersCheckIterationFailed = 0;
//-- Check for existing markers with the format "limitSpeedMarker_#", beginning with "limitSpeedMarker_0".
while { _limitSpeedMarkersCheckIteration - _limitSpeedMarkersCheckIterationFailed <= 4 } do //-- Allow for a margin of error (missing markers) of up to 3.
{
	private _checkMarker = format["limitSpeedMarker_%1", _limitSpeedMarkersCheckIteration];
	if !( getMarkerPos _checkMarker isEqualTo [0,0,0] ) then
	{
		_limitSpeedMarkers pushBack _checkMarker;
		_limitSpeedMarkersCheckIterationFailed = _limitSpeedMarkersCheckIteration;
	};
	_limitSpeedMarkersCheckIteration = _limitSpeedMarkersCheckIteration + 1;
};

private "_return";
if ( count _limitSpeedMarkers >= 1 ) then
{
	//-- Loop that checks if player is driving a vehicle inside the area of any of the speed limit markers.
	[_limitSpeedMarkers, _limitSpeedMaxSpeed, _metric] spawn
	{
		//-- Start the loop.
		params [ "_limitSpeedMarkers", "_limitSpeedMaxSpeed", "_metric" ];
		private _limitVehicleSpeedEHadded = false;
		while { alive player } do
		{
			//private _vehicle = objectParent player;
			private _vehicle = cameraOn;
			if ( !isNull _vehicle && { !( _vehicle isEqualTo player) } ) then
			{
				if
				(
					!( _vehicle isKindOf "Air" )
					&&
					{
						player isEqualTo driver _vehicle
						||
						{ player isEqualTo ((crew _vehicle) select {alive _x} select 0) }
						||
						{ _vehicle isKindOf "UGV_01_base_F" }
					}
				)
				then			
				{
					if ( { if ( position _vehicle inArea _x ) exitWith { 1 }; false } count _limitSpeedMarkers > 0 ) then
					{
						_limitVehicleSpeedEHadded = [ _limitVehicleSpeedEHadded, _vehicle, _limitSpeedMaxSpeed ] call KS_fnc_addVehicleSpeedLimitEH;
					}
					else
					{
							_limitVehicleSpeedEHadded = [ _limitVehicleSpeedEHadded ] call KS_fnc_removeVehicleSpeedLimitEH;
					};
				}
				else
				{
						_limitVehicleSpeedEHadded = [ _limitVehicleSpeedEHadded ] call KS_fnc_removeVehicleSpeedLimitEH;
				};
			}
			else
			{
				_limitVehicleSpeedEHadded = [ _limitVehicleSpeedEHadded ] call KS_fnc_removeVehicleSpeedLimitEH;
			};
		//hintsilent format["Vehicle Speed Limit:\n %1", ["No Limit", format["%1 %2", [round (_limitSpeedMaxSpeed * 0.6213712), _limitSpeedMaxSpeed] select _metric, ["mph","km/h"] select _metric]] select _limitVehicleSpeedEHadded ];
		uisleep 0.1;
		};
		_limitVehicleSpeedEHadded = [ _limitVehicleSpeedEHadded ] call KS_fnc_removeVehicleSpeedLimitEH;
	};
	_return = true;
}
else  //-- No markers found.
{
	["No Markers found, formatting must be %1 (starting with %2) and at least one marker has to be present.", "limitSpeedMarker_#", "0"] call BIS_fnc_error;
	_return = false;
};

_return

/*
private _vehicleSpeed = speed _vehicle;									// Km/h
private _vehicleSpeed = vectorMagnitude velocity _vehicle;				// m/s
private _vehicleSpeed = (vectorMagnitude velocity _vehicle) * 3.6;		// Km/h
private _vehicleSpeed = (vectorMagnitude velocity _vehicle) * 2.23694;	// mph
*/