params ["_uid", "_sender"];

private _reward = floor (random [100, 150, 300]);
[_uid, _reward] spawn BIS_fnc_WL2_fundsDatabaseWrite;
[objNull, _reward, true] remoteExec ["BIS_fnc_WL2_killRewardClient", (owner _sender)];