params ["_message"];

private _display = uiNamespace getVariable ["RscLagMessageDisplay", objNull];
if (isNull _display) then {
    "Lag" cutRsc ["RscLagMessageDisplay", "PLAIN", -1, true, true];
    _display = uiNamespace getVariable "RscLagMessageDisplay";
};
private _indicator = _display displayCtrl 10000;
_indicator ctrlSetText _message;
_indicator ctrlSetBackgroundColor [0, 0, 0, 1];
_indicator ctrlCommit 0;

diag_log "======================================================================================";
diag_log "=========================== LAG HANDLE MESSAGE: COPY BELOW ===========================";
diag_log "======================================================================================";

private _splitMessage = [_message, "\n", true] call BIS_fnc_splitString;
{
    {
        diag_log _x;
    } forEach (_x splitString ",");
} forEach _splitMessage;

sleep 10;
_indicator ctrlSetText "";
_indicator ctrlSetBackgroundColor [0, 0, 0, 0];
_indicator ctrlCommit 0;