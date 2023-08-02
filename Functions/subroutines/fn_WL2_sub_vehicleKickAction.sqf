params ["_asset"];

_asset addAction [
	"Kick players",
	{
		_this params ["_asset", "_caller", "_actionID"];
		{
			moveOut _x;
		} forEach ((crew _asset) select {(_x != player) && {player != ((_x getVariable ['BIS_WL_ownerAsset', '123']) call BIS_fnc_getUnitByUID)}});
	},
	[],
	5,
	false,
	true,
	"",
	"(alive _target && {_this == ((_target getVariable ['BIS_WL_ownerAsset', '123']) call BIS_fnc_getUnitByUID) && {(count ((crew _target) select {player != ((_x getVariable ['BIS_WL_ownerAsset', '123']) call BIS_fnc_getUnitByUID)}) > 0) && {(!(isAutonomous _target))}}})",
	50,
	true
];