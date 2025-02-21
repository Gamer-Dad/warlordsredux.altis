params ["_taskId", ["_init", false]];

private _taskCompletion = profileNamespace getVariable ["WLT_TaskCompletionStatuses", createHashMap];
private _tasks = missionNamespace getVariable ["WLT_tasks", createHashMap];

private _taskNotFound = false;
if (_init) then {
    {
        private _taskData = _y;
        private _taskName = _taskData getOrDefault ["name", ""];
        private _parentTask = _taskData getOrDefault ["parentTask", ""];
        private _taskCompleted = _taskCompletion getOrDefault [_x, false];
        if (_taskCompleted) then {
            private _category = [_parentTask] call WLT_fnc_handleParentTask;
            private _task = player createSimpleTask [_taskName, _category];
            _task setTaskState "Succeeded";
        };
    } forEach _tasks;
} else {
    private _taskData = _tasks getOrDefault [_taskId, createHashMap];
    private _taskName = _taskData getOrDefault ["name", ""];

    private _findTask = (simpleTasks player) select {
        taskName _x == _taskName && !taskCompleted _x
    };
    if (count _findTask > 0) then {
        private _task = _findTask # 0;
        _task setTaskState "Succeeded";

        private _taskReward = _taskData getOrDefault ["reward", 0];
        if (_taskReward > 0) then {
            private _newScore = (["getScore"] call WLC_fnc_getLevelInfo) + _taskReward;
            if (typeName _newScore == "scalar") then {
                [_newScore] call WLC_fnc_setScore;
            };
        };

        private _message = format ["%1 (+%2XP)", taskName _task, _taskReward];
        ["TaskSucceeded", ["", _message]] call BIS_fnc_showNotification;

        _taskCompletion set [_taskId, true];
        profileNamespace setVariable ["WLT_TaskCompletionStatuses", _taskCompletion];
    } else {
        _taskNotFound = true;
    };

    0 spawn WL2_fnc_updateLevelDisplay;
};

if (_taskNotFound) exitWith {};

{
    private _eligible = [_x] call WLT_fnc_taskEligible;
    if (_eligible) then {
        [_x, _init] call WLT_fnc_taskStart;
    };
} forEach _tasks;

// clean up parent tasks
{
    private _children = taskChildren _x;
    if (count _children == 0) then {
        continue;
    };
    private _allComplete = true;
    private _parentTaskName = taskName _x;
    {
        private _parentTask = _y getOrDefault ["parentTask", ""];
        if (_parentTask == "" || _parentTask != _parentTaskName) then {
            continue;
        };
        private _subtaskCompleted = _taskCompletion getOrDefault [_x, false];
        if (!_subtaskCompleted) then {
            _allComplete = false;
        };
    } forEach _tasks;
    if (_allComplete) then {
        // _x setTaskState "Succeeded";
        {
            player removeSimpleTask _x;
        } forEach _children;
        player removeSimpleTask _x;
    };
} forEach (simpleTasks player);

if (_init) then {
    private _mute = profileNamespace getVariable ["MRTM_muteTaskNotifications", false];
    if (!_mute) then {
        private _tasks = (simpleTasks player) select {
            taskState _x == "Assigned" && count (taskChildren _x) == 0
        };
        private _notification = format [localize "STR_WLT_startHint", count _tasks, actionKeysNames "diary"];
        ["TaskAssigned", ["", _notification]] call BIS_fnc_showNotification;
        hintSilent _notification;
    };
};