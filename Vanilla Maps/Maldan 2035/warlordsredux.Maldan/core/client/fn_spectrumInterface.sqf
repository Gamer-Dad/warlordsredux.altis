#include "..\warlords_constants.inc"

if (isDedicated) exitWith {};

uiNamespace setVariable ["WL_SpectrumIcons", []];

addMissionEventHandler ["Draw3D", {
    if !(WL_SpectrumInterface) exitWith {};

    private _uavsInRange = uiNamespace getVariable ["WL_SpectrumIcons", []];
    {
        drawIcon3D _x;
    } forEach _uavsInRange;
}];

0 spawn {
    while { !BIS_WL_missionEnd } do {
        if !(WL_SpectrumInterface) then {
            sleep 1;
            continue;
        };

        private _uavsInRange = player getVariable ["WL_SpectrumUavs", []];
        if (count _uavsInRange == 0) then {
            missionNamespace setVariable ["#EM_Values", []];
            sleep 1;
            continue;
        };

        private _sortedUavs = [_uavsInRange, [], {
            _x getVariable ["WL_spectrumViewConeDistance", 1];
        }, "ASCEND"] call BIS_fnc_sortBy;
        private _closestUav = _sortedUavs # 0;
        private _distance = _closestUav getVariable ["WL_spectrumViewConeDistance", 1];
        if (_distance > 1) then {
            sleep 1;
            continue;
        };

        private _emMin = missionNamespace getVariable ["#EM_SelMin", 0];
        private _signalStrength = linearConversion [0, 1, _distance, 100, 0, true];
        missionNamespace setVariable ["#EM_Values", [_emMin + 0.5, _signalStrength]];

        playSoundUI ["a3\ui_f\data\sound\readout\readouthideclick1.wss", 2, 1, true];
        private _frequency = linearConversion [0, 0.5, _distance, WL_JAMMER_SPECTRUM_DIFFICULTY, 1, true];
        sleep _frequency;
    };
};

