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

    private _ownerUavAsset = _connectedUAV getVariable ["BIS_WL_ownerUavAsset", "123"];
    private _ownerUnit = _ownerUavAsset call BIS_fnc_getUnitByUID;
    private _ownerID = getPlayerID _ownerUnit;
    private _isInMySquad = ["isInMySquad", [_ownerID]] call SQD_fnc_client;

    if (_connectedUAV != objNull && !_isInMySquad && _ownerUnit != player) then {
        player connectTerminalToUAV objNull;
    };

    if (cameraView == "EXTERNAL" && profileNamespace getVariable ["MRTM_3rdPersonDisabled", false]) then {
        (vehicle player) switchCamera "Internal";
    };

    sleep 0.1;
};