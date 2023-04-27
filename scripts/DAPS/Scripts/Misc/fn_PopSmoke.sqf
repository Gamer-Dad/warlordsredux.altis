private _v=_this;
if!(local _v)exitWith{};
if((_v getVariable"dapsCanSmoke")==0)exitWith{};
_v setVariable["dapsCanSmoke",0,TRUE];
private _w=[];
private _weapons=[];
{_w=_v weaponsTurret _x;_weapons=_weapons+_w}forEach(allTurrets _v);
if("SmokeLauncher"in _weapons)exitWith{[_v,"SmokeLauncher"]call BIS_fnc_fire;[_v]spawn DAPS_fnc_CanSmoke};
if("rhsusf_weap_M250"in _weapons)exitWith{[_v,"rhsusf_weap_M250",4]spawn DAPS_fnc_PopSmoke2};
if("rhsusf_weap_M257"in _weapons)exitWith{[_v,"rhsusf_weap_M257",4]spawn DAPS_fnc_PopSmoke2};
if("rhsusf_weap_M257_8"in _weapons)exitWith{[_v,"rhsusf_weap_M257_8",4]spawn DAPS_fnc_PopSmoke2};
if("rhsusf_weap_M259"in _weapons)exitWith{[_v,"rhsusf_weap_M259",4]spawn DAPS_fnc_PopSmoke2};
if("rhs_weap_902a"in _weapons)exitWith{[_v,"rhs_weap_902a",4]spawn DAPS_fnc_PopSmoke2};
if("rhs_weap_902b"in _weapons)exitWith{[_v,"rhs_weap_902b",4]spawn DAPS_fnc_PopSmoke2};
{
if(_x in dapsSmokeLaunchers)exitWith{[_v,_x]call BIS_fnc_fire;_weapons=[];[_v]spawn DAPS_fnc_CanSmoke};
}forEach _weapons;
if((count _weapons)==0)exitWith{};
{
if("SmokeLauncher"in([(configFile>>"CfgWeapons">>_x),TRUE]call BIS_fnc_returnParents))exitWith{[_v,_x]call BIS_fnc_fire;_weapons=[];[_v]spawn DAPS_fnc_CanSmoke};
}forEach _weapons;