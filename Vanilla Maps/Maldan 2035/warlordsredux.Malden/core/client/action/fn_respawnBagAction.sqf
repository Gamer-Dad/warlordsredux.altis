private _tentActionText = "<t color='#ff0000'>Place Fast Travel Tent</t>";

private _backpack = if (side group player == west) then {
    "B_RadioBag_01_mtp_F"
} else {
    "B_RadioBag_01_ghex_F"
};

player addBackpack _backpack;

private _actionId = player addAction [
    _tentActionText,
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target removeAction _actionId;
        removeBackpack player;

        private _deploymentResult = ["Land_TentA_F", "Land_TentA_F", [0, 3, 0], 8, true] call WL2_fnc_deployment;

        if !(_deploymentResult # 0) exitWith {
            playSound "AddItemFailed";
            call WL2_fnc_respawnBagAction;
        };

        ["TaskPlaceTent"] call WLT_fnc_taskComplete;

        private _previousRespawnBag = player getVariable ["WL2_respawnBag", objNull];
        if (!isNull _previousRespawnBag) then {
            player setVariable ["WL2_respawnBag", objNull, [2, clientOwner]];
            deleteVehicle _previousRespawnBag;
        };

        private _pos = _deploymentResult # 1;

        private _freshTent = createVehicle ["Land_TentA_F", _pos, [], 0, "NONE"];
        _freshTent setDir (direction player);
        _freshTent setVehiclePosition [_pos, [], 0, "CAN_COLLIDE"];

        private _newPos = getPosATL _freshTent;
        if (abs ((_pos # 2) - (_newPos # 2)) > 5) exitWith {
            deleteVehicle _freshTent;
            systemChat "Failed to place tent. Please try again in an open spot outside.";
            playSound "AddItemFailed";
            call WL2_fnc_respawnBagAction;
        };

        player setVariable ["WL2_respawnBag", _freshTent, [2, clientOwner]];

        _freshTent enableWeaponDisassembly false;
        playSoundUI ["a3\ui_f\data\sound\cfgnotifications\communicationmenuitemadded.wss"];
    },
    "tent",
    6,
    true,
    true,
    "",
    "_this == player && vehicle player == player && typeof (unitBackpack player) in ['B_RadioBag_01_mtp_F', 'B_RadioBag_01_ghex_F']"
];

player setUserActionText [_actionId, _tentActionText, "<img size='2' image='\A3\ui_f\data\map\mapcontrol\Tourism_CA.paa'/>"];
