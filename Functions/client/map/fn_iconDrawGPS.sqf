params ["_m"];

if (
	(!('MinimapDisplay' in ((infoPanel 'left') + (infoPanel 'right')))) ||
	{(visibleMap)}
) exitWith {};

_side = side group player;
_sideN = [east, west] find _side;
{
	_m drawIcon [
		"\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa",
		[1, 0, 0, 0.8],
		_x call BIS_fnc_getPos,
		20,
		20,
		0,
		[_x, true] call BIS_fnc_iconText,
		1,
		0.025,
		"PuristaBold",
		"right"
	];
} forEach ((allPlayers) select {(!alive _x) && {(side group _x == side group player) && {(isNull objectParent _x)}}});
{
	_m drawIcon [
		_x call BIS_fnc_iconType,
		_x call BIS_fnc_iconColor,
		_x call BIS_fnc_getPos,
		_x call BIS_fnc_iconSize,
		_x call BIS_fnc_iconSize,
		_x call BIS_fnc_getDir,
		[_x, true] call BIS_fnc_iconText,
		1,
		0.025,
		"PuristaBold",
		"right"
	];
} forEach ((allPlayers) select {(side group _x == side group player) && {(isNull objectParent _x) && {(alive _x) && {_x != player}}}});
{
	if (!isNull _x) then {
		_m drawIcon [
			_x call BIS_fnc_iconType,
			_x call BIS_fnc_iconColor,
			_x call BIS_fnc_getPos,
			_x call BIS_fnc_iconSize,
			_x call BIS_fnc_iconSize,
			_x call BIS_fnc_getDir,
			[_x, true] call BIS_fnc_iconText,
			1,
			0.025,
			"PuristaBold",
			"right"
		];
	};
} forEach ((allUnits) select {(side group (crew _x select 0) == side group player) && {(alive _x) && {(isNull objectParent _x) && {(typeOf _x != "Logic") && {_x != player}}}}});
{
	_m drawIcon [
		_x call BIS_fnc_iconType,
		_x call BIS_fnc_iconColor,
		_x call BIS_fnc_getPos,
		_x call BIS_fnc_iconSize,
		_x call BIS_fnc_iconSize,
		_x call BIS_fnc_getDir,
		[_x, true] call BIS_fnc_iconText,
		1,
		0.025,
		"PuristaBold",
		"right"
	];		
} forEach ((units player) select {(alive _x) && {(isNull objectParent _x) && {_x != player}}});	
{
	private _revealTrigger = _x getVariable "BIS_WL_revealTrigger";
	{
		if (!isNull _x) then {
			_m drawIcon [
				_x call BIS_fnc_iconType,
				if (side group _x == Independent) then {[0,0.6,0,0.9]} else {if (side group _x == west) then {[0,0.3,0.6,0.9]} else {[0.5,0,0,0.9]}},
				_x call BIS_fnc_getPos,
				_x call BIS_fnc_iconSize,
				_x call BIS_fnc_iconSize,
				_x call BIS_fnc_getDir,
				"",
				1,
				0.025,
				"PuristaBold",
				"right"
			];
		};
	} forEach (((list _revealTrigger) - (missionNamespace getVariable [format ["BIS_WL_%1_ownedVehicles", getPlayerUID player], []])) select {(side group _x != side group player) && {(alive _x) && {((side group _x) in BIS_WL_sidesArray)}}});
} forEach BIS_WL_currentlyScannedSectors;
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
			0.025,
			"PuristaBold",
			"right"
		];
	};
} forEach ((entities [["LandVehicle", "Air", "Ship"], ["Logic"], false, true]) select {alive _x && {([((getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "side")) == _sideN), (side group ((crew _x) # 0) == _side)] select (count (crew _x) > 0)) && {(typeOf _x != "B_Truck_01_medical_F") && {(typeOf _x != "O_Truck_03_medical_F")}}}});