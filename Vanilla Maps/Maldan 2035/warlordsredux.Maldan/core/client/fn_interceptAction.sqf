inGameUISetEventHandler ["Action", '
    params ["_target", "_caller", "_index", "_name", "_text", "_priority", "_showWindow", "_hideOnUse", "_shortcut", "_visibility", "_eventName"];
    switch (_name) do {
        case "MoveToPilot": {
            private _access = [_target, _caller, "driver"] call WL2_fnc_accessControl;
            if !(_access # 0) then {
                systemChat format ["Pilot seat locked. (%1)", _access # 1];
                playSoundUI ["AddItemFailed"];
                true;
            } else {
                false;
            };
        };
        case "MoveToDriver": {
            private _access = [_target, _caller, "driver"] call WL2_fnc_accessControl;
            if !(_access # 0) then {
                systemChat format ["Driver seat locked. (%1)", _access # 1];
                playSoundUI ["AddItemFailed"];
                true;
            } else {
                false;
            };
        };
        case "MoveToTurret": {
            private _access = [_target, _caller, "gunner"] call WL2_fnc_accessControl;
            if !(_access # 0) then {
                systemChat format ["Turret seat locked. (%1)", _access # 1];
                playSoundUI ["AddItemFailed"];
                true;
            } else {
                false;
            };
        };
        case "MoveToCargo": {
            private _access = [_target, _caller, "cargo"] call WL2_fnc_accessControl;
            if !(_access # 0) then {
                systemChat format ["Passenger seat locked. (%1)", _access # 1];
                playSoundUI ["AddItemFailed"];
                true;
            } else {
                false;
            };
        };
        case "GetInPilot": {
            private _access = [_target, _caller, "driver"] call WL2_fnc_accessControl;
            if !(_access # 0) then {
                systemChat format ["Pilot seat locked. (%1)", _access # 1];
                playSoundUI ["AddItemFailed"];
                true;
            } else {
                false;
            };
        };
        case "GetInDriver": {
            private _access = [_target, _caller, "driver"] call WL2_fnc_accessControl;
            if !(_access # 0) then {
                systemChat format ["Driver seat locked. (%1)", _access # 1];
                playSoundUI ["AddItemFailed"];
                true;
            } else {
                false;
            };
        };
        case "GetInTurret": {
            private _access = [_target, _caller, "gunner"] call WL2_fnc_accessControl;
            if !(_access # 0) then {
                systemChat format ["Turret seat locked. (%1)", _access # 1];
                playSoundUI ["AddItemFailed"];
                true;
            } else {
                false;
            };
        };
        case "GetInCargo": {
            private _access = [_target, _caller, "cargo"] call WL2_fnc_accessControl;
            if !(_access # 0) then {
                systemChat format ["Passenger seat locked. (%1)", _access # 1];
                playSoundUI ["AddItemFailed"];
                true;
            } else {
                false;
            };
        };
        case "Gear";
        case "Rearm": {
            private _access = [_target, _caller, "cargo"] call WL2_fnc_accessControl;
            if !(_access # 0) then {
                systemChat format ["Inventory locked. (%1)", _access # 1];
                playSoundUI ["AddItemFailed"];
                true;
            } else {
                false;
            };
        };
        case "TakeVehicleControl": {
            private _bannedVehicles = ["C_Plane_Civil_01_F", "I_C_Plane_Civil_01_F"];
            if (typeof _target in _bannedVehicles) then {
                systemChat "You cannot take control of this vehicle.";
                playSoundUI ["AddItemFailed"];
                true;
            } else {
                false;
            };
        };
        default {
            false;
        };
    };
'];