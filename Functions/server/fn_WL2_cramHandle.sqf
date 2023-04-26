#include "..\warlords_constants.inc"

params ["_v"];

while {alive _v} do {
	if (_v getVariable "cramActivated") then {
		if ((count (_v getVariable "incomming") > 0)) then {
			_target = (_v getVariable "incomming") select 0;
			while {(alive _target) && (!isNull _target)} do {
				_v doWatch (getPosATLVisual _target);
				waitUntil {((_v distance _target) < (4500)) && ((_v distance _target) > (150))};
				_rounds = floor random 170;
				while {(_rounds > 0) && (alive _target) && (!isNull _target)} do {
					_v fireAtTarget [_target, (currentWeapon _v)];
					_rounds = _rounds - 1;
					sleep .02;
					_v doWatch (getPosATLVisual _target);
				};

				if (alive _target) then {
					sleep ((_v distance _target) / 1440); //To get the time right of when the bullets reach the _target
					triggerAmmo _target;
					sleep 0.01;
				};
			};
			_v doWatch objNull;

			_inc = (_v getVariable "incomming");
			{
				_inc deleteAt (_inc find _target);
				_v setVariable ["incomming", _inc, true];
			} forEach _inc select {(isNull _x)};
		};
	};
	sleep 1;
};