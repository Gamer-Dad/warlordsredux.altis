// Makes a vehicle react to an incoming projectile
private _v=_this select 0;
private _id=_this select 1;
private _p=_this select 2;
private _i=_this select 3;
_v setVariable["dapsLastAmmo",(_v call DAPS_fnc_CountAmmo),TRUE];
if(isPlayer(gunner _v))then{_v remoteExecCall["DAPS_fnc_PopSmoke"]}else{[_v,_id]remoteExec["DAPS_fnc_PopSmokeTurn"]};