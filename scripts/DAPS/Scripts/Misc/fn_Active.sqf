private _v=_this;

if !(_v call DAPS_fnc_HasCharges) exitWith {false};
if !(_v getVariable ["dazzlerActivated", true]) exitWith {false};
if (_v getHitPointDamage "hitEngine" > 0.5) exitWith {
	if ((typeOf _v in dapsDazzler)) then [{false}, {true}];
};
if !( isEngineOn _v) exitWith {
	if ((typeOf _v in dapsDazzler)) then [{false}, {true}];
};

true