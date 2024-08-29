params ["_sender", "_pos", "_class", "_direction"];

if !(isServer) exitWith {};

private _isUav = getNumber (configFile >> "CfgVehicles" >> _class >> "isUav") == 1;
private _asset = if (_isUav) then {
	[_pos, _class, _direction, _sender] call BIS_fnc_WL2_createUAVCrew;
} else {
	[_class, _pos, _direction] call BIS_fnc_WL2_createVehicleCorrectly;
};

waitUntil {sleep 0.1; !(isNull _asset)};

switch (typeOf _asset) do {
	case "B_APC_Tracked_01_AA_F";
	case "O_APC_Tracked_02_AA_F": {
		_asset removeMagazinesTurret ["4Rnd_Titan_long_missiles", [0]];
		_asset removeMagazinesTurret ["4Rnd_Titan_long_missiles_O", [0]];
		_asset removeWeaponTurret ["missiles_titan_AA", [0]];
		{
			_asset addMagazineTurret ["4Rnd_GAA_missiles", [0]];
		} forEach [1, 2];
		_asset addWeaponTurret ["missiles_titan_AA", [0]];
	};

	case "B_APC_Wheeled_03_cannon_F";
	case "O_APC_Tracked_02_cannon_F": {
		_asset removeMagazinesTurret ["2Rnd_GAT_missiles", [0]];
		_asset removeMagazinesTurret ["2Rnd_GAT_missiles_O", [0]];

		_asset removeWeaponTurret ["missiles_titan", [0]];
		{
			_asset addMagazineTurret ["5Rnd_GAT_missiles", [0]];
		} forEach [1, 2];
		_asset addWeaponTurret ["missiles_titan", [0]];
	};

	case "B_static_AT_F";
	case "O_static_AT_F": {
		_asset removeWeaponTurret ["missiles_titan_static", [0]];
		{
			_asset addMagazineTurret ["1Rnd_GAT_missiles", [0]];
		} forEach [1, 2, 3, 4, 5, 6];
		_asset addWeaponTurret ["missiles_titan_static", [0]];
	};

	case "B_static_AA_F";
	case "O_static_AA_F": {
		_asset removeWeaponTurret ["missiles_titan_static", [0]];
		{
			_asset addMagazineTurret ["1Rnd_GAA_missiles", [0]];
		} forEach [1, 2, 3, 4, 5, 6];
		_asset addWeaponTurret ["missiles_titan_static", [0]];
	};

	case "B_LSV_01_AT_F": {
		_asset removeWeaponTurret ["missiles_titan_static", [0]];
		{
			_asset addMagazineTurret ["1Rnd_GAT_missiles", [0]];
		} forEach [1, 2, 3, 4];
		_asset addWeaponTurret ["missiles_titan_static", [0]];
	};

	case "O_LSV_02_AT_F": {
		_asset removeWeaponTurret ["missiles_Vorona", [0]];
		{
			_asset addMagazineTurret ["Vorona_HEAT", [0]];
		} forEach [1, 2, 3, 4];
		_asset addWeaponTurret ["missiles_Vorona", [0]];
	};

	case "B_G_Offroad_01_AT_F";
	case "O_G_Offroad_01_AT_F": {
		_asset removeWeaponTurret ["launcher_SPG9", [0]];
		_asset addMagazineTurret ["12Rnd_SPG9_HEAT", [0]];
		_asset addWeaponTurret ["launcher_SPG9", [0]];
	};

	case "B_LSV_01_armed_F": {
		_asset removeWeaponTurret ["HMG_127_LSV_01", [0]];
		{
			_asset addMagazineTurret ["100Rnd_127x99_mag_Tracer_Red", [0]];
		} forEach [1, 2, 3];
		_asset addWeaponTurret ["HMG_127_LSV_01", [0]];
	};

	case "O_LSV_02_armed_F": {
		_asset removeWeaponTurret ["LMG_Minigun_Transport", [0]];
		{
			_asset addMagazineTurret ["500Rnd_65x39_Belt_Tracer_Green_Splash", [0]];
		} forEach [1, 2, 3];
		_asset addWeaponTurret ["LMG_Minigun_Transport", [0]];
	};

	case "B_G_Offroad_01_armed_F";
	case "O_G_Offroad_01_armed_F": {
		_asset removeWeaponTurret ["HMG_M2_Mounted", [0]];
		{
			_asset addMagazineTurret ["100Rnd_127x99_mag_Tracer_Yellow", [0]];
		} forEach [1, 2, 3, 4];
		_asset addWeaponTurret ["HMG_M2_Mounted", [0]];
	};

	case "B_HMG_01_F";
	case "B_HMG_01_high_F";
	case "B_HMG_01_A_F";
	case "O_HMG_01_F";
	case "O_HMG_01_high_F";
	case "O_HMG_01_A_F": {
		_asset removeWeaponTurret ["HMG_static", [0]];
		{
			_asset addMagazineTurret ["100Rnd_127x99_mag_Tracer_Yellow", [0]];
		} forEach [1, 2, 3, 4];
		_asset addWeaponTurret ["HMG_static", [0]];
	};
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