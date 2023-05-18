private _v = _this select 0;
private _i = _this select 1;
private _d = _this select 2;

if (_d < 10) exitWith {};
if ((typeOf _i) in dapsExcludedAmmo) exitWith {};
if ((getNumber(configFile >> "CfgAmmo" >> typeOf _i >> "hit")) > dapsHitLimit) exitWith {};
if ((_v distance _i) > _d) exitWith {};

private _ex = true;

while {alive _i && alive _v} do {
    _d = _v distance _i;
    if (_d < 95) exitWith {_ex = false};
    if (_d > 110) exitWith {_ex = true};
    sleep 0.001;
};

if !(alive _v) exitWith {};
if (_ex) exitWith {};

[_i] remoteExec ["deleteVehicle", 0, true];
private _p = getPosATL _i;
private _id = getDir _i;
private _rd = [_id, _v] call DAPS_fnc_RelDir2;
[_v, _id, _p, _i] call DAPS_fnc_React;
_p call DAPS_fnc_Blast;

{
    [_x] remoteExec ["deleteVehicle", 0, true];
} forEach (nearestObjects [_v, ["ShellCore", "RocketCore", "MissileCore", "ammo_Penetrator_Base"], 10]);

private _a = _v getVariable "dapsAmmo";
[_v, "", _a] call DAPS_fnc_DeductAmmo;
[_v, "", _rd, true] remoteExec ["DAPS_fnc_Report"];