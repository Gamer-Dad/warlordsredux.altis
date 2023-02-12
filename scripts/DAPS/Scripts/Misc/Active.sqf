private _v=_this;
if((count(crew _v))<1)exitWith{FALSE};
if !( isEngineOn _v) exitWith {FALSE}; 
if!(_v call DAPS_fnc_HasCharges)exitWith{FALSE};
if!(_v getVariable"dapsActive")exitWith{FALSE};
if!(isEngineOn _v)exitWith{FALSE};
TRUE