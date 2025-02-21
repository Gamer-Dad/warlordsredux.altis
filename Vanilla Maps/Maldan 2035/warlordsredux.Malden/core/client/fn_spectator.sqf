["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;

// hide spectator on land
player setPosASL [2304.97, 9243.11, 11.5];
player allowDamage false;

private _sectors = [BIS_WL_allSectors, [], { _x getVariable "BIS_WL_name" }, "ASCEND"] call BIS_fnc_sortBy;

{
    private _sector = _x;
    private _sectorPos = position _sector;
    private _sectorName = _sector getVariable "BIS_WL_name";
    [
        "AddLocation",
        [
            format ["loc%1", _forEachIndex],
            _sectorName,
            "",
            "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\gps_ca.paa",
            [
                _sectorPos vectorAdd [0, 0, 300],
                [0, 0, -1],
                [0, 0, 1],
                [0, false]
            ]
        ]
    ] call BIS_fnc_EGSpectator;
} forEach _sectors;

setViewDistance 5000;

private _osdDisplay = uiNamespace getVariable "RscTitleDisplayEmpty";
_osdDisplay closeDisplay 0;

addMissionEventHandler ["Draw3D", {
    private _drawIcons = uiNamespace getVariable ["WL2_spectatorDrawIcons", []];
    // private _drawLines = uiNamespace getVariable ["WL2_spectatorDrawLines", []];

    {
        drawIcon3D _x;
    } forEach _drawIcons;

    // {
    //     drawLine3D _x;
    // } forEach _drawLines;
}];

0 spawn {
    while { !BIS_WL_missionEnd } do {
        private _drawIcons = [];
        // private _drawLines = [];

        private _categoryMap = missionNamespace getVariable ["WL2_categories", createHashMap];

        private _laserTargets = entities "LaserTarget";
        {
            private _target = _x;
            private _responsiblePlayer = _target getVariable ["WL_laserPlayer", objNull];
            private _playerName = name _responsiblePlayer;
            if (_playerName == "Error: No vehicle") then {
                _playerName = "";
            };
            _drawIcons pushBack [
                "\A3\ui_f\data\IGUI\RscCustomInfo\Sensors\Targets\LaserTarget_ca.paa",
                [1, 0, 0, 1],
                _target modelToWorldVisual [0, 0, 0],
                1,
                1,
                45,
                _playerName,
                0,
                0.05,
                "RobotoCondensedBold"
            ];
        } forEach _laserTargets;

        private _cameraPos = positionCameraToWorld [0, 0, 0];

        private _targets = (vehicles + allUnits) select {
            alive _x &&
            lifeState _x != "INCAPACITATED" &&
            _x getVariable ["WL_spawnedAsset", false] &&
            _cameraPos distance2D _x < 5000;
        };

        {
            private _target = _x;
            private _targetIsInfantry = _target isKindOf "Man";

            private _targetSide = [_target] call WL2_fnc_getAssetSide;
            private _targetColor = switch (_targetSide) do {
                case west: {
                    [0, 0.3, 0.6, 1]
                };
                case east: {
                    [0.5, 0, 0, 1]
                };
                case independent: {
                    [0, 0.5, 0, 1]
                };
            };

            private _assetTypeName = [_target] call WL2_fnc_getAssetTypeName;

            private _ownerPlayer = (_target getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID;
            private _ownerName = name _ownerPlayer;
            if (_ownerName == "Error: No vehicle") then {
                _ownerName = "";
            };
            private _assetName =  format ["%1 (%2)", _assetTypeName, _ownerName];

            private _distance = _cameraPos distance2D _target;
            if (_targetIsInfantry) then {
                if (_distance > 500) then {
                    continue;
                };

                _drawIcons pushBack [
                    "\A3\ui_f\data\IGUI\RscCustomInfo\Sensors\Targets\UnknownGround_ca.paa",
                    _targetColor,
                    _target modelToWorldVisual (_target selectionPosition "spine2"),
                    0.5,
                    0.5,
                    45,
                    if (_distance < 50) then {
                        _assetName
                    } else {
                        ""
                    },
                    true,
                    0.03,
                    "RobotoCondensedBold"
                ];
            } else {
                _assetName = format ["%1 [%2 KM]", _assetName, (round (_distance / 100)) / 10];

                private _assetActualType = _target getVariable ["WL2_orderedClass", typeof _target];

                private _targetIcon = getText (configFile >> "CfgVehicles" >> typeOf _target >> "picture");
                if (_targetIcon == "" || _targetIcon == "picturething") then {
                    _targetIcon = "\A3\ui_f\data\IGUI\RscCustomInfo\Sensors\Targets\Air_ca.paa";
                };
                private _targetIconInfo = getTextureInfo _targetIcon;
                private _targetIconRatio = _targetIconInfo # 0 / _targetIconInfo # 1;

                private _iconSize = linearConversion [0, 5000, _distance, 1.0, 0.3];
                private _iconTextSize = linearConversion [0, 5000, _distance, 0.035, 0.03];
                private _iconPos = _target modelToWorldVisual (getCenterOfMass _target);
                _drawIcons pushBack [
                    _targetIcon,
                    _targetColor,
                    _iconPos,
                    _iconSize * _targetIconRatio,
                    _iconSize,
                    0,
                    _assetName,
                    true,
                    _iconTextSize,
                    "RobotoCondensedBold",
                    "center",
                    true
                ];

                // private _directionVehicle = vectorDir _target;
                // private _directionWeapon = _target weaponDirection currentWeapon _target;
                // {
                //     private _getEndpoint = (_x vectorMultiply 1000) vectorAdd _iconPos;
                //     private _intersection = lineIntersectsSurfaces [
                //         AGLtoASL _iconPos,
                //         AGLtoASL _getEndpoint,
                //         _target
                //     ];
                //     private _getIntersectPoint = if (count _intersection > 0) then {
                //         (_intersection # 0) # 0
                //     } else {
                //         _getEndpoint
                //     };
                //     _drawLines pushBack [
                //         _iconPos,
                //         ASLtoAGL _getIntersectPoint,
                //         _targetColor,
                //         5
                //     ];
                // } forEach [_directionVehicle, _directionWeapon];
            };
        } forEach _targets;

        private _missiles = allMissionObjects "MissileBase";
        {
            private _missile = _x;
            private _missilePos = _missile modelToWorldVisual [0, 0, 0];
            private _distance = _missile distance _cameraPos;

            _drawIcons pushBack [
                "\A3\ui_f\data\IGUI\RscCustomInfo\Sensors\Targets\missile_ca.paa",
                [1, 0, 0, 1],
                _missilePos,
                0.8,
                0.8,
                0,
                format ["%1 KM", (round (_distance / 100)) / 10],
                true,
                0.035,
                "RobotoCondensedBold",
                "center",
                true
            ];
        } forEach _missiles;
        uiNamespace setVariable ["WL2_spectatorDrawIcons", _drawIcons];
        // uiNamespace setVariable ["WL2_spectatorDrawLines", _drawLines];
        sleep 0.01;
    };
};