private _v=_this;
if ((count (crew _v)) < 1) exitWith {
	false;
	"not enough crew!" remoteExec ["systemChat", -2];
};
//if ((crew _v) # 0 findIf {alive _x} == -1) exitWith {false};
if (_v getHitPointDamage "hitEngine" > 0.5) exitWith {
	false;
	"to much dmg!" remoteExec ["systemChat", -2];
};
if !( isEngineOn _v) exitWith {
	false;
	"engine off!" remoteExec ["systemChat", -2];
}; 
if !(_v call DAPS_fnc_HasCharges) exitWith {
	false;
	"no charges!" remoteExec ["systemChat", -2];
};
if !(_v getVariable "dapsActive") exitWith {
	false;
	"daps not active!" remoteExec ["systemChat", -2];
};
if !(_v getVariable "dazzlerActivated") exitWith {
	false;
	"dazzler off!" remoteExec ["systemChat", -2];
};
true

"activeD!" remoteExec ["systemChat", -2];