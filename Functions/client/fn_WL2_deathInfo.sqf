params ["_unit", "_responsiblePlayer", "_killer"];

if (_unit != player || alive player) exitWith {};

private _responsiblePlayerName = if (!isNull _responsiblePlayer) then {
    name _responsiblePlayer;
} else {
    if (!isNull _killer) then {
        name _killer;
    } else {
        "???";
    };
};

private _isKillerAI = !(isPlayer _responsiblePlayer || isPlayer _killer) && _responsiblePlayerName != "???";
private _isAIText = if (_isKillerAI) then {
    "<t size='1.2'>&#160;&#160;[AI]</t>";
} else {
    "";
};
private _side = side group _unit;
private _killerSide = side group _responsiblePlayer;
if (_killerSide == sideUnknown) then {
    _killerSide = side group _killer;
};
private _killerTeam = switch (_killerSide) do {
    case (west): {
        "[NATO]";
    };
    case (east): {
        "[CSAT]";
    };
    case (independent): {
        "[AAF]";
    };
    default {
        "";
    };
};
private _killerColor = switch (_killerSide) do {
    case (west): {
        "#00008b";
    };
    case (east): {
        "#8b0000";
    };
    case (independent): {
        "#008b00";
    };
    default {
        "#ffffff";
    };
};

