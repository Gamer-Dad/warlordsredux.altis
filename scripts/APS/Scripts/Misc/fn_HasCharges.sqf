private _v = _this;

if (!(isNil {_v getVariable "apsAmmo"}) && {((_v getVariable "apsAmmo") > 0)}) exitWith {true};
if ((typeOf _v) in apsDazzler) exitWith {true};

false