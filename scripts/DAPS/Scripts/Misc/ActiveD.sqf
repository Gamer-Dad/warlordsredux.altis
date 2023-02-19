private _v=_this;
if ((count (crew _v)) < 1) exitWith {false};
if ((crew _v) # 0 findIf {alive _x} == -1) exitWith {false};
if (_v getHitPointDamage "hitEngine" > 0.5) exitWith {false};
if !( isEngineOn _v) exitWith {false}; 
if !(_v call DAPS_fnc_HasCharges) exitWith {false};
if !(_v getVariable "dapsActive") exitWith {false};
if !(_v getVariable "dazzlerActivated") exitWith {false};
true