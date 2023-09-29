params ["_sender", "_pos", "_class", "_direction"];

if !(isServer) exitWith {};

_asset = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
_asset setDir _direction;
_asset setVariable ["BIS_WL_delete", (serverTime + 600), 2];

//Livery change
if (typeOf _asset == "I_Truck_02_MRL_F") then {
	_asset setObjectTextureGlobal [0, "a3\soft_f_beta\truck_02\data\truck_02_kab_opfor_co.paa"];
	_asset setObjectTextureGlobal [2, "a3\soft_f_gamma\truck_02\data\truck_02_mrl_opfor_co.paa"];
};

if (typeOf _asset == "B_APC_Wheeled_03_cannon_F") then {
	_asset setObjectTextureGlobal [0, "A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_co.paa"];
	_asset setObjectTextureGlobal [1, "A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext2_co.paa"];
	_asset setObjectTextureGlobal [2, "A3\armor_f_gamma\APC_Wheeled_03\Data\rcws30_co.paa"];
	_asset setObjectTextureGlobal [3, "A3\armor_f_gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_alpha_co.paa"];
};


if (typeOf _asset == "B_Truck_01_medical_F" || {typeOf _asset == "O_Truck_03_medical_F" || {typeOf _asset == "B_Slingload_01_Medevac_F" || {typeOf _asset == "Land_Pod_Heli_Transport_04_medevac_F" || {unitIsUAV _asset}}}}) then {
	[_asset, 0] remoteExec ["lock", (owner _asset)];
} else {
	[_asset, 2] remoteExec ["lock", (owner _asset)];
};

[_asset, _sender] spawn BIS_fnc_WL2_setOwner;
[_sender, _asset] remoteExec ["BIS_fnc_WL2_newAssetHandle", (owner _sender)];

waitUntil {sleep 0.01; !(isNull _asset)};

_sender setVariable ["BIS_WL_isOrdering", false, [2, (owner _sender)]];