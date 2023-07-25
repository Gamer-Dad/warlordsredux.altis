private _v = _this;

if (!(isNil {_v getVariable "dapsAmmo"}) && {((_v getVariable "dapsAmmo") > 0)}) exitWith {true};
if ((typeOf _v) in dapsDazzler) exitWith {true};

false