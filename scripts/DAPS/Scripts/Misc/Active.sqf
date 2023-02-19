private _v=_this;

"check" remoteExec ["systemChat", -2];

if ((count (crew _v)) < 1) exitWith {false};
if !(_v call DAPS_fnc_HasCharges) exitWith {false};
if !(_v getVariable "dapsActive") exitWith {false};
if !(_v getVariable "dazzlerActivated") exitWith {false};
true