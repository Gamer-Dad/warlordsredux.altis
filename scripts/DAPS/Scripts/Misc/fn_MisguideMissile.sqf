params ["_vehicle", "_missile"];

private _power = 180;
private _up = -_power; 
private _left = -_power;

while {alive _missile} do {
	_velocity = velocityModelSpace _missile;
	_missile setVelocityModelSpace [((_velocity select 0) + _left), (_velocity select 1), ((_velocity select 2) + _up)];
	sleep 0.01;
};