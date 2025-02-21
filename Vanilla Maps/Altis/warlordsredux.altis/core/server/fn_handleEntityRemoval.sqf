params ["_unit", "_killer", "_instigator"];

private _alreadyHandled = _unit getVariable ["WL2_alreadyHandled", false];
if (_alreadyHandled) exitWith {};
_unit setVariable ["WL2_alreadyHandled", true];

private _children = _unit getVariable ["WL2_children", []];
{
    deleteVehicle _x;
} forEach _children;

private _responsiblePlayer = [_killer, _instigator] call WL2_fnc_handleInstigator;
if (isNull _responsiblePlayer) then {
    private _lastHitter = _unit getVariable ["WL_lastHitter", objNull];
    _responsiblePlayer = _lastHitter;
};

if (isPlayer _unit && _unit isKindOf "Man" && _unit != _responsiblePlayer) then {
    _unit addPlayerScores [0, 0, 0, 0, 1];
    private _killMessage = if (isPlayer _responsiblePlayer) then {
        private _ffText = if (side group _unit == side group _responsiblePlayer) then {
            _responsiblePlayer addPlayerScores [-1, 0, 0, 0, 0];
            " (Friendly fire)"
        } else {
            _responsiblePlayer addPlayerScores [1, 0, 0, 0, 0];
            ""
        };
        format["%1 was killed by %2.%3", name _unit, name _responsiblePlayer, _ffText];
    } else {
        format["%1 was killed.", name _unit];
    };
    [_killMessage] remoteExec ["systemChat", 0];
};

if (!isNull _responsiblePlayer && { isPlayer _responsiblePlayer }) then {
    _unit setVariable ["WL_lastHitter", objNull];

    // must be sync calls, type info may disappear in next frame
    [_unit, _responsiblePlayer] call WL2_fnc_killRewardHandle;
    [_unit, _responsiblePlayer] call WL2_fnc_friendlyFireHandleServer;

    if (isPlayer _unit) then {
        diag_log format["PvP kill: %1_%2 was killed by %3_%4 from %5m", name _unit, getPlayerUID _unit, name _responsiblePlayer, getPlayerUID _responsiblePlayer, _unit distance _responsiblePlayer];
    };

    private _lastSpotted = _unit getVariable ["WL_lastSpotted", objNull];
    if (!isNull _lastSpotted && {_lastSpotted != _responsiblePlayer}) then {
        private _assetActualType = _unit getVariable ["WL2_orderedClass", typeOf _unit];
        private _killReward = if (_unit isKindOf "Man") then {
            if (isPlayer _unit) then {60} else {30};
        } else {
            (serverNamespace getVariable "WL2_killRewards") getOrDefault [_assetActualType, 0];
        };

        private _spotReward = round (_killReward / 8.0);
        _uid = getPlayerUID _lastSpotted;
        _spotReward call WL2_fnc_fundsDatabaseWrite;
        [_unit, _spotReward, "Spot assist", "#7a7ab9"] remoteExec ["WL2_fnc_killRewardClient", _lastSpotted];
    };
};

if (isPlayer [_unit]) then {	// use alt syntax to exclude vehicle kills
    [_unit, _responsiblePlayer, _killer] remoteExec ["WL2_fnc_deathInfo", _unit];
};

_unit spawn {
    params ["_unit"];
    if ((typeOf _unit) == "Land_IRMaskingCover_01_F") then {
        {
            _asset = _x;
            if !(alive _x) then {
                deleteVehicle _asset;
            };
        } forEach ((allMissionObjects "") select {(["BIS_WL_", str _x, false] call BIS_fnc_inString) && {!(["BIS_WL_init", str _x, false] call BIS_fnc_inString)}});
    };
    if ((typeOf _unit) == "Land_Pod_Heli_Transport_04_medevac_F" || {(typeOf _unit) == "B_Slingload_01_Medevac_F"}) then {
        deleteVehicle _unit;
    };
};