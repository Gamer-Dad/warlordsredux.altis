params ["_asset"];

private _isInCarrierSector = count (BIS_WL_allSectors select {
    _asset inArea (_x getVariable "objectAreaComplete") && count (_x getVariable ["WL_aircraftCarrier", []]) > 0
}) > 0;

private _readyForLaunch = speed _asset < 0.5 && (vehicle player == _asset || getConnectedUAV player == _asset);

alive _asset && _readyForLaunch && _isInCarrierSector;