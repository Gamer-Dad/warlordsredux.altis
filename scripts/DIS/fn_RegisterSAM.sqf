params ["_sam"];

_sam addEventHandler ["fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	[_this] remoteExec ["DIS_fnc_SAMFired", (owner _projectile)];
}];