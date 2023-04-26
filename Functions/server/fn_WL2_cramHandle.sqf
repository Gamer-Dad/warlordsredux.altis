#include "..\warlords_constants.inc"

params ["_v"];

while {alive _v} do {
	if (_v getVariable "cramActivated") then {
		[format ["%1", _v getVariable "incomming"]] remoteExec ["hint", 0];
		if ((count (_v getVariable "incomming") > 0)) then {
			_target = (_v getVariable "incomming") select 0;
			_dirFromTarget = _target getDir _v;
			_dirTarget = direction _target;
			while {(alive _target) && (!isNull _target)} do {
				playSound3D ["air_raid", _v, true, [0,0,0], 5, 1, 100];
				_v doWatch (getPosASLVisual _target);
				waitUntil {((_v distance _target) < (4000))};
				_rounds = floor random 170;
				while {_rounds > 0 && alive _target} do {
					_v fireAtTarget [_target, (currentWeapon _v)];
					_rounds = _rounds - 1;
					sleep .02;
					_v doWatch (getPosASLVisual _target);
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