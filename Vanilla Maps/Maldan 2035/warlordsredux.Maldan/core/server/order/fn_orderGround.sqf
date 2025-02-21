params ["_sender", "_pos", "_orderedClass", "_direction"];

if !(isServer) exitWith {};

private _class = missionNamespace getVariable ["WL2_spawnClass", createHashMap] getOrDefault [_orderedClass, _orderedClass];

private _isUav = getNumber (configFile >> "CfgVehicles" >> _class >> "isUav") == 1;
private _asset = if (_isUav) then {
	[_pos, _class, _orderedClass, _direction, _sender] call WL2_fnc_createUAVCrew;
} else {
	[_class, _orderedClass, _pos, _direction] call WL2_fnc_createVehicleCorrectly;
};

// Colored turret texture
// if (_class != _orderedClass) then {
// 	private _textures = getObjectTextures _asset;
// 	private _side = side group _sender;
// 	private _sideColor = if (_side == west) then {
// 		"#(argb,8,8,3)color(0,0.1,0.2,1)"
// 	} else {
// 		"#(argb,8,8,3)color(0.2,0.1,0,1)"
// 	};

// 	{
// 		// if the string includes texture
// 		private _isTurret = ["turret", _x] call BIS_fnc_inString || ["tow", _x] call BIS_fnc_inString;
// 		if (_isTurret) then {
// 			_asset setObjectTextureGlobal [_forEachIndex, _sideColor];
// 		};
// 	} forEach _textures;
// };

waitUntil {sleep 0.1; !(isNull _asset)};

[_asset, _sender, _orderedClass] call WL2_fnc_processOrder;