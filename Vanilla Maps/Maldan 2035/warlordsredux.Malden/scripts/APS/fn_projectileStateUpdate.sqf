params ["_projectile"];

if !(_projectile isKindOf "MissileCore") exitWith {};

private _missileTarget = missileTarget _projectile;
if (isNull _missileTarget) exitWith {};

private _assetActualType = _missileTarget getVariable ["WL2_orderedClass", typeOf _missileTarget];
private _hasHMDMap = missionNamespace getVariable ["WL2_hasHMD", createHashMap];
if !(_hasHMDMap getOrDefault [_assetActualType, false]) exitWith {};

while { alive _projectile } do {
    private _currentState = (missileState _projectile) # 1;
    if (_currentState == "LOST") then {
        _projectile setVariable ["APS_missileLost", true, owner _missileTarget];
        break;
    };

    sleep 0.1;
};