[player, -700] call BIS_fnc_WL2_fundsControl;
private  _id = clientOwner;
[] remoteExec ["BIS_fnc_WL2_clientFundsUpdate",  _id];
["RequestMenu_close"] call BIS_fnc_WL2_setupUI;

if (side player == west) then {
	private _center = getPosATL player;
	private _radius = 20;

	private _angle = random 360;					
	private _randomSquareRoot = sqrt random 1;			
	private _distance = _radius * _randomSquareRoot;	
	private _position = _center getPos [_distance, _angle];

	private _assetBlu = "B_Truck_01_medical_F" createVehicle _position;
	[player, _assetBlu] call BIS_fnc_WL2_newAssetHandle;

	missionNamespace setVariable ["ftVehicleExistsBlu", true, true];
};

if (side player == east) then {
	private _center = getPosATL player;
	private _radius = 20;

	private _angle = random 360;					
	private _randomSquareRoot = sqrt random 1;			
	private _distance = _radius * _randomSquareRoot;	
	private _position = _center getPos [_distance, _angle];

	private _assetOpf = "O_Truck_02_medical_F" createVehicle _position;
	[player, _assetOpf] call BIS_fnc_WL2_newAssetHandle;

	missionNamespace setVariable ["ftVehicleExistsOpf", true, true];
};

