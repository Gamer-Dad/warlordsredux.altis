sleep 1;

disReg = [];
while {true} do {
	_units = vehicles;
	{
		if ((count (crew _x)) < 1) then {
			_units = _units - [_x];
		};
	} forEach _units;
	_units = _units - disReg;
	
	{
		_isSAM = _x call DIS_fnc_IsSAM;
		if (_isSAM) then {
			[_x] spawn DIS_fnc_RegisterSAM;
		};
	} forEach _units;
	sleep 5;

	{
		if !(alive _x) then {
			disReg = disReg - [_x];
		};
	} forEach disReg;
};