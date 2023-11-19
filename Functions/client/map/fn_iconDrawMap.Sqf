params ["_m"];

_side = side group player;
_sideN = [east, west] find _side;
if !(isNull BIS_WL_highlightedSector) then {
	_m drawIcon [
		"A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa",
		[1,1,1,0.5],
		BIS_WL_highlightedSector,
		60,
		60,
		(time * 75) % 360
	];
};
if (BIS_WL_currentSelection == 4) then {
	_cursorPos = _m ctrlMapScreenToWorld getMousePosition;
	_isWater = surfaceIsWater _cursorPos;
	_m drawIcon [
		"A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa",
		if (_isWater) then {[1,1,1,0.5]} else {[1,1,1,0.1]},
		_cursorPos,
		60,
		60,
		if (_isWater) then {(time * 75) % 360} else {0}
	];
};
if (!isNull BIS_WL_mapAssetTarget) then {
	_m drawIcon [
		"A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa",
		[1,1,1,1],
		BIS_WL_mapAssetTarget,
		40,
		40,
		(time * 75) % 360
	];
};
{
	_m drawIcon [
		"\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa",
		[1, 0, 0, 0.8],
		_x call BIS_fnc_getPos,
		20,
		20,
		0,
		_x call BIS_fnc_iconText,
		1,
		0.043,
		"PuristaBold",
		"right"
	];
} forEach (allPlayers select {(!alive _x) && {(side group _x == _side)}});
{
	private _revealTrigger = _x getVariable "BIS_WL_revealTrigger";
	{
		if (!isNull _x) then {
			_m drawIcon [
				_x call BIS_fnc_iconType,
				if (side group _x == Independent) then {[0,0.6,0,1]} else {if (side group _x == west) then {[0,0.3,0.6,1]} else {[0.5,0,0,1]}},
				_x call BIS_fnc_getPos,
				_x call BIS_fnc_iconSize,
				_x call BIS_fnc_iconSize,
				_x call BIS_fnc_getDir,
				_x call BIS_fnc_iconTextSectorScan,
				1,
				0.043,
				"PuristaBold",
				"right"
			];
		};
	} forEach (((list _revealTrigger) - (missionNamespace getVariable [format ["BIS_WL_%1_ownedVehicles", getPlayerUID player], []])) select {(side group _x != _side) && {(alive _x) && {((side group _x) in BIS_WL_sidesArray)}}});
} forEach BIS_WL_currentlyScannedSectors;
{
	if (_x == player) then {
		_m drawIcon [
			'a3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa',
			[1,0,0,1],
			_x call BIS_fnc_getPos,
			_x call BIS_fnc_iconSize,
			_x call BIS_fnc_iconSize,
			0,
			"",
			1,
			0.043,
			"PuristaBold",
			"right"
		];
	};
	_m drawIcon [
		_x call BIS_fnc_iconType,
		_x call BIS_fnc_iconColor,
		_x call BIS_fnc_getPos,
		_x call BIS_fnc_iconSize,
		_x call BIS_fnc_iconSize,
		_x call BIS_fnc_getDir,
		_x call BIS_fnc_iconText,
		1,
		0.043,
		"PuristaBold",
		"right"
	];
} forEach (allPlayers select {(side group _x == _side) && {(isNull objectParent _x) && {(alive _x)}}});
{
	if (!isNull _x) then {
		_m drawIcon [
			_x call BIS_fnc_iconType,
			_x call BIS_fnc_iconColor,
			_x call BIS_fnc_getPos,
			_x call BIS_fnc_iconSize,
			_x call BIS_fnc_iconSize,
			_x call BIS_fnc_getDir,
			_x call BIS_fnc_iconText,
			1,
			0.043,
			"PuristaBold",
			"right"
		];
	};		
} forEach ((allUnits) select {(side group (crew _x select 0) == _side) && {(alive _x) && {(isNull objectParent _x) && {typeOf _x != "Logic"}}}});
{
	_m drawIcon [
		_x call BIS_fnc_iconType,
		_x call BIS_fnc_iconColor,
		_x call BIS_fnc_getPos,
		_x call BIS_fnc_iconSize,
		_x call BIS_fnc_iconSize,
		_x call BIS_fnc_getDir,
		_x call BIS_fnc_iconText,
		1,
		0.043,
		"PuristaBold",
		"right"
	];		
} forEach ((units player) select {(alive _x) && {(isNull objectParent _x) && {_x != player}}});
{
	if (!isNull _x) then {
		_m drawIcon [
			_x call BIS_fnc_iconType,
			_x call BIS_fnc_iconColor,
			_x call BIS_fnc_getPos,
			_x call BIS_fnc_iconSize,
			_x call BIS_fnc_iconSize,
			_x call BIS_fnc_getDir,
			_x call BIS_fnc_iconText,
			1,
			0.043,
			"PuristaBold",
			"right"
		];
	};
} forEach ((entities [["LandVehicle", "Air", "Ship"], ["Logic"], false, true]) select {alive _x && {([((getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "side")) == _sideN), (side group ((crew _x) # 0) == _side)] select (count (crew _x) > 0)) && {(typeOf _x != "B_Truck_01_medical_F") && {(typeOf _x != "O_Truck_03_medical_F")}}}});
{
	if (!isNull _x) then {
		_m drawIcon [
			_x call BIS_fnc_iconType,
			_x call BIS_fnc_iconColor,
			_x call BIS_fnc_getPos,
			_x call BIS_fnc_iconSize,
			_x call BIS_fnc_iconSize,
			_x call BIS_fnc_getDir,
			_x call BIS_fnc_iconText,
			1,
			0.043,
			"PuristaBold",
			"right"
		];
	};
} forEach ((missionNamespace getVariable [format ["BIS_WL_%1_ownedVehicles", getPlayerUID player], []]) select {(alive _x) && {(typeOf _x != "B_Truck_01_medical_F") && {(typeOf _x != "O_Truck_03_medical_F") && {(typeOf _x != "B_Slingload_01_Medevac_F") && {(typeOf _x != "Land_Pod_Heli_Transport_04_medevac_F")}}}}});
if (_side == west) then {
	{
		_m drawIcon [
			_x call BIS_fnc_iconType,
			_x call BIS_fnc_iconColor,
			_x call BIS_fnc_getPos,
			_x call BIS_fnc_iconSize,
			_x call BIS_fnc_iconSize,
			_x call BIS_fnc_getDir,
			"Spawn truck",
			1,
			0.043,
			"PuristaBold",
			"right"
		];
	} forEach (vehicles select {(typeOf _x == "B_Truck_01_medical_F") && {alive _x}});

	{
		_m drawIcon [
			_x call BIS_fnc_iconType,
			_x call BIS_fnc_iconColor,
			_x call BIS_fnc_getPos,
			_x call BIS_fnc_iconSize,
			_x call BIS_fnc_iconSize,
			_x call BIS_fnc_getDir,
			"Medical container",
			1,
			0.043,
			"PuristaBold",
			"right"
		];
	} forEach (vehicles select {(typeOf _x == "B_Slingload_01_Medevac_F") && {alive _x}});
};
if (_side == east) then {
	{
		_m drawIcon [
			_x call BIS_fnc_iconType,
			_x call BIS_fnc_iconColor,
			_x call BIS_fnc_getPos,
			_x call BIS_fnc_iconSize,
			_x call BIS_fnc_iconSize,
			_x call BIS_fnc_getDir,
			"Spawn truck",
			1,
			0.043,
			"PuristaBold",
			"right"
		];
	} forEach (vehicles select {(typeOf _x == "O_Truck_03_medical_F") && {alive _x}});

	{
		_m drawIcon [
			_x call BIS_fnc_iconType,
			_x call BIS_fnc_iconColor,
			_x call BIS_fnc_getPos,
			_x call BIS_fnc_iconSize,
			_x call BIS_fnc_iconSize,
			_x call BIS_fnc_getDir,
			"Medical pod",
			1,
			0.043,
			"PuristaBold",
			"right"
		];
	} forEach (vehicles select {(typeOf _x == "Land_Pod_Heli_Transport_04_medevac_F") && {alive _x}});
};