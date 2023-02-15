
private _vehicle=_this select 0;
private _missile=_this select 1;
private _power=90;
private _period=.1;

/*
//Conditions
if (if ((count (crew _vehicle)) < 1) exitWith {};)
if !( isEngineOn _vehicle) exitWith {}; 
if !(_vehicle call DAPS_fnc_HasCharges) exitWith {};
if !(_vehicle getVariable "dapsActive") exitWith {};
if !(isEngineOn _vehicle) exitWith {};
*/

if((count _this)>2)then{_power=_this select 2};
if((count _this)>3)then{_period=_this select 3};
private _up=-_power; 

private _left=-_power;  //Original script that allowed some missiles to pass ---> private _left=_power;if((random 10)>5)then{_left=-_power};

private _velocity=velocityModelSpace _missile;
private _dis=300;  //private _dis=30+(random 70);
while{TRUE}do{
	if!(alive _vehicle)exitWith{};
	if!(alive _missile)exitWith{};
	if((_vehicle distance _missile)<_dis)exitWith{};
	sleep .1;
};

while{TRUE}do{
	if!(alive _vehicle)exitWith{};
	if!(alive _missile)exitWith{};
	_velocity=velocityModelSpace _missile;
	//_up=_power;if((random 10)>5)then{_up=-_power};
	//_left=_power;if((random 10)>5)then{_left=-_power};
	//_missile setVelocityModelSpace[_left,_velocity select 1,(_velocity select 2)+_up];
	_missile setVelocityModelSpace[(_velocity select 0)+_left,_velocity select 1,(_velocity select 2)+_up];
	sleep _period;
};