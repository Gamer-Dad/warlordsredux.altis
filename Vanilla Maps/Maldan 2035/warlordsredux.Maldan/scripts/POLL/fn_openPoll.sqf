#include "constants.inc"

params ["_question", "_option1", "_option2", "_option3", "_option4"];

if (isServer) then {
    0 spawn {
        POLL_results = createHashMap;
        private _startTime = serverTime;

        waitUntil {
            sleep 1;
            serverTime > (_startTime + POLL_DURATION);
        };

        private _results = [];
        {
            private _option = missionNamespace getVariable ["POLL_option" + str (_x + 1), str _x];
            _results pushBack format ["%1: %2 votes", _option, count _y];
        } forEach POLL_results;
        private _question = missionNamespace getVariable ["POLL_question", ""];

        private _message = format ["Poll results: %1 %2", _question, _results joinString ", "];
        [_message] remoteExec ["systemChat", 0];

        {
            missionNamespace setVariable ["POLL_option" + str _x, "", true];
        } forEach [1, 2, 3, 4];
        missionNamespace setVariable ["POLL_question", "", true];
    };
};

if (!hasInterface) exitWith {};

private _display = findDisplay POLL_DISPLAY;

if (isNull _display) then {
    _display = createDialog ["POLL_MenuUI", true];
};

disableSerialization;

private _side = BIS_WL_playerSide;

private _closeButton = _display displayCtrl POLL_CLOSE;
_closeButton ctrlAddEventHandler ["ButtonClick", {
    closeDialog 0;
}];

private _pollQuestion = _display displayCtrl POLL_QUESTION;
_pollQuestion ctrlSetText _question;

{
    private _option = _x # 0;
    private _control = _display displayCtrl (_x # 1);
    if (_option == "") then {
        _control ctrlEnable false;
        _control ctrlShow false;
    } else {
        _control ctrlEnable true;
        _control ctrlSetText _option;
        _control ctrlShow true;
    };
    _control setVariable ["POLL_option", _forEachIndex];
    _control ctrlAddEventHandler ["ButtonClick", {
        params ["_control"];
        private _option = _control getVariable ["POLL_option", -1];
        [player, _option] remoteExec ["POLL_fnc_vote", 2];
        closeDialog 0;
    }];
} forEach [
    [_option1, POLL_OPTION_1],
    [_option2, POLL_OPTION_2],
    [_option3, POLL_OPTION_3],
    [_option4, POLL_OPTION_4]
];

private _pollTitle = _display displayCtrl POLL_TITLE;

private _startTime = serverTime;
waitUntil {
    sleep 1;
    playSoundUI ["a3\ui_f\data\sound\readout\readouthideclick1.wss"];
    _pollTitle ctrlSetText format ["OFFICIAL POLL (%1s)", round (POLL_DURATION - (serverTime - _startTime))];
    serverTime > (_startTime + POLL_DURATION) || isNull _display;
};

closeDialog 0;