private _detectedBySensors = switch (_killerSide) do {
    case (west): {
        listRemoteTargets west;
    };
    case (east): {
        listRemoteTargets east;
    };
    case (independent): {
        listRemoteTargets independent;
    };
    default {
        [];
    };
};
private _findDetection = _detectedBySensors select { _x # 0 == vehicle _unit || _x # 0 == _unit };
private _detectSensorText = if (count _findDetection > 0) then {
    localize "STR_A3_WL_detected_by_sensors";
} else {
    private _detectedByAI = switch (_killerSide) do {
        case (west): {
            west knowsAbout _unit;
        };
        case (east): {
            east knowsAbout _unit;
        };
        case (independent): {
            0;  // independents are always AI anyway
        };
        default {
            0;
        };
    };

    if (_detectedByAI >= 1.5 && _killerSide != _side && !_isKillerAI) then {
        localize "STR_A3_WL_detected_by_AI";
    } else {
        "";
    };
};

private _responsibleText = format ["<t size='1.7' color='%1'>%2 %3 %4</t>", _killerColor, _killerTeam, _responsiblePlayerName, _isAIText];

showScoretable 0;

private _killerVehicle = typeOf vehicle _killer;
private _killerWeapon = currentWeapon _killer;

private _deathDisplay = uiNamespace getVariable ["RscWLDeathDisplay", objNull];
if (isNull _deathDisplay) then {
	"DeathDisplay" cutRsc ["RscWLDeathDisplay", "PLAIN", -1, true, false];
	_deathDisplay = uiNamespace getVariable "RscWLDeathDisplay";
};

private _killedByTitle = _deathDisplay displayCtrl 7220;
private _deathDisplayTitle = _deathDisplay displayCtrl 7210;
private _sensorDisplayTitle = _deathDisplay displayCtrl 7221;

private _deathDisplayBackground = _deathDisplay displayCtrl 7211;
private _deathDisplayBackground2 = _deathDisplay displayCtrl 7212;
private _deathDisplayBackground3 = _deathDisplay displayCtrl 7213;

private _centerDisplayIcon = _deathDisplay displayCtrl 7214;
private _centerDisplayText = _deathDisplay displayCtrl 7215;

private _leftDisplayIcon = _deathDisplay displayCtrl 7216;
private _leftDisplayText = _deathDisplay displayCtrl 7217;

private _rightDisplayText = _deathDisplay displayCtrl 7218;
private _rightDisplayText2 = _deathDisplay displayCtrl 7219;

private _killedByText = format ["<t size='1.4'>%1</t>", localize "STR_A3_WL_killed_by"];
_killedByTitle ctrlSetStructuredText parseText _killedByText;
_killedByTitle ctrlShow true;

_deathDisplayTitle ctrlSetStructuredText parseText _responsibleText;
_deathDisplayTitle ctrlShow true;

_sensorDisplayTitle ctrlSetStructuredText parseText _detectSensorText;
_sensorDisplayTitle ctrlShow true;

_deathDisplayBackground ctrlSetBackgroundColor [0, 0, 0, 0.9];
_deathDisplayBackground2 ctrlSetBackgroundColor [0, 0, 0, 0.9];
_deathDisplayBackground3 ctrlSetBackgroundColor [0, 0, 0, 0.9];

private _centerDisplayIconText = if (vehicle _killer isKindOf "Man") then {
    private _weaponIcon = getText (configfile >> "CfgWeapons" >> _killerWeapon >> "picture");
    _weaponIcon;
} else {
    private _vehicleIcon = getText (configfile >> "CfgVehicles" >> _killerVehicle >> "picture");
    _vehicleIcon;
};

_centerDisplayIcon ctrlSetText _centerDisplayIconText;
_centerDisplayIcon ctrlShow true;

private _centerDisplayKillerText = if (vehicle _killer isKindOf "Man") then {
    private _weaponText = getText (configfile >> "CfgWeapons" >> _killerWeapon >> "displayName");
    _weaponText;
} else {
    private _vehicleText = getText (configfile >> "CfgVehicles" >> _killerVehicle >> "displayName");
    _vehicleText;
};

_centerDisplayText ctrlSetText _centerDisplayKillerText;
_centerDisplayText ctrlShow true;

private _damageDone = if (vehicle _killer isKindOf "Man") then {
    damage _killer;
} else {
    damage vehicle _killer;
};
private _health = round ((1 - _damageDone) * 100);

_leftDisplayText ctrlSetText format ["%1 %2%3", localize "STR_A3_WL_health", _health, "%"];
_leftDisplayText ctrlShow true;

_leftDisplayIcon ctrlSetTextColor [1, 1 - _damageDone, 1 - _damageDone, 1];
_leftDisplayIcon ctrlShow true;

private _distance = round (_killer distance _unit);
private _distanceText = switch (true) do {
    case (_distance < 100): {
        "Under 100 M";
    };
    case (_distance < 500): {
        "Under 500 M";
    };
    case (_distance < 1000): {
        "Under 1 KM";
    };
    case (_distance > 10000): {
        "Over 10 KM";
    };
    default {
        private _upper = ceil (_distance / 1000);
        private _lower = _upper - 1;
        format ["%1 ~ %2 KM", _lower, _upper];
    };
};
private _distanceItemText = format ["<t size='1' color='#ffffff'>%1</t><br/><t size='1.5' color='#00ff00' shadow='0' font='RobotoCondensedBold'>%2</t>", localize "STR_A3_WL_distance", _distanceText];

_rightDisplayText ctrlSetStructuredText parseText _distanceItemText;
_rightDisplayText ctrlShow true;

private _lastScore = missionNamespace getVariable ["WL_lastScore", 0];
private _score = score player;
private _scoreChange = _score - _lastScore;
missionNamespace setVariable ["WL_lastScore", _score];

private _scoreText = format ["<t size='1' color='#ffffff'>%1</t><br/><t size='1.8' color='#00ff00' shadow='0' font='RobotoCondensedBold'>%2</t>", localize "STR_A3_WL_score_in_life", _scoreChange];
_rightDisplayText2 ctrlSetStructuredText parseText _scoreText;
_rightDisplayText2 ctrlShow true;

waitUntil {
    sleep 0.2;
    alive player;
};

_killedByTitle ctrlSetText "";
_killedByTitle ctrlShow false;

_deathDisplayTitle ctrlSetText "";
_deathDisplayTitle ctrlShow false;

_sensorDisplayTitle ctrlSetText "";
_sensorDisplayTitle ctrlShow false;

_deathDisplayBackground ctrlSetBackgroundColor [0, 0, 0, 0];
_deathDisplayBackground2 ctrlSetBackgroundColor [0, 0, 0, 0];
_deathDisplayBackground3 ctrlSetBackgroundColor [0, 0, 0, 0];

_centerDisplayIcon ctrlSetText "";
_centerDisplayIcon ctrlShow false;

_centerDisplayText ctrlSetText "";
_centerDisplayText ctrlShow false;

_leftDisplayIcon ctrlShow false;

_leftDisplayText ctrlSetText "";
_leftDisplayText ctrlShow false;

_rightDisplayText ctrlSetText "";
_rightDisplayText ctrlShow false;

_rightDisplayText2 ctrlSetText "";
_rightDisplayText2 ctrlShow false;

showScoretable -1;