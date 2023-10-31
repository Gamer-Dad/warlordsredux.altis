params ["_missile"];

while {alive _missile} do {
	_missile setVelocity [0, 0, -200];
	sleep 0.01;
};