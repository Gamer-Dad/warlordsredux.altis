params ["_shooter"];

private _reward = 50;
private _responsiblePlayer = _shooter getVariable ["BIS_WL_ownerAsset", "123"] call BIS_fnc_getUnitByUID;
if (isPlayer _responsiblePlayer) then {
    private _uid = getPlayerUID _responsiblePlayer;
    _reward call BIS_fnc_WL2_fundsDatabaseWrite;
    [objNull, _reward, localize "STR_A3_active_protection_system"] remoteExec ["BIS_fnc_WL2_killRewardClient", _responsiblePlayer];
};