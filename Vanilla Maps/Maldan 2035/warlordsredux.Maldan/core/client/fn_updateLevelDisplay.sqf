private _finalTutorialTasks = ["TaskDeleteVehicle", "TaskVehicleParadrop", "TaskRefuelVehicle", "TaskFastTravelSquad", "TaskSlingload"];
private _completionStatuses = profileNamespace getVariable ["WLT_TaskCompletionStatuses", createHashMap];
private _allDone = true;
{
	private _taskCompleted = _completionStatuses getOrDefault [_x, false];
	if (!_taskCompleted) then {
		_allDone = false;
	};
} forEach _finalTutorialTasks;

private _levelDisplay = if (!_allDone) then {
	"Recruit"
} else {
	private _playerLevel = ["getLevel"] call WLC_fnc_getLevelInfo;
	format ["Level %1", _playerLevel];
};
player setVariable ["WL_playerLevel", _levelDisplay, true];