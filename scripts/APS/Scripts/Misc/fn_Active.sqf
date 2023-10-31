private _v=_this;

if !(_v call APS_fnc_HasCharges) exitWith {false};
if !(_v getVariable ["dazzlerActivated", true]) exitWith {false};
if (_v getHitPointDamage "hitEngine" > 0.5) exitWith {
	if ((typeOf _v in apsDazzler)) then [{false}, {true}];
};
if !( isEngineOn _v) exitWith {
	if ((typeOf _v in apsDazzler)) then [{false}, {true}];
};

true