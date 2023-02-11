// This checks the vehicle ammo (bullets etc) to see if the vehicle has rearmed at a truck etc. If ammo is higher than previous, the APS charges will be reset to default
private _v=_this;
private _a=_v call DAPS_fnc_CountAmmo;
private _l=_v getVariable"dapsLastAmmo";
if(_a>_l)then{_v call DAPS_fnc_RearmAPS};
if(_a<_l)then{_v setVariable["dapsLastAmmo",_a,TRUE]};
TRUE