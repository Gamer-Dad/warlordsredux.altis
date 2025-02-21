params ["_parentTask"];

if (_parentTask == "") exitWith {
    taskNull;
};

private _findParentTask = (simpleTasks player) select {
    taskName _x == _parentTask
};
if (count _findParentTask == 0) then {
    private _newParentTask = player createSimpleTask [_parentTask];
    _newParentTask setSimpleTaskDescription ["", _parentTask, ""];
    _newParentTask setTaskState "Assigned";
    _newParentTask;
} else {
    _findParentTask # 0;
};
