params ["_time"];

_time spawn BIS_fnc_WL2_pumpkinTimer;

[localize "STR_A3_collectPumpkins"] spawn BIS_fnc_WL2_smoothText;
playSoundUI ["pumpkinLaugh", 0.3, 1];

_pumpkinArr = [];
while {serverTime < _time} do {
	_spawn = ((floor random 10) >= 3);
	if (_spawn && {vehicle player == player}) then {
		if (count _pumpkinArr >= 10) then {
			_pumpkinArr deleteAt (_pumpkinArr find objNull);
		};
		if !(count _pumpkinArr >= 10) then {
			_pumpkin = createVehicleLocal ["Land_Pumpkin_01_halloween_F", player, [], 40, "NONE"];
			_pumpkin addEventHandler ["Killed", {
				params ["_unit"];
				[(getPlayerUID player), player] remoteExec ["BIS_fnc_WL2_collectReward", 2];

			}];
			_pumpkinArr pushBackUnique _pumpkin;
		};
	};
	sleep 3;
};

{
	_x removeAllEventHandlers "Killed";
	deleteVehicle _x;
} forEach _pumpkinArr select {alive _x};
_pumpkinArr = [];