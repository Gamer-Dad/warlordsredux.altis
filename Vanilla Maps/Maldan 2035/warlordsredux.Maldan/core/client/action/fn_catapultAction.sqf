#include "..\..\warlords_constants.inc"
params ["_asset"];

private _catapultActionID = _asset addAction [
	"Catapult Launch",
	{
        _this params ["_asset", "_caller", "_actionId"];

        systemChat "Launching in 5 seconds!";
        playSoundUI ["AddItemOk"];

        _asset engineOn true;
        _caller actionNow ["flapsDown", _asset];
        _caller actionNow ["flapsDown", _asset];
        _caller actionNow ["flapsDown", _asset];
        _caller actionNow ["flapsDown", _asset];

        [_asset] spawn {
            params ["_asset"];
            sleep 5;

            private _assetConfig = configFile >> "CfgVehicles" >> typeOf _asset;
            private _stallSpeed = getNumber(_assetConfig >> "stallSpeed");
            private _maxGForce = getNumber(_assetConfig >> "maxGForce");

            private _velocityLaunch = 350 min (_stallSpeed * 1.2);
            private _velocityIncrease = 100 min (_maxGForce * 8);
            private _accelerationStep = 0.0001;
            private _direction = getDir _asset;

            _asset setAirplaneThrottle 1;

            private _velocity = 0;

            private _timeStart = serverTime;
            private _timeDelta = 0;

            while { speed _asset < _velocityLaunch } do {
                _timeDelta = serverTime - _timeStart;
                _velocity = _velocityIncrease * _timeDelta;
                _asset setVelocity [sin _direction * _velocity, cos _direction * _velocity, velocity _asset select 2];
                sleep _accelerationStep;
            };
        };
	},
	[],
	10,
	false,
	true,
	"",
	"[_target] call WL2_fnc_catapultActionEligibility",
    30,
	false
];

_asset setUserActionText [_catapultActionID, "<t color = '#ff4b4b'>Catapult Launch</t>", "<img size='2' color='#ff4b4b' image='\a3\ui_f\data\igui\cfg\simpletasks\types\Plane_ca.paa'/>"];