private _SAM = _this select 0;
disReg pushBack _SAM;
private _EH = _SAM addEventHandler ["fired", {_this spawn DIS_fnc_SAMfired;}];