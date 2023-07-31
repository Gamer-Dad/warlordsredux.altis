params ["_m", "_unit"];

private _targets = [];
private _target = objNull;
private _tPos = [];
private _frag = false;
private _range = (getNumber (configfile>>"CfgAmmo">>(typeOf _m)>>"indirectHitRange") * 1.5);
_type = (typeOf _m);

while {alive _m} do{
	_targets = _m nearEntities ["AIR", _range];
	if ((count _targets) > 0) exitWith {_frag = true; _target = (_targets select 0)};
	sleep .01;
};

if !(_frag) exitWith {};
if ((count _targets) < 1) exitWith {};

//Vanilla explo
_tPos = getPos _target;
_pos = getPos _m;
triggerAmmo _m;
_d = _pos distance _tPos;
systemChat format ["SAM detonated %1 meters from target", round _d];

//Burst explo
_m2 = createVehicle [_type, _pos, [], 40, "FLY"];
[_m2, [_unit, ((_unit getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID)]] remoteExecCall ["setShotParents", 2];
triggerAmmo _m2;