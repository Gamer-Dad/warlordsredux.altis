private["_v","_rd","_d","_p"];
_v=_this select 0;
_rd=_this select 1;
_d=_this select 2;
_rd=_rd-180;if(_rd<0)then{_rd=_rd+360};
//_p=_v getRelPos[_d,_rd];"m1" setMarkerPos _p;
_p=_v getPos[_d,_rd];
_p