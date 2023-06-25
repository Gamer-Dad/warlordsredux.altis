// Makes a vehicle react to an incoming projectile
private _v=_this select 0;
private _id=_this select 1;
private _p=_this select 2;
private _i=_this select 3;
if(isPlayer(gunner _v))then{_v remoteExecCall["DAPS_fnc_PopSmoke", (owner _v)]}else{[_v,_id]remoteExec["DAPS_fnc_PopSmokeTurn", (owner _v)]};