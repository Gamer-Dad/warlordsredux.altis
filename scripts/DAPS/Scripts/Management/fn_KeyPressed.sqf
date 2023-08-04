private["_v"];
_v = vehicle player;
if ( _v == player) exitWith{};

_disabled = ((_v getVariable ["apsDisabled", false]) || {(typeOf _v in dapsDazzler && {!isEngineOn _v})});

if (_disabled) then {
	playSoundUI ["a3\ui_f_curator\data\sound\cfgsound\visionmode.wss", 1, 1];
	if (typeOf _v in dapsDazzler) then {
		_v engineOn true;
	};
};

_v setVariable ["apsDisabled", !_disabled, true];