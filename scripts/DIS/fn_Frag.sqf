params ["_m", "_unit"];

private _targets = [];
private _target = objNull;
private _tPos = [];
private _frag = false;
private _range = (getNumber (configfile>>"CfgAmmo">>(typeOf _m)>>"indirectHitRange") * 1.5);
_type = (typeOf _m);

systemChat format ["SAM prox fuse is %1 meters", round _range];
sleep 1;

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
_m2 = createVehicle [_type, _pos, [], 20, "FLY"];
_m2 setShotParents [_unit, (leader (_unit getVariable ["BIS_WL_ownerAsset", grpNull]))];
triggerAmmo _m2;