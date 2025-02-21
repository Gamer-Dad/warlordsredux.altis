#include "..\..\warlords_constants.inc"

params ["_asset"];

private _deployActionId = _asset addAction [
	"",
	{
		_this params ["_asset", "_caller", "_deployActionId"];

        private _speed = abs (speed _asset);
        if (_speed > 5) exitWith {
            systemChat "Cannot load/unload deployable while moving!";
            playSound "AddItemFailed";
        };

        _asset setVariable ["WL2_loadingAsset", true, true];

        private _assetLoadedItem = _asset getVariable ["WL2_loadedItem", objNull];
        if (isNull _assetLoadedItem) then {
            private _eligibilityQuery = [_asset, _caller, false] call WL2_fnc_deployableEligibility;
            private _nearLoadableEntities = _eligibilityQuery # 1;

            if (count _nearLoadableEntities > 0) then {
                ['TaskLoadDeployable'] call WLT_fnc_taskComplete;
                private _assetToLoad = _nearLoadableEntities select 0;

                private _offset = if ((_asset canVehicleCargo _assetToLoad) # 0) then {
                    _asset setVehicleCargo _assetToLoad;
                    private _offset = _asset getRelPos _assetToLoad;
                    objNull setVehicleCargo _assetToLoad;
                    _offset;
                } else {
                    _eligibilityQuery # 2;
                };

                [true, [_asset, _assetToLoad, _offset]] remoteExec ["WL2_fnc_attachDetach", _assetToLoad];
            };
        } else {
            [_asset, _assetLoadedItem] spawn {
                params ["_asset", "_assetLoadedItem"];

                private _assetLoadedItemClass = typeOf _assetLoadedItem;
                private _orderedClass = _assetLoadedItem getVariable ["WL2_orderedClass", _assetLoadedItemClass];
                private _distanceToVehicle = player distance2D _asset;
                private _offset = [0, _distanceToVehicle, 0];
                private _deploymentResult = [_assetLoadedItemClass, _orderedClass, _offset, 10, true, _asset] call WL2_fnc_deployment;

                if !(_deploymentResult # 0) exitWith {
                    playSound "AddItemFailed";
                    _asset setVariable ["WL2_loadingAsset", false, true];
                };

                private _position =  _deploymentResult # 1;
                private _direction = direction player;
                private _class = typeOf _assetLoadedItem;
                private _nearbyEntities = [_assetLoadedItemClass, AGLtoASL _position, _direction, "dontcheckuid", [_asset, _assetLoadedItem]] call WL2_fnc_grieferCheck;

                if (count _nearbyEntities > 0) exitWith {
                    private _nearbyObjectName = [_nearbyEntities # 0] call WL2_fnc_getAssetTypeName;
                    systemChat format ["Deploying too close to %1!", _nearbyObjectName];
                    playSound "AddItemFailed";
                    _asset setVariable ["WL2_loadingAsset", false, true];
                };

                private _offset = _deploymentResult # 2;
                [false, [_asset, _assetLoadedItem, _offset, _position, _direction]] remoteExec ["WL2_fnc_attachDetach", _assetLoadedItem];
            };
        };
	},
	[],
	5,
	false,
	true,
	"",
	"([_target, _this, false] call WL2_fnc_deployableEligibility) # 0",
	30,
	false
];

[_asset, _deployActionId] spawn {
    params ["_asset", "_deployActionId"];
    while { alive _asset } do {
        private _assetLoadedItem = _asset getVariable ["WL2_loadedItem", objNull];
        private _hasLoad = !isNull _assetLoadedItem;

        private _actionText = if (_hasLoad) then {
            "Unload deployable";
        } else {
            "Load deployable";
        };

        if (_hasLoad) then {
            if (isAutonomous _assetLoadedItem) then {
				[_asset, false] remoteExec ["setAutonomous", 0];
            };
            if ((locked _assetLoadedItem) != 2) then {
                _assetLoadedItem setVehicleLock "LOCKED";
            };
            {
                moveOut _x;
            } forEach (crew _assetLoadedItem);
        };

        private _actionIcon = if (_hasLoad) then {
            '\A3\ui_f\data\map\markers\handdrawn\end_CA.paa'
        } else {
            '\A3\ui_f\data\map\markers\handdrawn\start_CA.paa'
        };

        _asset setUserActionText [_deployActionId, _actionText, format ["<img size='3' image='%1'/>", _actionIcon]];
        sleep 1;
    };
};
