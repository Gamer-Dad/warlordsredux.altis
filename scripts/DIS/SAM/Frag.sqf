private _m = _this select 0;
private _unit = _this select 1;
private _targets = [];
private _target = objNull;
private _tPos = [];
private _frag = FALSE;
private _type = typeOf _m;
private _range = (getNumber (configfile >> "CfgAmmo" >> _type >> "indirectHitRange") * 3.0);

systemChat format["SAM prox fuse is %1 meters", round _range];
sleep 1;
private _forceHit = TRUE;
if ((random 100) > 0) then {_forceHit = FALSE}; // Change 0 to percent chance if forced frag hit

while {true} do {
	if !(alive _m) exitWith{};
	_targets = _m nearEntities [["AIR"], _range];
	if ((count _targets) > 0) exitWith {_frag = TRUE; _target = (_targets select 0)};
	sleep .01;
};
if !(_frag) exitWith {};
if ((count _targets) < 1) exitWith {};
_target = (_targets select 0);

MRTM_fnc_getOwner = {
	params ["_t"];
	_owner = (crew _t) select 0;
	if !(isAutonomous _t) then {
		_owner = (crew _t) select {isPlayer _x};
		_owner = _owner select 0;
	};
	_owner;
};

// Secondary at target location
_type = "ammo_Missile_rim116";
_tPos = getPos _target;
private _m2 = createVehicle [_type, _tPos, [] , 45, "FLY"]; // The number is the max possible radius from target. This at 5 is very deadly
_m2 setShotParents [_unit, [_unit] call MRTM_fnc_getOwner];

triggerAmmo _m2;

_pos = getPos _m2;
private _d = _pos distance _tPos;
systemChat format["SAM detonated %1 meters from target", round _d];

sleep 1;
if (isNull _target) exitWith {systemChat "Target destroyed"};
if !(alive _target) exitWith {systemChat "Target destroyed"};