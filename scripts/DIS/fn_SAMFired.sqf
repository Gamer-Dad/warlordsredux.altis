params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

if !(local _projectile) exitWith {};

private _parents = [(configfile >> "CfgAmmo" >> _ammo), true] call BIS_fnc_returnParents;
if !(("MissileBase" in _parents) || ("MissileCore" in _parents)) exitWith{};

private _airlock = getNumber (configfile>>"CfgAmmo">>_ammo>>"airLock");
private _thrust = getNumber(configfile>>"CfgAmmo">>_ammo>>"thrust");
if ((_airlock==0) && {(_thrust==0)}) exitWith{};

[_projectile, _unit] spawn DIS_fnc_Frag;
[_projectile, (assignedTarget _unit), 1000] spawn DIS_fnc_SAMmaneuver;
systemChat "SAM away";