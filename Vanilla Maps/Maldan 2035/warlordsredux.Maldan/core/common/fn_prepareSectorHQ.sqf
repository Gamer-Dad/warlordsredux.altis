params ["_sectorBuilding"];

_sectorBuilding setDamage 0;
private _hitPoints = getAllHitPointsDamage _sectorBuilding;
private _allHitPointNames = if (count _hitPoints > 0) then {
    _hitPoints # 0;
} else {
    [];
};
private _windowHitPointNames = _allHitPointNames select { "glass" in toLower _x || "window" in toLower _x };
{
    _sectorBuilding setHitPointDamage [_x, 1];
} forEach _windowHitPointNames;

[_sectorBuilding, true] remoteExec ["WL2_fnc_protectSectorHQ", 0, true];

forceHitPointsDamageSync _sectorBuilding;