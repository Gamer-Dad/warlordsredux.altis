sleep 1;

disReg = [];

DIS_fnc_IsSAM = compile preprocessFile "scripts\DIS\SAM\IsSAM.sqf";
DIS_fnc_RegisterSAM = compile preprocessFile "scripts\DIS\SAM\RegisterSAM.sqf";
DIS_fnc_frag = compile preprocessFile "scripts\DIS\SAM\Frag.sqf";
DIS_fnc_maneuver = compile preprocessFile "scripts\DIS\SAM\SAManeuver.sqf";
DIS_fnc_fired = compile preprocessFile "scripts\DIS\SAM\SAMfired.sqf";

private _units = [];
private _isSAM = false;

while {true} do {
	_units = [] + vehicles;
	{
		if ((count (crew _x)) < 1) then {
			_units = _units - [_x];
		};
	} forEach _units;
	_units = _units - disReg;
	
	{
		_isSAM = _x call DIS_fnc_IsSAM;
		if (_isSAM) then {
			[_x] spawn DIS_fnc_RegisterSAM
		};
	} forEach _units;
	publicVariable "daoVAMinfo"; // not needed?
	sleep 5;
};