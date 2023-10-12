#include "..\warlords_constants.inc"

waitUntil {!isNull (findDisplay 46)};
sleep 2;

(findDisplay 46) displayAddEventHandler ["KeyUp", {
	_key = _this # 1;
	if (_key in actionKeys "Gear") then {
		BIS_WL_gearKeyPressed = FALSE;
	};
}];
