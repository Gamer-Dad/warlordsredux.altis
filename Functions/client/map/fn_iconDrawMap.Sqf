params ["_m"];

_side = BIS_WL_playerSide;
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
	private _revealTrigger = _x getVariable "BIS_WL_revealTrigger";
	{
		if (!isNull _x) then {
			_size = call BIS_fnc_iconSize;
			_m drawIcon [
				call BIS_fnc_iconType,
				if (side group _x == Independent) then {[0,0.6,0,0.9]} else {(if (side group _x == west) then {[0,0.3,0.6,0.9]} else {[0.5,0,0,0.9]})},
				call BIS_fnc_getPos,
				_size,
				_size,
				call BIS_fnc_getDir,
				call BIS_fnc_iconTextSectorScan,
				1,
				0.043,
				"PuristaBold",
				"right"
			];
		};
	} forEach (((list _revealTrigger) - (missionNamespace getVariable [format ["BIS_WL_ownedVehicles_%1", getPlayerUID player], []])) select {(side group _x != _side) && {(alive _x) && {((side group _x) in BIS_WL_sidesArray)}}});
} forEach BIS_WL_currentlyScannedSectors;

_control = (findDisplay 12) displayCtrl 51;
_draw = (ctrlMapScale _control) < 0.3;
{
	_m drawIcon [
		"\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa",
		[1, 0, 0, 0.8],
		call BIS_fnc_getPos,
		20,
		20,
		0,
		if (_draw) then {format ["%1 [K.I.A.]", (name _x)]} else {""},
		1,
		0.043,
		"PuristaBold",
		"right"
	];
} forEach (allPlayers select {(!alive _x) && {(side group _x == _side)}});
{
	_size = call BIS_fnc_iconSize;
	if (_x == player) then {
		_m drawIcon [
			'a3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa',
			[1,0,0,1],
			call BIS_fnc_getPos,
			_size,
			_size,
			0,
			"",
			1,
			0.043,
			"PuristaBold",
			"right"
		];
	};
	_m drawIcon [
		call BIS_fnc_iconType,
		call BIS_fnc_iconColor,
		call BIS_fnc_getPos,
		_size,
		_size,
		call BIS_fnc_getDir,
		if (_draw) then {name _x} else {""},
		1,
		0.043,
		"PuristaBold",
		"right"
	];
} forEach (allPlayers select {(side group _x == _side) && {(isNull objectParent _x) && {(alive _x)}}});
{
	_size = call BIS_fnc_iconSize;
	_m drawIcon [
		call BIS_fnc_iconType,
		call BIS_fnc_iconColor,
		call BIS_fnc_getPos,
		_size,
		_size,
		call BIS_fnc_getDir,
		if (_draw) then {format ["%1 [AI]", (name _x)]} else {""},
		1,
		0.043,
		"PuristaBold",
		"right"
	];
} forEach ((allUnits) select {(side group (crew _x select 0) == _side) && {(alive _x) && {(isNull objectParent _x) && {typeOf _x != "Logic" && {!(isPlayer _x)}}}}});
{
	_size = call BIS_fnc_iconSize;
	_m drawIcon [
		call BIS_fnc_iconType,
		call BIS_fnc_iconColor,
		call BIS_fnc_getPos,
		_size,
		_size,
		call BIS_fnc_getDir,
		if (_draw) then {if (isPlayer _x) then {name _x} else {format ["%1 [AI]", (name _x)]}} else {""},
		1,
		0.043,
		"PuristaBold",
		"right"
	];
} forEach ((units player) select {(alive _x) && {(isNull objectParent _x) && {_x != player}}});
{
	_size = call BIS_fnc_iconSize;
	_m drawIcon [
		call BIS_fnc_iconType,
		call BIS_fnc_iconColor,
		call BIS_fnc_getPos,
		_size,
		_size,
		call BIS_fnc_getDir,
		_x call BIS_fnc_iconText,
		1,
		0.043,
		"PuristaBold",
		"right"
	];
} forEach ((entities [["LandVehicle", "Air", "Ship"], ["Logic"], false, true]) select {alive _x && {([((getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "side")) == _sideN), (side group ((crew _x) # 0) == _side)] select (count (crew _x) > 0)) && {!((typeOf _x) in ["B_Truck_01_medical_F", "O_Truck_03_medical_F", "O_T_Truck_03_device_ghex_F", "O_Truck_03_device_F"])}}});
{
	_size = call BIS_fnc_iconSize;
	_m drawIcon [
		call BIS_fnc_iconType,
		call BIS_fnc_iconColor,
		call BIS_fnc_getPos,
		_size,
		_size,
		call BIS_fnc_getDir,
		_x call BIS_fnc_iconText,
		1,
		0.043,
		"PuristaBold",
		"right"
	];
} forEach ((missionNamespace getVariable [format ["BIS_WL_ownedVehicles_%1", getPlayerUID player], []]) select {(alive _x) && {(typeOf _x != "B_Truck_01_medical_F") && {(typeOf _x != "O_Truck_03_medical_F") && {(typeOf _x != "B_Slingload_01_Medevac_F") && {(typeOf _x != "Land_Pod_Heli_Transport_04_medevac_F")}}}}});
if (_side == west) then {
	{
		_size = call BIS_fnc_iconSize;
		_m drawIcon [
			call BIS_fnc_iconType,
			call BIS_fnc_iconColor,
			call BIS_fnc_getPos,
			_size,
			_size,
			call BIS_fnc_getDir,
			"Spawn truck",
			1,
			0.043,
			"PuristaBold",
			"right"
		];
	} forEach (vehicles select {(typeOf _x == "B_Truck_01_medical_F") && {alive _x}});

	{
		_size = call BIS_fnc_iconSize;
		_m drawIcon [
			call BIS_fnc_iconType,
			call BIS_fnc_iconColor,
			call BIS_fnc_getPos,
			_size,
			_size,
			call BIS_fnc_getDir,
			"Medical container",
			1,
			0.043,
			"PuristaBold",
			"right"
		];
	} forEach (vehicles select {(typeOf _x == "B_Slingload_01_Medevac_F") && {alive _x}});
} else {
	{
		_size = call BIS_fnc_iconSize;
		_m drawIcon [
			call BIS_fnc_iconType,
			call BIS_fnc_iconColor,
			call BIS_fnc_getPos,
			_size,
			_size,
			call BIS_fnc_getDir,
			"Spawn truck",
			1,
			0.043,
			"PuristaBold",
			"right"
		];
	} forEach (vehicles select {(typeOf _x == "O_Truck_03_medical_F") && {alive _x}});

	{
		_size = call BIS_fnc_iconSize;
		_m drawIcon [
			call BIS_fnc_iconType,
			call BIS_fnc_iconColor,
			call BIS_fnc_getPos,
			_size,
			_size,
			call BIS_fnc_getDir,
			"Medical pod",
			1,
			0.043,
			"PuristaBold",
			"right"
		];
	} forEach (vehicles select {(typeOf _x == "Land_Pod_Heli_Transport_04_medevac_F") && {alive _x}});	
};