private["_v"];
_v = _this;
if ((count (crew _v)) < 1) exitWith {
	false
};

if !( isEngineOn _v) exitWith { 
	false
};

if (_v getVariable "dazzlerActivated") then {
	true
} else {
	false
};