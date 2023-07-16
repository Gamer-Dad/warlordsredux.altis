params ["_t"];
_owner = ((crew _t) select 0);
if (unitIsUAV _t) then {
	_owner = (leader (_t getVariable ["BIS_WL_ownerAsset", grpNull]));
};
_owner;