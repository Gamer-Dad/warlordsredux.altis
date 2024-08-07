params ["_sender", "_pos", "_class", "_direction"];

if !(isServer) exitWith {};

_asset = objNull;

if (getNumber (configFile >> "CfgVehicles" >> _class >> "isUav") == 1) then {
	if (_class == "B_AAA_System_01_F" || {_class == "B_SAM_System_01_F" || {_class == "B_SAM_System_02_F" || {_class == "B_Ship_MRLS_01_F"}}}) then {
		if (side group _sender == east) then {
			_asset = [_pos, _class, _direction, east] call BIS_fnc_WL2_createUAVCrew;
		} else {
			_asset = [_class, _pos, _direction] call BIS_fnc_WL2_createVehicleCorrectly;
			_grp = createVehicleCrew _asset;
			_grp deleteGroupWhenEmpty true;
			{
				_member = _x;
				_member setVariable ["BIS_WL_ownerAsset", (getPlayerUID _sender), [2, clientOwner]];
			} forEach units _grp;
		};
	} else {
		_asset = [_class, _pos, _direction] call BIS_fnc_WL2_createVehicleCorrectly;
		private _group = createVehicleCrew _asset;
		_group deleteGroupWhenEmpty true;
		{
			_member = _x;
			_member setVariable ["BIS_WL_ownerAsset", (getPlayerUID _sender), [2, clientOwner]];
		} forEach units _group;
	};
} else {
	_asset = [_class, _pos, _direction] call BIS_fnc_WL2_createVehicleCorrectly;
};

waitUntil {sleep 0.1; !(isNull _asset)};

_asset enableWeaponDisassembly false;

_owner = owner _sender;
_asset setVariable ["BIS_WL_ownerAsset", (getPlayerUID _sender), [2, _owner]];
[_asset, _sender] remoteExec ["BIS_fnc_WL2_newAssetHandle", _owner];
_sender setVariable ["BIS_WL_isOrdering", false, [2, _owner]];