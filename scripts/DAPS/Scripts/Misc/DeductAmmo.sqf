private _v=_this select 0;
private _s=_this select 1;
private _a=_this select 2;
if(_s=="LEFT")then{_v setVariable["dapsAmmoL",(_a-1),TRUE]};
if(_s=="RIGHT")then{_v setVariable["dapsAmmoR",(_a-1),TRUE]};
if(_s=="")then{_v setVariable["dapsAmmo",(_a-1),TRUE]};
TRUE