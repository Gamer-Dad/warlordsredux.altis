params ["_setting", "_rateLimit"];

private _rateLimitVar = format ["%1_NextChangeAllowed", _setting];
private _rateLimitValue = profileNamespace getVariable [_rateLimitVar, 0];

if (_rateLimitValue > serverTime) then {
    hintSilent format ["You can't change this setting so often!\nYou must wait %1 seconds before changing this setting again.", round (_rateLimitValue - serverTime)];
    playSound "AddItemFailed";
    0 spawn MRTM_fnc_openMenu;
} else {
    private _existingSetting = profileNamespace getVariable [_setting, false];
    player setVariable [_setting, !_existingSetting, [2, clientOwner]];
    profileNamespace setVariable [_setting, !_existingSetting];
    profileNamespace setVariable [_rateLimitVar, serverTime + _rateLimit];
};