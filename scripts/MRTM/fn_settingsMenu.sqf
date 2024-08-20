private _actionText = "<t color='#FF0000'>Settings</t>";
private _actionImage = "<img size='3' image='\a3\3den\Data\Displays\Display3DEN\PanelRight\submode_logic_module_ca'/>";
private _settingActionID = player addAction [_actionText, MRTM_fnc_openMenu, [], -99, false, false, "", ''];
player setUserActionText [_settingActionID, _actionText, _actionImage];

private _previousVehicle = vehicle player;
private _previousDroneState = UAVControl (getConnectedUAV player) # 1;

while { alive player } do {
    private _currentVehicle = vehicle player;
    private _connectedUAV = getConnectedUAV player;
    private _uavControl = UAVControl _connectedUAV;

    if (_currentVehicle != _previousVehicle || _uavControl # 1 != _previousDroneState) then {
        [] call MRTM_fnc_updateViewDistance;
        _previousVehicle = _currentVehicle;
        _previousDroneState = _uavControl # 1;
    };
    
    private _isConnectable = _connectedUAV getVariable ["WL_canConnectUav", false];
    if (!_isConnectable) then {
        player connectTerminalToUAV objNull;
    };

    if (cameraView == "EXTERNAL" && profileNamespace getVariable ["MRTM_3rdPersonDisabled", false]) then {
        (vehicle player) switchCamera "Internal";
    };

    sleep 0.1;
};