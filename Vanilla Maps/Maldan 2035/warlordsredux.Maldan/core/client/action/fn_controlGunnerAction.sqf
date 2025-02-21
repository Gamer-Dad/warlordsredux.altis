#include "..\..\warlords_constants.inc"
params ["_asset"];

private _actionId = _asset addAction [
	"<t color='#0000ff'>Gunner Toggle</t>",
	{
        params ["_target", "_caller", "_actionId"];

        if (isRemoteControlling player) then {
            player remoteControl objNull;
        } else {
            private _eligibleCrew = (crew _target) select {
                alive _x && !(isPlayer _x)
            };
            if (count _eligibleCrew == 0) exitWith {};
            private _gunner = _eligibleCrew # 0;

            player remoteControl _gunner;
            [_gunner] spawn {
                params ["_gunner"];
                waitUntil {
                    !alive _gunner ||
                    !alive player ||
                    vehicle player != vehicle _gunner
                };
                player remoteControl objNull;
            };
        };
	},
	[],
	30,
	false,
	true,
	"",
	"[_target, _this] call WL2_fnc_controlGunnerEligibility",
    30,
	false
];