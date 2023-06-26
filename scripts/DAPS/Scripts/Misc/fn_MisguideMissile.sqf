
private _vehicle=_this select 0;
private _missile=_this select 1;
private _power = 90;
_missile setOwner 2;

private _up = -_power; 
private _left = -_power;  //Original script that allowed some missiles to pass ---> private _left=_power;if((random 10)>5)then{_left=-_power};
private _velocity = velocityModelSpace _missile;

while{alive _vehicle && {alive _missile}}do{
	_velocity = velocityModelSpace _missile;
	_missile setVelocityModelSpace [(_velocity select 0)+_left,_velocity select 1,(_velocity select 2)+_up];
	sleep 0.1;
};