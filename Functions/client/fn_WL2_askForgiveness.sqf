params ["_killer", "_obj"];

if (isNil "WL2_ffBuffer") then {
	WL2_ffBuffer = [];
	0 spawn {
		while {!BIS_WL_missionEnd} do {
			waitUntil {sleep 1; count WL2_ffBuffer > 0; !(missionNamespace getVariable ["WL2_ffBuffer_busy", false])};
			missionNamespace setVariable ["WL2_ffBuffer_busy", true];
			_params = WL2_ffBuffer # 0;
			_killer = (_params # 0);
			_obj = (_params # 1);
			
			if (isPlayer _obj) then {
				_askForgivenessResult = [format ["Choose to forgive: %1?", name _killer], "Forgive Friendly Fire", "Forgive", "Don't forgive"] call BIS_fnc_guiMessage;
				if (_askForgivenessResult) then {
					[_killer, player] remoteExec ["BIS_fnc_WL2_forgiveTeamkill", 2];
				};
				missionNamespace setVariable ["WL2_ffBuffer_busy", false];
				WL2_ffBuffer deleteAt 0;
			} else {
				_text = getText (configFile >> 'CfgVehicles' >> (typeOf _obj) >> 'displayName');
				_askForgivenessResult = [format ["Choose to forgive %1 for killing: %2?", name _killer, _text], "Forgive Friendly Fire", "Forgive", "Don't forgive"] call BIS_fnc_guiMessage;
				if (_askForgivenessResult) then {
					[_killer, player] remoteExec ["BIS_fnc_WL2_forgiveTeamkill", 2];
				};
				missionNamespace setVariable ["WL2_ffBuffer_busy", false];
				WL2_ffBuffer deleteAt 0;
			};
		};
	};
};

WL2_ffBuffer pushBack [_killer, _obj];