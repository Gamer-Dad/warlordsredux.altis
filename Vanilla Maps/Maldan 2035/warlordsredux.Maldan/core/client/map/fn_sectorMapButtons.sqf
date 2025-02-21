#include "..\..\warlords_constants.inc"

private _display = findDisplay 46 createDisplay "RscDisplayEmpty";

getMousePosition params ["_mouseX", "_mouseY"];

private _offsetX = _mouseX + 0.03;
private _offsetY = _mouseY + 0.04;

private _menuButtons = [];

WL2_TargetButtonSetup = [_display, _menuButtons, _offsetX, _offsetY];

private _sector = WL_SectorActionTarget;
WL_ActionTarget = WL_SectorActionTarget;

private _titleBar = _display ctrlCreate ["RscStructuredText", -1];
_titleBar ctrlSetPosition [_offsetX, _offsetY - 0.05, 0.5, 0.05];
_titleBar ctrlSetBackgroundColor [0.3, 0.3, 0.3, 1];
_titleBar ctrlSetTextColor [0.7, 0.7, 1, 1];
private _sectorName = _sector getVariable ["BIS_WL_name", "Sector"];
_titleBar ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", toUpper _sectorName];
_titleBar ctrlCommit 0;

// Fast Travel Seized Button
private _fastTravelSeizedExecute = {
    params ["_sector"];
    BIS_WL_targetSector = _sector;
    [0, ""] spawn WL2_fnc_executeFastTravel;
    ["TaskMapSectorControls"] call WLT_fnc_taskComplete;
};
[
    "FAST TRAVEL",
    _fastTravelSeizedExecute,
    true,
    "fastTravelSeized",
    [
        0,
        "FTSeized",
        "Fast Travel"
    ]
] call WL2_fnc_addTargetMapButton;

// Fast Travel Stronghold
private _fastTravelSectorHQExecute = {
    params ["_sector"];
    BIS_WL_targetSector = _sector;
    [5, ""] spawn WL2_fnc_executeFastTravel;
};
[
    "FAST TRAVEL STRONGHOLD",
    _fastTravelSectorHQExecute,
    true,
    "fastTravelSectorHQTarget",
    [
        0,
        "SectorHQFT",
        "Fast Travel"
    ]
] call WL2_fnc_addTargetMapButton;

// Fast Travel Conflict Button
private _fastTravelConflictExecute = {
    params ["_sector"];
    BIS_WL_targetSector = _sector;

    private _fastTravelConflictCall = 1 call WL2_fnc_fastTravelConflictMarker;
    private _marker = _fastTravelConflictCall # 0;
    [1, _marker] call WL2_fnc_executeFastTravel;
    deleteMarkerLocal _marker;

    private _markerText = _fastTravelConflictCall # 1;
    deleteMarkerLocal _markerText;
};
[
    "FAST TRAVEL CONTESTED",
    _fastTravelConflictExecute,
    true,
    "fastTravelConflict",
    [
        getMissionConfigValue ["BIS_WL_fastTravelCostContested", 200],
        "FTConflict",
        "Fast Travel"
    ]
] call WL2_fnc_addTargetMapButton;

// Air Assault Button
private _airAssaultExecute = {
    params ["_sector"];
    BIS_WL_targetSector = _sector;

    private _fastTravelConflictCall = 2 call WL2_fnc_fastTravelConflictMarker;
    private _marker = _fastTravelConflictCall # 0;
    [2, _marker] call WL2_fnc_executeFastTravel;
    deleteMarkerLocal _marker;

    private _markerText = _fastTravelConflictCall # 1;
    deleteMarkerLocal _markerText;
};
[
    "AIR ASSAULT",
    _airAssaultExecute,
    true,
    "airAssault",
    [
        getMissionConfigValue ["WL_airAssaultCost", 100],
        "FTAirAssault",
        "Fast Travel"
    ]
] call WL2_fnc_addTargetMapButton;

// Vehicle Paradrop Button
private _vehicleParadropExecute = {
    params ["_sector"];
    BIS_WL_targetSector = _sector;
    [3, ""] call WL2_fnc_executeFastTravel;
};
[
    "VEHICLE PARADROP",
    _vehicleParadropExecute,
    true,
    "vehicleParadrop",
    [
        getMissionConfigValue ["WL_vehicleParadropCost", 1000],
        "FTParadropVehicle",
        "Fast Travel"
    ]
] call WL2_fnc_addTargetMapButton;

// Scan Button
private _scanExecute = {
    params ["_sector"];
    BIS_WL_targetSector = _sector;
    [player, "scan", [], _sector] remoteExec ["WL2_fnc_handleClientRequest", 2];
};
[
    "SECTOR SCAN",
    _scanExecute,
    true,
    "scan",
    [
        getMissionConfigValue ["BIS_WL_scanCost", 750],
        "Scan",
        "Fast Travel"
    ]
] call WL2_fnc_addTargetMapButton;

[_display, _offsetX, _offsetY, _menuButtons] spawn {
    params ["_display", "_originalMouseX", "_originalMouseY", "_menuButtons"];
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

    WL_AssetActionTarget = objNull;
    _display closeDisplay 1;
};

if (count _menuButtons == 0) then {
    _display closeDisplay 1;
};

WL2_TargetButtonSetup = [obNull, [], 0, 0];