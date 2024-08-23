params ["_sender", "_pos", "_class", "_direction"];

if !(isServer) exitWith {};

private _isUav = getNumber (configFile >> "CfgVehicles" >> _class >> "isUav") == 1;
private _asset = if (_isUav) then {
	[_pos, _class, _direction, _sender] call BIS_fnc_WL2_createUAVCrew;
} else {
	[_class, _pos, _direction] call BIS_fnc_WL2_createVehicleCorrectly;
};

waitUntil {sleep 0.1; !(isNull _asset)};

if (typeOf _asset == "B_APC_Tracked_01_AA_F" || {typeOf _asset == "O_APC_Tracked_02_AA_F"}) then {
	_asset removeMagazinesTurret ["4Rnd_Titan_long_missiles",[0]];
	_asset removeMagazinesTurret ["4Rnd_Titan_long_missiles_O",[0]];
	_asset removeWeaponTurret ["missiles_titan_AA",[0]];
	{_asset addMagazineTurret ["4Rnd_GAA_missiles",[0]];} forEach [1,2];
	_asset addWeaponTurret ["missiles_titan_AA",[0]];
};

_asset enableWeaponDisassembly false;

if ("120Rnd_CMFlare_Chaff_Magazine" in (_asset magazinesTurret [-1])) then {
	_asset addMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine", [-1], 120]
};

_owner = owner _sender;
_asset setVariable ["BIS_WL_ownerAsset", (getPlayerUID _sender), [2, _owner]];
_asset setVariable ["BIS_WL_lastActive", 0, _owner];
[_asset] call BIS_fnc_WL2_lastHitHandler;
[_asset, _sender] remoteExec ["BIS_fnc_WL2_newAssetHandle", _owner];
_sender setVariable ["BIS_WL_isOrdering", false, [2, _owner]];