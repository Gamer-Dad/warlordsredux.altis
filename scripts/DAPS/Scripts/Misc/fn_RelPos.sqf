private _v=_this select 0;
private _rd=_this select 1;
private _d=_this select 2;
_rd=_rd-180;if(_rd<0)then{_rd=_rd+360};
private _p=_v getPos[_d,_rd];
_p