0 spawn {
    private _lockStatus = 0;
    private _soundLoop = -1;

    missionNamespace setVariable ["#EM_SelMin", 0];
    missionNamespace setVariable ["#EM_SelMax", 1];

    missionNamespace setVariable ["#EM_SMin", 0];
    missionNamespace setVariable ["#EM_SMax", 100];

    private _setSpectrum = {
        params ["_minFreq", "_maxFreq", "_powerAtMin", "_powerAtMax"];
        private _emMin = missionNamespace getVariable ["#EM_SelMin", 0];
        private _emMax = missionNamespace getVariable ["#EM_SelMax", 0];

        missionNamespace setVariable ["#EM_FMin", _minFreq];
        missionNamespace setVariable ["#EM_FMax", _maxFreq];

        if (_emMin > _maxFreq || _emMax < _minFreq) then {
            _emMin = _minFreq;
            _emMax = _minFreq + 1;
        };

        missionNamespace setVariable ["#EM_SelMin", _emMin];
        missionNamespace setVariable ["#EM_SelMax", _emMax];

        [linearConversion [_minFreq, _maxFreq, _emMin, _powerAtMin, _powerAtMax, true], (_emMin + _emMax) / 2];
    };

    private _display = uiNamespace getVariable ["RscSpectrumIndicator", objNull];
    if (isNull _display) then {
        "Spectrum" cutRsc ["RscSpectrumIndicator", "PLAIN", -1, false, true];
        _display = uiNamespace getVariable "RscSpectrumIndicator";
    };
    private _indicator = _display displayCtrl 17001;

    while { !BIS_WL_missionEnd } do {
        sleep 0.2;

        WL_SpectrumInterface = currentWeapon player == "hgun_esd_01_F" &&
            vehicle player == player &&
            alive player && lifeState player != "INCAPACITATED";

        if (!WL_SpectrumInterface) then {
            _indicator ctrlSetText "";
        } else {
            private _spectrumAttachment = ((weaponsItems player) select {
                _x # 0 == "hgun_esd_01_F"
            }) # 0 # 1;

            private _spectrumData = switch (_spectrumAttachment) do {
                case "muzzle_antenna_01_f": {
                    [70, 90, 2.5, 1.75] call _setSpectrum;
                };
                case "muzzle_antenna_02_f": {
                    [350, 500, 1.5, 0.5] call _setSpectrum;
                };
                case "muzzle_antenna_03_f": {
                    [432, 434, 0.75, 0.75] call _setSpectrum;
                };
                default {
                    [490, 500, 0.5, 0.45] call _setSpectrum;
                };
            };
            private _weaponModifier = _spectrumData # 0;
            private _lockRange = WL_JAMMER_SPECTRUM_RANGE * _weaponModifier;


            private _attachmentName = switch (_spectrumAttachment) do {
                case "muzzle_antenna_01_f": {
                    "SD Military Antenna"
                };
                case "muzzle_antenna_02_f": {
                    "SD Experimental Antenna"
                };
                case "muzzle_antenna_03_f": {
                    "SD Jammer Antenna"
                };
                default {
                    "No Antenna"
                };
            };
            _indicator ctrlSetStructuredText parseText format [
                "<t align='center' size='1.4' shadow='2'>%1<br/>Frequency: %2MHz<br/>Max Range: %3m<br/>Lock Time: %4s</t>",
                _attachmentName,
                _spectrumData # 1,
                round _lockRange,
                (0.8 * _weaponModifier) toFixed 2
            ];

            private _uavsInRange = allUnitsUAV select {
                _x distance2D player < WL_JAMMER_SPECTRUM_DETECT_RANGE &&
                [_x] call WL2_fnc_getAssetSide != BIS_WL_playerSide &&
                count lineIntersectsSurfaces [getPosASL _x, eyePos player, _x, player] == 0
            };

            player setVariable ["WL_SpectrumUavs", _uavsInRange];

            private _spectrumIcons = [];
            {
                private _targetSide = [_x] call WL2_fnc_getAssetSide;
                private _color = switch (_targetSide) do {
					case west: { [0, 0.3, 0.6, 0.9] };
					case east: { [0.5, 0, 0, 0.9] };
					case independent: { [0, 0.6, 0, 0.9] };
					default { [1, 1, 1, 0] };
                };

                private _targetPos = _x modelToWorldVisual [0, 0, 0];
                private _distance = _x distance player;

                private _screenPos = worldToScreen _targetPos;
                private _viewConeDistance = if (count _screenPos == 2) then {
                    _screenPos distance2D [0.5, 0.5]
                } else {
                    1
                };
                _viewConeDistance = _viewConeDistance * (getObjectFOV player) * (_weaponModifier ^ 1.5);
                _viewConeDistance = (_viewConeDistance min 0.5) * 2;

                _x setVariable ["WL_spectrumViewConeDistance", _viewConeDistance];

                private _randCone = if (_viewConeDistance < WL_JAMMER_SPECTRUM_DIFFICULTY) then {
                    0
                } else {
                    _viewConeDistance * _distance / 2;
                };

                _targetPos = [
                    _targetPos # 0 + random [-_randCone, 0, _randCone],
                    _targetPos # 1 + random [-_randCone, 0, _randCone],
                    _targetPos # 2 + random [-_randCone / 5, 0, _randCone / 5]
                ];

                _spectrumIcons pushBack [
                    "\A3\ui_f\data\IGUI\Cfg\Targeting\MarkedTarget_ca.paa",
                    _color,
                    _targetPos,
                    2,
                    2,
                    0,
                    "???",
                    true,
                    0.035,
                    "RobotoCondensedBold",
                    "center",
                    true
                ];
            } forEach _uavsInRange;

            private _findLockedUav = _uavsInRange findIf {
                private _viewConeDistance = _x getVariable ["WL_spectrumViewConeDistance", 1];
                _viewConeDistance < WL_JAMMER_SPECTRUM_DIFFICULTY
            };

            if (_findLockedUav != -1) then {
                private _lockedUav = _uavsInRange # _findLockedUav;
                private _distance = _lockedUav distance player;
                (_spectrumIcons # _findLockedUav) set [0, if (_distance < _lockRange) then {
                    "\A3\ui_f\data\IGUI\Cfg\Targeting\HitConfirm_ca.paa"
                } else {
                    "\A3\ui_f\data\IGUI\Cfg\Targeting\MarkedTargetNoLos_ca.paa"
                }];

                private _assetTypeName = [_lockedUav] call WL2_fnc_getAssetTypeName;
                private _distanceText = if (_distance < _lockRange) then {
                    format ["%1 KM", (round (_distance / 100)) / 10]
                } else {
                    "OUT OF RANGE"
                };
                (_spectrumIcons # _findLockedUav) set [6, format ["%1 (%2)", _assetTypeName, _distanceText]];

                if (_distance < _lockRange && inputAction "defaultAction" > 0) then {
                    _lockStatus = _lockStatus + 1;
                    missionNamespace setVariable ["#EM_Transmit", true];
                    missionNamespace setVariable ["#EM_Progress", _lockStatus / (4 * _weaponModifier)];

                    if (_lockStatus > (4 * _weaponModifier)) then {
                        systemChat (localize "STR_A3_jammer_sent");

                        _lockedUav setVariable ["BIS_WL_spectrumJammed", true, true];
                        _lockedUav setVariable ["WL_lastHitter", player, 2];

                        // Effect
                        if (getPosATL _lockedUav # 2 > 1) then {
                            [_lockedUav, player] remoteExec ["WL2_fnc_uavJammed", 2];
                        } else {
                            [_lockedUav, false] remoteExec ["setAutonomous", 0];
                        };

                        playSoundUI ["a3\sounds_f_decade\assets\props\linkterminal_01_node_1_f\terminal_captured.wss", 1, 1, true];

                        _lockStatus = 0;
                    };
                } else {
                    missionNamespace setVariable ["#EM_Transmit", false];
                    missionNamespace setVariable ["#EM_Progress", 0];
                    _lockStatus = 0;
                };
            } else {
                missionNamespace setVariable ["#EM_Transmit", false];
                missionNamespace setVariable ["#EM_Progress", 0];
                _lockStatus = 0;
            };

            private _friendlyUavs = allUnitsUAV select {
                _x distance2D player < WL_JAMMER_SPECTRUM_DETECT_RANGE &&
                [_x] call WL2_fnc_getAssetSide == BIS_WL_playerSide
            };
            {
                private _color = switch (BIS_WL_playerSide) do {
					case west: { [0, 0.3, 0.6, 0.9] };
					case east: { [0.5, 0, 0, 0.9] };
                };
                private _targetPos = _x modelToWorldVisual [0, 0, 0];
                private _distance = _targetPos distance player;
                private _assetTypeName = [_x] call WL2_fnc_getAssetTypeName;
                private _distanceDisplay = format ["%1 KM", (round (_distance / 100)) / 10];
                private _targetDisplay = format ["%1 (%2)", _assetTypeName, _distanceDisplay];

                _spectrumIcons pushBack [
                    "\A3\ui_f\data\IGUI\Cfg\Targeting\MarkedTargetNoLos_ca.paa",
                    _color,
                    _targetPos,
                    2,
                    2,
                    0,
                    _targetDisplay,
                    true,
                    0.035,
                    "RobotoCondensedBold",
                    "center",
                    true
                ];
            } forEach _friendlyUavs;

            uiNamespace setVariable ["WL_SpectrumIcons", _spectrumIcons];
        };
    };
};