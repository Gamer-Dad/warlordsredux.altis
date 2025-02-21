#include "..\..\warlords_constants.inc"

private _dialog = findDisplay 46 createDisplay "RscDisplayEmpty";

getMousePosition params ["_mouseX", "_mouseY"];

private _offsetX = _mouseX + 0.03;
private _offsetY = _mouseY + 0.04;

private _menuButtons = [];

WL2_TargetButtonSetup = [_dialog, _menuButtons, _offsetX, _offsetY];

private _asset = WL_AssetActionTarget;
WL_ActionTarget = WL_AssetActionTarget;

private _titleBar = _dialog ctrlCreate ["RscStructuredText", -1];
_titleBar ctrlSetPosition [_offsetX, _offsetY - 0.05, 0.5, 0.05];
_titleBar ctrlSetBackgroundColor [0.3, 0.3, 0.3, 1];
_titleBar ctrlSetTextColor [0.7, 0.7, 1, 1];
private _assetName = [WL_AssetActionTarget] call WL2_fnc_getAssetTypeName;
_titleBar ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", toUpper _assetName];
_titleBar ctrlCommit 0;

if (!isPlayer _asset && (_asset getVariable ["BIS_WL_ownerAsset", "123"]) == getPlayerUID player) then {
    ["DELETE", {
        params ["_asset"];
        if ((_asset getVariable ["BIS_WL_ownerAsset", "123"]) == getPlayerUID player) then {
            _asset spawn WL2_fnc_deleteAssetFromMap;
            ["TaskMapAssetControls"] call WLT_fnc_taskComplete;
        } else {
            playSoundUI ["AddItemFailed"];
            systemChat "You do not own this asset.";
        };
    }, true] call WL2_fnc_addTargetMapButton;
};

