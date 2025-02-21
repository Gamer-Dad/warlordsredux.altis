if (isDedicated) exitWith {};

private _scoreControl = (findDisplay 46) ctrlCreate ["RscStructuredText", -1];

private _blockW = safeZoneW / 1000;
private _blockH = safeZoneH / (1000 / (getResolution # 4));

private _displayW = _blockW * 180;
private _displayH = _blockH * 54;
private _displayX = safeZoneW + safeZoneX - _displayW - (_blockW * 10);
private _displayY = safeZoneH + safeZoneY - _displayH - (_blockH * 50);

_scoreControl ctrlSetPosition [_displayX - (_blockW * 110), _displayY - (_blockH * 16 * 3 + _blockH * 30), _blockW * 160, _blockH * 16 * 4];
_scoreControl ctrlCommit 0;

uiNamespace setVariable ["WL_scoreControl", _scoreControl];
uiNamespace setVariable ["WL_killRewardMap", createHashMap];

while { !BIS_WL_missionEnd } do {
    private _killRewards = uiNamespace getVariable ["WL_killRewardMap", []];
    private _killFeedDirty = false;
    private _newKillRewardMap = createHashMap;
    {
        private _killRewardTimestamp = _y # 3;
        if ((_killRewardTimestamp + 10) > serverTime) then {
            _newKillRewardMap set [_x, _y];
        } else {
            _killFeedDirty = true;
        };
    } forEach _killRewards;

    if (_killFeedDirty) then {
        uiNamespace setVariable ["WL_killRewardMap", _newKillRewardMap];
        [_newKillRewardMap] call WL2_fnc_updateKillFeed;
    };

    sleep 1;
};