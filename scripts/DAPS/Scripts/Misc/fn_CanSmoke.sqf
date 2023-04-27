private _v=_this select 0;
sleep 10;
if !(alive _v) exitWith {};
_v setVariable ["dapsCanSmoke", 1, true];