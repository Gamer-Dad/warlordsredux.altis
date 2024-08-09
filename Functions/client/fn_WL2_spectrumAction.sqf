#include "..\warlords_constants.inc"

[
    player,
    localize "STR_A3_jammer_send",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "currentWeapon player == 'hgun_esd_01_F'",
    "currentWeapon player == 'hgun_esd_01_F'",
    {},
    {},
    {
        0 spawn {
            private _side = side player;
            private _allUavs = missionNamespace getVariable ["BIS_WL_uavs", []];
            private _allEnemyUavs = _allUavs select { side _x != _side };

            {
                private _screenPosition = worldToScreen (ASLToAGL getPosASL _x);
                
                if (_screenPosition isEqualTo []) then { continue; };
                if (_screenPosition # 0 < 0 || _screenPosition # 0 > 1 || _screenPosition # 1 < 0 || _screenPosition # 1 > 1) then { continue; };

                private _distanceToPlayer = player distanceSqr _x;
                if (_distanceToPlayer > (WL_JAMMER_SPECTRUM_RANGE * WL_JAMMER_SPECTRUM_RANGE)) then { continue; };

                systemChat (localize "STR_A3_jammer_sent");
                _x setVariable ["BIS_WL_spectrumJammed", true, true];
            } forEach _allEnemyUavs;
        };
    },
    {},
    [],
    1,
    100,
    false,
    false
] call BIS_fnc_holdActionAdd;