private _v = _this select 0;
private _i = _this select 1;
private _d = _this select 2;

if (_d < 10) exitWith {};
if ((typeOf _i) in dapsExcludedAmmo) exitWith {};
if ((getNumber(configFile >> "CfgAmmo" >> typeOf _i >> "hit")) > dapsHitLimit) exitWith {};
if ((_v distance _i) > _d) exitWith {};

private _ex = false;

while {true} do {
    if !(alive _i) exitWith {_ex = true};
    if !(alive _v) exitWith {_ex = true};
    
    _d = _v distance _i;
    if (_d < 50) exitWith {_ex = false}; // Max intercept distance
    if (_d > 200) exitWith {_ex = true};
    sleep 0.001;
};

if !(alive _v) exitWith {};
if (_ex) exitWith {};

private _p = getPosATL _i;
private _id = getDir _i;
private _rd = [_id, _v] call DAPS_fnc_RelDir2;

[_v, _id, _p, _i] call DAPS_fnc_React;
_p call DAPS_fnc_Blast;
[_i] remoteExec ["deleteVehicle", 0, true];

private _sm = nearestObjects [_p, ["SubmunitionCore"], 10];
{
    if !(alive _x) then {
        [_x] remoteExec ["deleteVehicle", 0, true];
     };
} forEach _sm;

private _a = _v getVariable "dapsAmmo";
[_v, "", _a] call DAPS_fnc_DeductAmmo;
[_v, "", _rd, true] remoteExec ["DAPS_fnc_Report"];