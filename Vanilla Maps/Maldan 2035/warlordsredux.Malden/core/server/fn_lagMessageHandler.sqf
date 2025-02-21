params ["_sender"];
private _messageTemplate = "Server FPS: %1\nServer FPS Min: %2\nEntities Count: %3\nScripts[1]: %4\nScripts[2]: %5\nScripts[3]: %6";
private _message = [_messageTemplate] call WL2_fnc_scriptCollector;
[_message] remoteExec ["WL2_fnc_lagMessageDisplay", _sender];