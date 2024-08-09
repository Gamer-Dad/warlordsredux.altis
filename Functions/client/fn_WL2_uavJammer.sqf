#include "..\warlords_constants.inc"

params ["_asset", "_owner"];

private _side = side _owner;

private _allUavs = missionNamespace getVariable ["BIS_WL_uavs", []];
_allUavs pushBack _asset;
missionNamespace setVariable ["BIS_WL_uavs", _allUavs, true];

// Jammer checker (5s loop)
[_asset, _side] spawn {
    params ["_asset", "_side"];
    while { alive _asset } do {
        private _jammerMarkers = missionNamespace getVariable ["BIS_WL_jammerMarkers", []];
        private _allJammers = _jammerMarkers apply { _x # 0 };
        private _enemyJammers = _allJammers select { side _x != _side };

        private _jammersInRange = _allJammers select {
            private _distanceToJammer = _asset distanceSqr _x;
            _distanceToJammer < (WL_JAMMER_RANGE_OUTER * WL_JAMMER_RANGE_OUTER);
        };

        _asset setVariable ["BIS_WL_relevantJammers", _jammersInRange];
        sleep 5;
    };
};

// Jammer strength checker (1s loop)
[_asset] spawn {
    params ["_asset"];
    private _hardlineDistanceSqr = WL_JAMMER_HARDLINE_RANGE * WL_JAMMER_HARDLINE_RANGE;
    while { alive _asset } do {
        sleep 1;
        
        private _controller = (UAVControl _asset) # 0;
        private _controllerDistanceToAsset = _controller distanceSqr _asset;
        if (_controllerDistanceToAsset < _hardlineDistanceSqr) then {
            _asset setVariable ["BIS_WL_jammerStrength", 0];
            continue;
        };

        private _spectrumJammed = _asset getVariable ["BIS_WL_spectrumJammed", false];

        private _relevantJammers = _asset getVariable ["BIS_WL_relevantJammers", []];
        if (count _relevantJammers == 0 && !_spectrumJammed) then {
            _asset setVariable ["BIS_WL_jammerStrength", 0];
            continue;
        };

        private _closestJammerDistance = WL_JAMMER_RANGE_OUTER * WL_JAMMER_RANGE_OUTER;
        private _closestJammer = objNull;
        {
            private _distanceToJammer = _asset distanceSqr _x;
            if (_distanceToJammer < _closestJammerDistance) then {
                _closestJammerDistance = _distanceToJammer;
                _closestJammer = _x;
            };
        } forEach _relevantJammers;
        _closestJammerDistance = sqrt _closestJammerDistance;

        private _jammerStrength = linearConversion [WL_JAMMER_RANGE_OUTER, WL_JAMMER_RANGE_INNER, _closestJammerDistance, 0, 1, true];
        if (_spectrumJammed) then {
            _jammerStrength = 1;
            playSoundUI ["a3\sounds_f\vehicles\air\CAS_01\noise.wss", 1, 1, false, 3.6];
            systemChat format ["UAV hit with jamming signal!"];
        };
        _asset setVariable ["BIS_WL_jammerStrength", _jammerStrength];
        
        if (_jammerStrength >= 1) then {
            _asset setVariable ["BIS_WL_spectrumJammed", false, true];

            if (getPosATL _asset # 2 > 1) then {	
                // flyers take damage
                _asset setDamage [(damage _asset + 0.1), true, _closestJammer];
            } else {
                // all others, disable control
                _asset setAutonomous false;
                if (!isNull _controller) then {
                    _controller connectTerminalToUAV objNull;
                };
            };
        };
    };
};

// Jammer screen effect (1s loop)
[_asset] spawn {
    params ["_asset"];
    private _filmGrain = ppEffectCreate ["filmGrain", 2000];
    _filmGrain ppEffectAdjust [1, 0];
    _filmGrain ppEffectEnable false;
    _filmGrain ppEffectForceInNVG true;
    _filmGrain ppEffectCommit 0;

    private _sensors = (listVehicleSensors _asset) apply { _x # 0 };
    private _sensorsDisabled = false;
    while { alive _asset } do {
        private _jammerStrength = _asset getVariable ["BIS_WL_jammerStrength", 0];
        
        if (!isRemoteControlling player) then {
            _filmGrain ppEffectEnable false;
            hintSilent "";
        } else {
            private _isControllingThisAsset = (UAVControl _asset) # 1 != "";
            if (_isControllingThisAsset) then {
                if (_jammerStrength > 0) then {
                    hintSilent format ["Jamming signal strength: %1", round (_jammerStrength * 100)];
                    _filmGrain ppEffectEnable true;
                    _filmGrain ppEffectAdjust [1, (1 - _jammerStrength)];
                } else {
                    _filmGrain ppEffectEnable false;
                    hintSilent "";
                };
            };
        };
        _filmGrain ppEffectCommit 0;

        private _thermalDisabled = equipmentDisabled _asset # 1;
        if (_jammerStrength > WL_JAMMER_SENSOR_THRESHOLD && !_thermalDisabled) then {
            _asset disableTIEquipment true;
            _sensorsDisabled = true;
        } else {
            if (_jammerStrength <= WL_JAMMER_SENSOR_THRESHOLD && _thermalDisabled) then {
                _asset disableTIEquipment false;
                _sensorsDisabled = false;
            };
        };

        if (_sensorsDisabled) then {
            {
                _asset enableVehicleSensor [_x, false];
            } forEach _sensors;
            _asset setVehicleReceiveRemoteTargets false;
            _asset setVehicleReportOwnPosition false;
            _asset setVehicleReportRemoteTargets false;
        } else {
            {
                _asset enableVehicleSensor [_x, true];
            } forEach _sensors;
            _asset setVehicleReceiveRemoteTargets true;
            _asset setVehicleReportOwnPosition true;
            _asset setVehicleReportRemoteTargets true;
        };

        sleep 1;
    };

    _filmGrain ppEffectEnable false;
    _filmGrain ppEffectCommit 0;
    ppEffectDestroy _filmGrain;
};