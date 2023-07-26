params ["_missile"];

while {alive _missile} do {
	_velocity = velocityModelSpace _missile;
	_missile setVelocityModelSpace [(_velocity select 0), (_velocity select 1), ((_velocity select 2) - 180)];
	sleep 0.01;
};