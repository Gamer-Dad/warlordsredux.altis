params ["_messageTemplate"];

private _fps = diag_fps;
private _fpsMin = diag_fpsMin;
private _entitiesCount = count entities "";

private _getRunningScripts = {
    private _activeScripts = diag_activeSQFScripts apply {
        private _filePath = (_x # 1) splitString "\";
        private _filePathCount = count _filePath;
        if (_filePathCount > 3) then {
            _filePath = format [
                "%1/%2/%3",
                _filePath # (_filePathCount - 3),
                _filePath # (_filePathCount - 2),
                _filePath # (_filePathCount - 1)
            ];
        };

        [_filePath, _x # 3]
    };

    private _sortedActiveScripts = [_activeScripts, [], { _x # 0 }, "ASCEND"] call BIS_fnc_sortBy;
    _sortedActiveScripts apply {
        format ["%1: %2", _x # 0, _x # 1]
    };
};
private _runningScripts1 = call _getRunningScripts;
sleep 1;
private _runningScripts2 = call _getRunningScripts;
sleep 1;
private _runningScripts3 = call _getRunningScripts;
_runningScripts2 = _runningScripts2 select {
    !(_x in _runningScripts1)
};
_runningScripts3 = _runningScripts3 select {
    !(_x in _runningScripts1)
};

private _message = format [
    _messageTemplate,
    _fps,
    _fpsMin,
    _entitiesCount,
    _runningScripts1 joinString ", ",
    _runningScripts2 joinString ", ",
    _runningScripts3 joinString ", "
];

_message;