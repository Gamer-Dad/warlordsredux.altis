private _v = _this select 0;
private _i = _this select 1;
private _d = _this select 2;

_d = _v distance _i;
if (_d < 30) exitWith {};

_i setOwner 2;
waitUntil {((owner _i) == 2) || (!alive _i)};

if ((typeOf _i) in dapsExcludedAmmo) exitWith {};
if ((getNumber(configFile >> "CfgAmmo" >> typeOf _i >> "hit")) > dapsHitLimit) exitWith {};
if ((_v distance _i) > _d) exitWith {};

private _ex = true;

while {(alive _i) && (alive _v)} do {
    _d = _v distance _i;
    if (_d < 115) exitWith {_ex = false};
    if (_d > 120) exitWith {};
    sleep 0.001;
};

if !(alive _v) exitWith {};
if (_ex) exitWith {};

private _p = getPosATL _i;
private _id = getDir _i;
private _rd = [_id, _v] call DAPS_fnc_RelDir2;

deleteVehicle _i;

[_v, _id, _p, _i] call DAPS_fnc_React;
_p call DAPS_fnc_Blast;

private _a = _v getVariable "dapsAmmo";
[_v, "", _a] call DAPS_fnc_DeductAmmo;
[_v, "", _rd, true] remoteExec ["DAPS_fnc_Report"];