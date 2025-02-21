params ["_taskId"];

private _tasks = missionNamespace getVariable ["WLT_tasks", createHashMap];
private _taskData = _tasks getOrDefault [_taskId, createHashMap];

private _taskName = _taskData getOrDefault ["name", ""];
private _taskPrereqs = _taskData getOrDefault ["prerequisites", []];

private _alreadyExists = (simpleTasks player) select {
    taskName _x == _taskName
};
if (count _alreadyExists > 0) exitWith { false };

private _taskCompletion = profileNamespace getVariable ["WLT_TaskCompletionStatuses", createHashMap];
private _alreadyCompleted = _taskCompletion getOrDefault [_taskId, false];

if (_alreadyCompleted) exitWith { false };

private _eligible = true;
{
    private _prereq = _x;

    private _prereqCompleted = _taskCompletion getOrDefault [_prereq, false];
    if (!_prereqCompleted) then {
        _eligible = false;
    };
} forEach _taskPrereqs;

_eligible;