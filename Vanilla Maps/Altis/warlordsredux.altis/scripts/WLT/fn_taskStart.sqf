params ["_taskId", ["_init", false]];

private _tasks = missionNamespace getVariable ["WLT_tasks", createHashMap];
private _taskData = _tasks getOrDefault [_taskId, createHashMap];
private _taskName = _taskData getOrDefault ["name", ""];

private _findTask = (simpleTasks player) select {
    taskName _x == _taskName
};
if (count _findTask > 0) exitWith {};

private _parentTask = _taskData getOrDefault ["parentTask", ""];
private _category = [_parentTask] call WLT_fnc_handleParentTask;

private _trackers = _taskData getOrDefault ["progressTrackers", []];
{
    private _trackerId = _x getOrDefault ["id", ""];
    WLT_stats set [_trackerId, 0];
} forEach _trackers;

private _task = player createSimpleTask [_taskName, _category];
_task setTaskState "Assigned";

private _mute = profileNamespace getVariable ["MRTM_muteTaskNotifications", false];
if (!_mute && !_init) then {
    [_taskName] call WLT_fnc_addNotification;
};

private _onStart = _taskData getOrDefault ["onStart", 0];
if (typename _onStart == "CODE") then {
    call _onStart;
};