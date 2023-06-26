private _v=_this;
if!(local _v)exitWith{};
if((_v getVariable"dapsCanSmoke")==0)exitWith{};
_v setVariable["dapsCanSmoke",0,TRUE];
private _w=[];
private _weapons=[];
{_w=_v weaponsTurret _x;_weapons=_weapons+_w}forEach(allTurrets _v);
if("SmokeLauncher"in _weapons)exitWith{[_v,"SmokeLauncher"]call BIS_fnc_fire;[_v]spawn DAPS_fnc_CanSmoke};
if((count _weapons)==0)exitWith{};
{
if("SmokeLauncher"in([(configFile>>"CfgWeapons">>_x),TRUE]call BIS_fnc_returnParents))exitWith{[_v,_x]call BIS_fnc_fire;_weapons=[];[_v]spawn DAPS_fnc_CanSmoke};
}forEach _weapons;