private _vehicle=_this select 0;
private _missile=_this select 1;
private _power=90;
private _period=.1;
if((count _this)>2)then{_power=_this select 2};
if((count _this)>3)then{_period=_this select 3};
private _up=_power;if((random 10)>5)then{_up=-_power};
private _left=_power;if((random 10)>5)then{_left=-_power};
private _velocity=velocityModelSpace _missile;
while{TRUE}do{
	if!(alive _vehicle)exitWith{};
	if!(alive _missile)exitWith{};
	_missile setVelocityModelSpace[_left,_velocity select 1,(_velocity select 2)+_up];
	sleep _period;
};