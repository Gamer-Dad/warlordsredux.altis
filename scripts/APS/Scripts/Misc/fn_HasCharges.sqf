private _v = _this;

if (_v getVariable ["apsAmmo", 0] > 0) exitwith {true};
if ((typeOf _v) in apsDazzler) exitWith {true};

false