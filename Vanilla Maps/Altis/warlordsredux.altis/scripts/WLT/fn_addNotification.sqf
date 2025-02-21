params ["_notification"];

if (WLT_notifications == 0) then {
    WLT_notifications = 1;

    [_notification] spawn {
        params ["_notification"];
        sleep 1;
        private _queue = missionNamespace getVariable ["BIS_fnc_showNotification_queue", []];
        while { count _queue > 0 } do {
            sleep 1;
            _queue = missionNamespace getVariable ["BIS_fnc_showNotification_queue", []];
            _queue = _queue select {
                typename _x == "ARRAY"
            };
        };

        if (WLT_notifications > 1) then {
            private _message = format [localize "STR_WLT_startHint", WLT_notifications, actionKeysNames "diary"];
            ["TaskAssigned", ["", _message]] call BIS_fnc_showNotification;
        } else {
            ["TaskAssigned", ["", _notification]] call BIS_fnc_showNotification;
        };

        WLT_notifications = 0;
    };
} else {
    WLT_notifications = WLT_notifications + 1;
};