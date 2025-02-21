params ["_asset", "_unit", "_role"];

private _accessControl = _asset getVariable ["WL2_accessControl", -1];
if (_accessControl == -1) exitWith {
    [true, "Access: Not Set"];
};

private _ownerUID = _asset getVariable ["BIS_WL_ownerUavAsset", _asset getVariable ["BIS_WL_ownerAsset", "123"]];
private _owner = _ownerUID call BIS_fnc_getUnitByUid;
private _ownerID = getPlayerID _owner;
private _callerID = getPlayerID (leader _unit);
private _isOwner = _ownerUID == getPlayerUID (leader _unit);

private _isEnemy = (side group _unit) != _asset call WL2_fnc_getAssetSide;
if (_isEnemy && !(_asset isKindOf "Man")) exitWith {
    [false, "Access: Enemy (Claim to Capture)"];
};

private _access = false;
private _message = "";
switch (_accessControl) do {
    case 0: {
        // All (Full)
        _access = true;
        _message = "Access: All (Full)";
    };
    case 1: {
        // All (Operate)
        _access = _isOwner || _role != "full";
        _message = "Access: All (Operate)";
    };
    case 2: {
        // All (Passenger Only)
        _access = _isOwner || (_role == "cargo");
        _message = "Access: All (Passenger Only)";
    };
    case 3: {
        // Squad (Full)
        private _areInSquad = ["areInSquad", [_callerID, _ownerID]] call SQD_fnc_client;
        _access = _isOwner || _areInSquad;
        _message = "Access: Squad (Full)";
    };
    case 4: {
        // Squad (Operate)
        private _areInSquad = ["areInSquad", [_callerID, _ownerID]] call SQD_fnc_client;
        _access = _isOwner || (_areInSquad && _role != "full");
        _message = "Access: Squad (Operate)";
    };
    case 5: {
        // Squad (Passenger Only)
        private _areInSquad = ["areInSquad", [_callerID, _ownerID]] call SQD_fnc_client;
        _access = _isOwner || (_areInSquad && _role == "cargo");
        _message = "Access: Squad (Passenger Only)";
    };
    case 6: {
        // Personal
        _access = _isOwner;
        _message = "Access: Personal";
    };
    case 7: {
        // Locked
        _access = false;
        _message = "Access: Locked";
    };
    default {
        _access = false;
        _message = "Access: Locked";
    };
};

[_access, _message];