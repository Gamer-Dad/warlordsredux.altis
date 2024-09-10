params ["_m"];

if (
	(!('MinimapDisplay' in ((infoPanel 'left') + (infoPanel 'right')))) ||
	{(visibleMap)}
) exitWith {};

_side = BIS_WL_playerSide;
_sideN = [east, west] find _side;
{
	private _revealTrigger = _x getVariable "BIS_WL_revealTrigger";
	{
		if (!isNull _x) then {
			_size = call BIS_fnc_iconSize;
			_m drawIcon [
				call BIS_fnc_iconType,
				if (side group _x == Independent) then {[0,0.6,0,0.9]} else {if (side group _x == west) then {[0,0.3,0.6,0.9]} else {[0.5,0,0,0.9]}},
				call BIS_fnc_getPos,
				_size,
				_size,
				call BIS_fnc_getDir,
				"",
				1,
				0.025,
				"PuristaBold",
				"right"
			];
		};
	} forEach (((list _revealTrigger) - (missionNamespace getVariable [format ["BIS_WL_ownedVehicles_%1", getPlayerUID player], []])) select {(side group _x != _side) && {(alive _x) && {((side group _x) in BIS_WL_sidesArray)}}});
} forEach BIS_WL_currentlyScannedSectors;
{
	_m drawIcon [
		"\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa",
		[1, 0, 0, 0.8],
		call BIS_fnc_getPos,
		20,
		20,
		0,
		format ["%1 [K.I.A.]", (name _x)],
		1,
		0.025,
		"PuristaBold",
		"right"
	];
} forEach ((allPlayers) select {(!alive _x) && {(side group _x == _side) && {(isNull objectParent _x)}}});
{
	_size = call BIS_fnc_iconSize;
	_m drawIcon [
		call BIS_fnc_iconType,
		call BIS_fnc_iconColor,
		call BIS_fnc_getPos,
		_size,
		_size,
		call BIS_fnc_getDir,
		(name _x),
		1,
		0.025,
		"PuristaBold",
		"right"
	];
} forEach ((allPlayers) select {(side group _x == _side) && {(isNull objectParent _x) && {(alive _x) && {_x != player}}}});
{
	_size = call BIS_fnc_iconSize;
	if (!isNull _x) then {
		_m drawIcon [
			call BIS_fnc_iconType,
			call BIS_fnc_iconColor,
			call BIS_fnc_getPos,
			_size,
			_size,
			call BIS_fnc_getDir,
			format ["%1 [AI]", (name _x)],
			1,
			0.025,
			"PuristaBold",
			"right"
		];
	};
} forEach ((allUnits) select {(side group (crew _x select 0) == _side) && {(alive _x) && {(isNull objectParent _x) && {(typeOf _x != "Logic") && {!(isPlayer _x)}}}}});
{
	_size = call BIS_fnc_iconSize;
	_m drawIcon [
		call BIS_fnc_iconType,
		call BIS_fnc_iconColor,
		call BIS_fnc_getPos,
		_size,
		_size,
		call BIS_fnc_getDir,
		if (isPlayer _x) then {name _x} else {format ["%1 [AI]", (name _x)]},
		1,
		0.025,
		"PuristaBold",
		"right"
	];
} forEach ((units player) select {(alive _x) && {(isNull objectParent _x) && {_x != player}}});

private _teamVariable = if (_sideN == 0) then {
	"BIS_WL_eastOwnedVehicles"
} else {
	"BIS_WL_westOwnedVehicles"
};
private _sideVehicles = missionNamespace getVariable [_teamVariable, []];
private _vehiclesOnSide = vehicles select { count crew _x > 0 && side _x == _side };
_sideVehicles = _sideVehicles + _vehiclesOnSide;
_sideVehicles = _sideVehicles arrayIntersect _sideVehicles;
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
} forEach (_sideVehicles select { alive _x });