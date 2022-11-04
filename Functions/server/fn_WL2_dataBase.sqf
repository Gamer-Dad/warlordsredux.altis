#include "..\warlords_constants.inc"

params ["_uid", "_playerMoneyAmount", "_sender", "_event"];


switch (_event) do {
    case "save": {
        moneyDatabase set [_uid, _playerMoneyAmount];
    };
    case "recieve": {
        if (_uid in moneyDatabase) then {
            private _playerCP =  moneyDatabase get _uid;
            [_playerCP, "succes"] remoteExecCall ["BIS_fnc_WL2_clientFundsRecieve", _sender];
        } else {
            [0, "fail"] remoteExecCall ["BIS_fnc_WL2_clientFundsRecieve", _sender];
        };
    };
};