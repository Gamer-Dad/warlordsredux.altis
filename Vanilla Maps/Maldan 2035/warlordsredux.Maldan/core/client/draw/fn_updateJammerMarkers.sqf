while { !BIS_WL_missionEnd } do {
    private _jammerMarkerPairs = [];
    private _jammerMarkers = allMapMarkers select {
        _x find "BIS_WL_jammerMarkerOuter_" == 0;
    };

    {
        private _marker = _x;
        private _jammer = objectFromNetId (_marker regexReplace ["BIS_WL_jammerMarkerOuter_", ""]);
        _jammerMarkerPairs pushBack [_jammer, _marker];
    } forEach _jammerMarkers;

    {
        private _jammer = _x # 0;
        private _marker = _x # 1;

        if (!alive _jammer) then {
            deleteMarkerLocal _marker;
            continue;
        };

        private _isActive = _jammer getVariable ["BIS_WL_jammerActivated", false] && isEngineOn _jammer;
        private _isActivating = _jammer getVariable ["BIS_WL_jammerActivating", false] && isEngineOn _jammer;

        if (_isActive || _isActivating) then {
            _marker setMarkerAlphaLocal 1;
        } else {
            _marker setMarkerAlphaLocal 0;
        };

        _marker setMarkerPosLocal _jammer;
    } forEach _jammerMarkerPairs;
    sleep 5;
};