//private["_inputArray","_side","_unit","_ammo","_missile","_message","_parents","_airlock","_thrust"];
//private _inputArray=_this select 0;
private _inputArray=_this;
private _unit=_inputArray select 0;
private _ammo=_inputArray select 4;
private _missile=_inputArray select 6;
if!(local _missile)exitWith{};

private _side=side _unit;
private _parents=[configfile>>"CfgAmmo">>_ammo,true] call BIS_fnc_returnParents;
if!(("MissileBase" in _parents)OR("MissileCore" in _parents))exitWith{};
private _airlock=getNumber(configfile>>"CfgAmmo">>_ammo>>"airLock");
private _thrust=getNumber(configfile>>"CfgAmmo">>_ammo>>"thrust");
if((_airlock==0)AND(_thrust==0))exitWith{};
//if(daoEnhancedSAMs)then{[_missile]spawn DAO_fnc_SAMfrag};
[_missile]execVM"scripts\DIS\SAM\Frag.sqf";
systemChat "SAM away";