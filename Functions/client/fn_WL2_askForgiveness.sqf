params ["_killer", "_obj"];

[format ["%1: %2", serverTime, "ask forgiveness"]] remoteExec ["systemChat", 0];

if (isNil "WL2_ffBuffer") then {
	WL2_ffBuffer = [];
	0 spawn {
		_busy = false;
		while {!BIS_WL_missionEnd} do {
			waitUntil {sleep 1; (count WL2_ffBuffer > 0) && {!_busy}};
			_busy = true;
			_params = WL2_ffBuffer # 0;
			[format ["%1", WL2_ffBuffer]] remoteExec ["systemChat", 0];
			[format ["%1", _params]] remoteExec ["systemChat", 0];
			_killer = (_params # 0);
			_obj = (_params # 1);
			
			if (isPlayer _obj) then {
				_askForgiveness = [format ["Choose to forgive: %1?", name _killer], "Forgive Friendly Fire", "Forgive", "Don't forgive"] call BIS_fnc_guiMessage;
				[format ["%1: %2", serverTime, "forgiveness asked, player"]] remoteExec ["systemChat", 0];
				if (_askForgiveness) then {
					[_killer, player, true] remoteExec ["BIS_fnc_WL2_forgiveTeamkill", 2];
					[format ["%1: %2", serverTime, "forgiven"]] remoteExec ["systemChat", 0];
				} else {
					[_killer, player, false] remoteExec ["BIS_fnc_WL2_forgiveTeamkill", 2];
					[format ["%1: %2", serverTime, "!forgiven"]] remoteExec ["systemChat", 0];
				};
				WL2_ffBuffer deleteAt 0;
				_busy = false;
			} else {
				_text = getText (configFile >> 'CfgVehicles' >> (typeOf _obj) >> 'displayName');
				_askForgiveness = [format ["Choose to forgive %1 for killing: %2?", name _killer, _text], "Forgive Friendly Fire", "Forgive", "Don't forgive"] call BIS_fnc_guiMessage;
				[format ["%1: %2", serverTime, "forgiveness asked, !player"]] remoteExec ["systemChat", 0];
				if (_askForgiveness) then {
					[_killer, player, true] remoteExec ["BIS_fnc_WL2_forgiveTeamkill", 2];
					[format ["%1: %2", serverTime, "forgiven"]] remoteExec ["systemChat", 0];
				} else {
					[_killer, player, false] remoteExec ["BIS_fnc_WL2_forgiveTeamkill", 2];
					[format ["%1: %2", serverTime, "!forgiven"]] remoteExec ["systemChat", 0];
				};
				WL2_ffBuffer deleteAt 0;
				_busy = false;
			};
		};
	};
};

WL2_ffBuffer pushBack [_killer, _obj];