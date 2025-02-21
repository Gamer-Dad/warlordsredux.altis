#include "..\warlords_constants.inc"

call WL2_fnc_prepareRappel;

private _carrierMarkers = [
	"Carrier1Corner1",
	"Carrier1Corner2",
	"Carrier1Corner3",
	"Carrier1Corner4",
	"Carrier1Corner5",
	"Carrier1Corner6",
	"Carrier1Corner7",
	"Carrier1Corner8",
	"Carrier1Corner9"
];
private _carrierMarkerPos = _carrierMarkers apply {getMarkerPos _x};
private _carrierLines = [];
for "_i" from 0 to (count _carrierMarkers - 1) do {
	private _markerPos = _carrierMarkerPos # _i;
    _carrierLines pushBack (_markerPos # 0);
    _carrierLines pushBack (_markerPos # 1);
};
_carrierLines pushBack (_carrierMarkerPos # 0 # 0);
_carrierLines pushBack (_carrierMarkerPos # 0 # 1);

private _lineMarker = createMarkerLocal ["carrierPolyline", Carrier1];
_lineMarker setMarkerShapeLocal "POLYLINE";
_lineMarker setMarkerColorLocal "ColorRed";
_lineMarker setMarkerPolylineLocal _carrierLines;

private _changeAttackStatus = {
    params ["_carrier", "_markers"];

    private _sector = _carrier getVariable ["WL_carrierSector", objNull];

    private _carrierProps = _carrier getVariable ["WL_carrierProps", []];
    private _isUnderAttack = _carrier getVariable ["WL_carrierUnderAttack", false];
    {
        _x hideObject !_isUnderAttack;
    } forEach _carrierProps;

    private _markers = [
        "Carrier1Rappel1Marker",
        "Carrier1Rappel2Marker",
        "Carrier1Rappel3Marker",
        "Carrier1Rappel4Marker"
    ];

    if (_isUnderAttack) then {
        {
            _x setMarkerAlphaLocal 1;
        } forEach _markers;
    } else {
        {
            _x setMarkerAlphaLocal 0;
        } forEach _markers;
    };
};

private _carriers = [Carrier1];

{
    private _carrier = _x;
    private _sector = (BIS_WL_allSectors select {
        _x distance2D _carrier < 500;
    }) # 0;
    _carrier setVariable ["WL_carrierSector", _sector];

    private _carrierProps = (allMissionObjects "") select {
        _x inArea (_sector getVariable "objectAreaComplete") && { damage _x == 0.5 };
    };
    _carrier setVariable ["WL_carrierProps", _carrierProps];
} forEach _carriers;

// Ensure sync
[_carriers, _changeAttackStatus] spawn {
    params ["_carriers", "_changeAttackStatus"];

    while { !BIS_WL_missionEnd } do {
        sleep 30;
        {
            private _carrier = _x;
            [_carrier] call _changeAttackStatus;
        } forEach _carriers;
    };
};

while { !BIS_WL_missionEnd } do {
    {
        if (isNil "BIS_WL_currentTarget_west" || isNil "BIS_WL_currentTarget_east") then {
            sleep 5;
            continue;
        };
        private _carrier = _x;

        private _sector = _carrier getVariable ["WL_carrierSector", objNull];
        private _wasUnderAttack = _carrier getVariable ["WL_carrierUnderAttack", false];
        private _isUnderAttack = BIS_WL_currentTarget_west == _sector || BIS_WL_currentTarget_east == _sector;
        if (_wasUnderAttack != _isUnderAttack) then {
            _carrier setVariable ["WL_carrierUnderAttack", _isUnderAttack];
            [_carrier] call _changeAttackStatus;
        };
    } forEach _carriers;

    sleep 5;
};