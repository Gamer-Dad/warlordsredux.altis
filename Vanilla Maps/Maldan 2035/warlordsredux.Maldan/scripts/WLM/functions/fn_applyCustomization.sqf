params [
    "_customization",
    ["_state", -1],
    ["_asset", objNull]
];

_asset = if (_asset isEqualTo objNull) then {
    uiNamespace getVariable "WLM_asset"
} else {
    _asset
};
private _assetConfig = configFile >> "CfgVehicles" >> typeOf _asset;

private _assetActualType = _asset getVariable ["WL2_orderedClass", typeOf _asset];

private _appearanceDefaults = profileNamespace getVariable ["WLM_appearanceDefaults", createHashmap];
private _assetAppearanceDefaults = _appearanceDefaults getOrDefault [_assetActualType, createHashmap];

private _finalizeCustomization = {
    params ["_asset"];
    sleep 0.5;
    0 spawn WLM_fnc_constructVehicleMagazine;
};

switch (_customization) do {
    case "smoke";
    case "horn": {
        _customization = _state;
    };
};

if (["setHornTo", _customization] call BIS_fnc_inString) then {
    private _hornName = _customization regexReplace ["setHornTo", ""];
    [_asset, _hornName] remoteExec ["WLM_fnc_changeHorn", _asset];
    _assetAppearanceDefaults set ["horn", _customization];
} else {
    switch (_customization) do {
        case "setSmokeToGunner": {
            [_asset, [0]] remoteExec ["WLM_fnc_moveSmokes", _asset];
            [_asset] spawn _finalizeCustomization;
            _assetAppearanceDefaults set ["smoke", _customization];
        };
        case "setSmokeToCommander": {
            [_asset, [0, 0]] remoteExec ["WLM_fnc_moveSmokes", _asset];
            [_asset] spawn _finalizeCustomization;
            _assetAppearanceDefaults set ["smoke", _customization];
        };
        case "setSmokeToDriver": {
            [_asset, [-1]] remoteExec ["WLM_fnc_moveSmokes", _asset];
            [_asset] spawn _finalizeCustomization;
            _assetAppearanceDefaults set ["smoke", _customization];
        };
        default {
            private _turnOn = if (_state != -1) then {
                _state == 1;
            } else {
                _asset animationPhase _customization == 0;
            };

            if (_turnOn) then {
                private _forceAnimations = getArray (_assetConfig >> "animationSources" >> _customization >> "forceAnimate");
                for "_i" from 0 to ((count _forceAnimations - 1) / 2) do {
                    private _forceAnimationName = _forceAnimations # (_i * 2);
                    private _forceAnimationValue = _forceAnimations # (_i * 2 + 1);
                    _asset animateSource [_forceAnimationName, _forceAnimationValue];
                };
                _asset animateSource [_customization, 1];
                _assetAppearanceDefaults set [_customization, 1];
            } else {
                private _forceAnimations = getArray (_assetConfig >> "animationSources" >> _customization >> "forceAnimate2");
                for "_i" from 0 to ((count _forceAnimations - 1) / 2) do {
                    private _forceAnimationName = _forceAnimations # (_i * 2);
                    private _forceAnimationValue = _forceAnimations # (_i * 2 + 1);
                    _asset animateSource [_forceAnimationName, _forceAnimationValue];
                };
                _asset animateSource [_customization, 0];
                _assetAppearanceDefaults set [_customization, 0];
            };
        };
    };
};

_appearanceDefaults set [_assetActualType, _assetAppearanceDefaults];
profileNamespace setVariable ["WLM_appearanceDefaults", _appearanceDefaults];