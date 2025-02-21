#include "..\..\warlords_constants.inc"

if (WL_VotePhase == 2) then {
    BIS_WL_selection_availableSectors = BIS_WL_sectorsArray # 1;
    BIS_WL_selection_showLinks = true;
    BIS_WL_selection_dimSectors = true;
};

switch (BIS_WL_currentSelection) do {
    case WL_ID_SELECTION_NONE: {
        if (WL_VotePhase == 0) then {
            BIS_WL_selection_availableSectors = [];
            BIS_WL_selection_showLinks = false;
            BIS_WL_selection_dimSectors = false;
        };
    };
    case WL_ID_SELECTION_ORDERING_NAVAL: {
        BIS_WL_selection_availableSectors = [];
        BIS_WL_selection_showLinks = false;
        BIS_WL_selection_dimSectors = false;
    };
    case WL_ID_SELECTION_FAST_TRAVEL: {
        BIS_WL_selection_availableSectors = (BIS_WL_sectorsArray # 2) select {
            (_x getVariable ["BIS_WL_owner", independent]) == (side (group player))
        };
        BIS_WL_selection_showLinks = false;
        BIS_WL_selection_dimSectors = true;
    };
    case WL_ID_SELECTION_FAST_TRAVEL_CONTESTED: {
        BIS_WL_selection_availableSectors = [WL_TARGET_FRIENDLY];
        BIS_WL_selection_showLinks = false;
        BIS_WL_selection_dimSectors = true;
    };
    case WL_ID_SELECTION_FAST_TRAVEL_VEHICLE: {
        BIS_WL_selection_availableSectors = (BIS_WL_sectorsArray # 2) select {
            private _isCarrierSector = count (_x getVariable ["WL_aircraftCarrier", []]) > 0;
            !_isCarrierSector;
        };
        BIS_WL_selection_showLinks = false;
        BIS_WL_selection_dimSectors = true;
    };
    case WL_ID_SELECTION_ORDERING_AIRCRAFT: {
        BIS_WL_selection_availableSectors = (BIS_WL_sectorsArray # 2) select {
            BIS_WL_orderedAssetRequirements isEqualTo (BIS_WL_orderedAssetRequirements arrayIntersect (_x getVariable "BIS_WL_services"))
        };
        BIS_WL_selection_showLinks = false;
        BIS_WL_selection_dimSectors = true;
    };
    case WL_ID_SELECTION_FAST_TRAVEL_HQ: {
        BIS_WL_selection_availableSectors = (BIS_WL_sectorsArray # 2) select {
            !isNull (_x getVariable ["WL_sectorHQ", objNull])
        };
        BIS_WL_selection_showLinks = false;
        BIS_WL_selection_dimSectors = true;
    };
    case WL_ID_SELECTION_SCAN: {
        private _allScannableSectors = BIS_WL_sectorsArray # 3;
        private _lastScanEligible = serverTime - (getMissionConfigValue ["BIS_WL_scanCooldown", 300]);
        private _availableSectors = _allScannableSectors select {
            _x getVariable [format ["BIS_WL_lastScanEnd_%1", BIS_WL_playerSide], -9999] < _lastScanEligible
        };
        BIS_WL_selection_availableSectors = _availableSectors;
        BIS_WL_selection_showLinks = false;
        BIS_WL_selection_dimSectors = true;
    };
};

if (WL_VotePhase == 1) then {
    BIS_WL_selection_availableSectors = BIS_WL_sectorsArray # 1;
    BIS_WL_selection_showLinks = true;
    BIS_WL_selection_dimSectors = true;
};

if (BIS_WL_selection_showLinks) then {
    {
        _x setMarkerAlphaLocal WL_CONNECTING_LINE_ALPHA_MAX;
    } forEach BIS_WL_sectorLinks;
} else {
    {
        _x setMarkerAlphaLocal 0;
    } forEach BIS_WL_sectorLinks;
};

private _targetedSector = WL_SectorActionTarget;
private _sectorLinks = WL_linkSectorMarkers getOrDefault [hashValue _targetedSector, []];
{
    _x setMarkerAlphaLocal 1;
} forEach _sectorLinks;

{
    private _alpha = if (BIS_WL_selection_dimSectors && !(_x in BIS_WL_selection_availableSectors)) then {
        WL_CONNECTING_LINE_ALPHA_MIN;
    } else {
        1;
    };
    ((_x getVariable "BIS_WL_markers") # 0) setMarkerAlphaLocal _alpha;
    ((_x getVariable "BIS_WL_markers") # 1) setMarkerAlphaLocal _alpha;
} forEach BIS_WL_allSectors;