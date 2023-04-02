[player, -200] call BIS_fnc_WL2_fundsControl;
private  _id = clientOwner;
[] remoteExec ["BIS_fnc_WL2_clientFundsUpdate",  _id];
["RequestMenu_close"] call BIS_fnc_WL2_setupUI;

if (side player == west) then {
	private _assetBlu = createVehicle ["B_Truck_01_medical_F", player , [], 0, "NONE"];
	[player, _assetBlu] call BIS_fnc_WL2_newAssetHandle;

	missionNamespace setVariable ["ftVehicleExistsBlu", true, true];
};

if (side player == east) then {
	private _assetOpf = createVehicle ["O_Truck_03_medical_F", player , [], 0, "NONE"];
	[player, _assetOpf] call BIS_fnc_WL2_newAssetHandle;

	missionNamespace setVariable ["ftVehicleExistsOpf", true, true];
};