if (side group player == independent && _asset isKindOf "Man" && !isPlayer _asset) then {
    ["CONTROL", {
        params ["_asset"];

        private _assetIsNotMine = (_asset getVariable ["BIS_WL_ownerAsset", "123"]) != getPlayerUID player;
        private _noMoreClaims = BIS_WL_matesAvailable <= 0;
        if (!alive _asset || (_assetIsNotMine && _noMoreClaims)) then {
            playSoundUI ["AddItemFailed"];
            systemChat "No available slots for this unit, or the unit is dead.";
        } else {
            private _maxSubordinates = missionNamespace getVariable [format ["BIS_WL_maxSubordinates_%1", BIS_WL_playerSide], 1];
            private _refreshTimerVar = format ["WL2_manpowerRefreshTimers_%1", getPlayerUID player];
            private _manpowerRefreshTimers = missionNamespace getVariable [_refreshTimerVar, []];
            private _assetIndex = _manpowerRefreshTimers findIf {
                _x # 1 == _asset
            };

            // spawned unit
            if (_assetIndex != -1) then {
                _manpowerRefreshTimers set [_assetIndex, [_manpowerRefreshTimers # _assetIndex # 0, player]];
            } else {
                _asset setVariable ["BIS_WL_ownerAsset", getPlayerUID player, true];
                _manpowerRefreshTimers pushBack [serverTime + WL_MANPOWER_REFRESH_COOLDOWN, _asset];
            };
            missionNamespace setVariable [_refreshTimerVar, _manpowerRefreshTimers, true];
            call WL2_fnc_teammatesAvailability;

            private _playerGroup = group player;
            [_asset] joinSilent _playerGroup;

            selectPlayer _asset;
            _playerGroup selectLeader player;

            player spawn APS_fnc_setupProjectiles;

            playSoundUI ["AddItemOK"];
        };
    }, true] call WL2_fnc_addTargetMapButton;
};

private _accessControl = _asset getVariable ["WL2_accessControl", -1];
if (_accessControl != -1 && !(_asset isKindOf "Man")) then {
    private _lockText = [_accessControl] call WL2_fnc_assetButtonAccessControl;

    [_lockText, {
        params ["_asset"];
        private _accessControl = _asset getVariable ["WL2_accessControl", 0];
        private _newAccess = (_accessControl + 1) % 8;
        _asset setVariable ["WL2_accessControl", _newAccess, true];
        playSound3D ["a3\sounds_f\sfx\objects\upload_terminal\terminal_lock_close.wss", _asset, false, getPosASL _asset, 1, 1, 0, 0];

        // return
        [_newAccess] call WL2_fnc_assetButtonAccessControl;
    }, false] call WL2_fnc_addTargetMapButton;
};

private _hasCrew = count ((crew _asset) select {
    !(typeof _x in ["B_UAV_AI", "O_UAV_AI", "I_UAV_AI"]) && getPlayerUID player != (_x getVariable ["BIS_WL_ownerAsset", "123"])
}) > 0;
private _isNotFlying = (getPosATL _asset # 2) < 10;
if (_hasCrew && _isNotFlying && !(_asset isKindOf "Man")) then {
    ["KICK", {
        params ["_asset"];
        if ((getPosATL _asset # 2) < 10) then {
            private _unwantedPassengers = (crew _asset) select {
                (_x != player) && getPlayerUID player != (_x getVariable ["BIS_WL_ownerAsset", "123"])
            };
            {
                moveOut _x;
            } forEach _unwantedPassengers;
        };
    }, true] call WL2_fnc_addTargetMapButton;
};

if (typeof _asset in ["O_T_Truck_03_device_ghex_F", "O_Truck_03_device_F"]) then {
    private _dazzlerText = [_asset] call WL2_fnc_assetButtonDazzler;

    [_dazzlerText, {
        params ["_asset"];
        [_asset] call WL2_fnc_dazzlerToggle;
    }, true] call WL2_fnc_addTargetMapButton;
};

if (typeof _asset in ["O_T_Truck_03_device_ghex_F", "O_Truck_03_device_F", "Land_Communication_F"]) then {
    private _jammerText = [_asset] call WL2_fnc_assetButtonJammer;

    [_jammerText, {
        params ["_asset"];
        [_asset] call WL2_fnc_jammerToggle;
    }, true] call WL2_fnc_addTargetMapButton;
};

if (typeof _asset in ["B_Radar_System_01_F", "O_Radar_System_01_F", "I_E_Radar_System_01_F"]) then {
    private _radarRotateText = [_asset] call WL2_fnc_assetButtonRadarRotate;

    [_radarRotateText, {
        params ["_asset"];
        _asset setVariable ["radarRotation", !(_asset getVariable ["radarRotation", false]), true];
        playSoundUI ["AddItemOK"];

        // return
        [_asset] call WL2_fnc_assetButtonRadarRotate;
    }, false] call WL2_fnc_addTargetMapButton;
};

private _crewPosition = (fullCrew [_asset, "", true]) select {!("cargo" in _x)};
private _radarSensor = (listVehicleSensors _asset) select {{"ActiveRadarSensorComponent" in _x} forEach _x};
private _hasRadar = count _radarSensor > 0 && (count _crewPosition > 1 || unitIsUAV _asset);
if (_hasRadar) then {
    private _radarOperateText = [_asset] call WL2_fnc_assetButtonRadarOperate;

    [_radarOperateText, {
        params ["_asset"];
        _asset setVariable ["radarOperation", !(_asset getVariable ["radarOperation", false]), true];
        playSoundUI ["AddItemOK"];

        // return
        [_asset] call WL2_fnc_assetButtonRadarOperate;
    }, false] call WL2_fnc_addTargetMapButton;
};

private _access = [_asset, player, "driver"] call WL2_fnc_accessControl;
if (unitIsUAV _asset && getConnectedUAV player != _asset && _access # 0) then {
    ["CONNECT TO UAV", {
        params ["_asset"];
        _access = [_asset, player, "driver"] call WL2_fnc_accessControl;
        if (_access # 0) then {
            player connectTerminalToUAV _asset;
        };
    }, true] call WL2_fnc_addTargetMapButton;
};

// Fast Travel SL Button
private _fastTravelSLExecute = {
    params ["_asset"];
    ["ftSquadLeader"] spawn SQD_fnc_client;
    private _ftNextUseVar = format ["BIS_WL_FTSLNextUse_%1", getPlayerUID player];
    missionNamespace setVariable [_ftNextUseVar, serverTime + WL_FAST_TRAVEL_SQUAD_TIMER];
};
[
    "FAST TRAVEL SL",
    _fastTravelSLExecute,
    true,
    "fastTravelSL",
    [
        getMissionConfigValue ["BIS_WL_fastTravelCostSquadLeader", 10],
        "FTSquadLeader",
        "Fast Travel"
    ]
] call WL2_fnc_addTargetMapButton;

// Fast Travel Squad Button
private _fastTravelSquadmateExecute = {
    params ["_asset"];
    private _playerId = getPlayerID _asset;
    ["ftSquad", [_playerId]] spawn SQD_fnc_client;
};
[
    "FAST TRAVEL SQUAD",
    _fastTravelSquadmateExecute,
    true,
    "fastTravelSquad",
    [
        0,
        "FTSquad",
        "Fast Travel"
    ]
] call WL2_fnc_addTargetMapButton;

// Fast Travel Stronghold Button
private _fastTravelSectorHQExecute = {
    params ["_asset"];
    private _findSector = (BIS_WL_sectorsArray # 2) select {
        (_x getVariable ["WL_sectorHQ", objNull]) == _asset
    };
    BIS_WL_targetSector = (_findSector # 0);
    [5, ""] spawn WL2_fnc_executeFastTravel;
};
[
    "FAST TRAVEL STRONGHOLD",
    _fastTravelSectorHQExecute,
    true,
    "fastTravelSectorHQ",
    [
        0,
        "SectorHQFT",
        "Fast Travel"
    ]
] call WL2_fnc_addTargetMapButton;

#if WL_SECTOR_HQ_DEBUG
// Fast Travel Stronghold Test
private _fastTravelSectorHQTestExecute = {
    params ["_asset"];
    private _findSector = (BIS_WL_sectorsArray # 2) select {
        (_x getVariable ["WL_sectorHQ", objNull]) == _asset
    };
    BIS_WL_targetSector = (_findSector # 0);
    systemChat "Testing Sector Stronghold spawns. Force respawn to end test.";
    while { alive player } do {
        [5, ""] spawn WL2_fnc_executeFastTravel;
        sleep 3;
    };
};
[
    "STRONGHOLD SPAWN TEST",
    _fastTravelSectorHQTestExecute,
    true,
    "fastTravelSectorHQ",
    [
        0,
        "SectorHQFT",
        "Fast Travel"
    ]
] call WL2_fnc_addTargetMapButton;
#endif

[_dialog, _offsetX, _offsetY, _menuButtons] spawn {
    params ["_dialog", "_originalMouseX", "_originalMouseY", "_menuButtons"];
    private _keepDialog = true;
    private _menuHeight = (count _menuButtons) * 0.05;
    private _startTime = serverTime;
    waitUntil {
        sleep 0.1;
        !visibleMap || inputMouse 0 == 0 || serverTime - _startTime > 1;
    };
    while { visibleMap && _keepDialog} do {
        getMousePosition params ["_mouseX", "_mouseY"];

        private _deltaX = _mouseX - _originalMouseX;
        private _deltaY = _mouseY - _originalMouseY;

        if (_deltaX < 0 || _deltaX > 0.5 || _deltaY < -0.05 || _deltaY > _menuHeight) then {
            _keepDialog = inputMouse 0 == 0 && inputMouse 1 == 0;
        };
    };

    WL_ActionTarget = objNull;
    _dialog closeDisplay 1;
};

if (count _menuButtons == 0) then {
    _dialog closeDisplay 1;
};

WL2_TargetButtonSetup = [obNull, [], 0, 0];