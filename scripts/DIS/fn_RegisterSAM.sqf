params ["_sam"];

_sam addEventHandler["fired", {
	_this spawn DIS_fnc_SAMFired;
}];