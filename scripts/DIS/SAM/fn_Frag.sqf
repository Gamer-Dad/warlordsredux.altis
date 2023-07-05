private _m = _this select 0;
private _unit = _this select 1;
private _targets = [];
private _target = objNull;
private _tPos = [0, 0, 0];
private _frag = false;

while {alive _m} do {
	_targets = _m nearEntities [["AIR"], 20];
	if ((count _targets) > 0) exitWith {_frag = true; _target = (_targets select 0)};
	sleep .01;
};
if !(_frag) exitWith {};
if ((_target distance _m) > 20) exitWith {};

// Secondary at target location
_type = "ammo_Missile_rim116";
_tPos = getPos _target;
private _m2 = createVehicle [_type, _tPos, [] , 45, "FLY"]; // The number is the max possible radius from target. This at 5 is very deadly
_m2 setShotParents [_unit, [_unit] call DIS_fnc_getOwner];

triggerAmmo _m2;

_pos = getPos _m2;
private _d = _pos distance _tPos;
systemChat format["SAM detonated %1 meters from target", round _d];

if (isNull _target) exitWith {systemChat "Target destroyed"};
if !(alive _target) exitWith {systemChat "Target destroyed"};