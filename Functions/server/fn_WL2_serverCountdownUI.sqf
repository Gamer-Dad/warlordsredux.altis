#include "..\warlords_constants.inc"

_xDef = safezoneX;
_yDef = safezoneY;
_wDef = safezoneW;
_hDef = safezoneH;


_myTimerDisplay = MRTM_TIMER_DISPLAY createDisplay "RscDisplayEmpty";

_timer = _myTimerDisplay ctrlCreate ["RscStructuredText", -1];

_timer ctrlSetPosition [_xDef, _yDef, _wDef, _hDef];

_timer ctrlSetBackgroundColor [100, 0, 0, 1];

_timer ctrlSetStructuredText parseText "timer";

