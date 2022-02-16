// Makes a vehicle react to an incoming projectile
private["_v","_id","_p","_i"];
_v=_this select 0;
_id=_this select 1;
_p=_this select 2;
_i=_this select 3;
(group _v)setBehaviour"COMBAT";
{_x doWatch _p}forEach(crew _v);
_v setVariable["dapsLastAmmo",(_v call DAPS_fnc_CountAmmo),TRUE];
[_v,_id]spawn DAPS_fnc_PopSmokeTurn;
if(dapsDebug)then{systemChat format["%1 APS triggered by: %2 (%3)",_v,_i,(getText(configFile>>"CfgAmmo">>typeOf _i>>"displayName"))]};