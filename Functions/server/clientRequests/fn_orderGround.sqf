params ["_sender", "_pos", "_class", "_direction"];

if !(isServer) exitWith {};

_asset = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
_asset setDir _direction;

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

waitUntil {sleep 0.1; !(isNull _asset)};

_owner = owner _sender;
_asset setVariable ["BIS_WL_ownerAsset", (getPlayerUID _sender), [2, _owner]];
[_asset, _sender] remoteExec ["BIS_fnc_WL2_newAssetHandle", _owner];
//_sender setVariable ["BIS_WL_isOrdering", false, [2, _owner]];
/*
Removed all refs to BIS_WL_isOrdering in this file because it was causing an error on the server "Order in progress"
See Line 149 in purchaseMenuAssetAvailability func.
Leaving the code as a ref if its needed again in the future. 
*/