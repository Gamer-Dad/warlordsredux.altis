params ["_sender", "_pos", "_target", "_direction"];

if !(isServer) exitWith {};

private _class = _target;
if (getNumber (configFile >> "CfgVehicles" >> _class >> "isUav") == 1) then {
	if (_class == "B_AAA_System_01_F" || {_class == "B_SAM_System_01_F" || {_class == "B_SAM_System_02_F" || {_class == "B_Ship_MRLS_01_F"}}}) then {
		_asset = [_pos, _class, (side group _sender)] call BIS_fnc_WL2_createUAVCrew;	

		//Livery change
		if (typeOf _asset == "B_AAA_System_01_F") then {
			private _side = side _sender;
			if (_side == east) then {
				_asset setObjectTextureGlobal [0, "A3\static_f_jets\AAA_System_01\data\AAA_system_01_olive_co.paa"];
				_asset setObjectTextureGlobal [1, "A3\static_f_jets\AAA_System_01\data\AAA_system_02_olive_co.paa"];
			};
		} else {
			if (typeOf _asset == "B_SAM_System_01_F") then {
				private _side = side _sender;
				if (_side == east) then {
					_asset setObjectTextureGlobal [0, "A3\static_f_jets\SAM_System_01\data\SAM_system_01_olive_co.paa"];
				};
			} else {
				if (typeOf _asset == "B_SAM_System_02_F") then {
					private _side = side _sender;
					if (_side == east) then {
						_asset setObjectTextureGlobal [0, "A3\static_f_jets\SAM_System_02\data\SAM_system_02_olive_co.paa"];
					};
				};
			};
		};
	} else {
		_asset = [_pos, _class, (side group _sender)] call BIS_fnc_WL2_createUAVCrew;
	};

	if (_asset call DIS_fnc_IsSam) then {
		_asset spawn DIS_fnc_RegisterSam;
	};
} else {
	_asset = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
};

_asset setDir _direction;

if (unitIsUAV _asset) then {
	[_asset, 0] remoteExec ["lock", (owner _asset)];
} else {
	[_asset, 2] remoteExec ["lock", (owner _asset)];
};

[_asset, _sender, true] call BIS_fnc_WL2_setOwner;
[_sender, _asset] remoteExec ["BIS_fnc_WL2_newAssetHandle", (owner _sender)];

waitUntil {sleep 0.01; !(isNull _asset)};

_sender setVariable ["BIS_WL_isOrdering", false, [2, (owner _sender)]];