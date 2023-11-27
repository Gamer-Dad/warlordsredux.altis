_uniform = uniform player;

"RequestMenu_close" call BIS_fnc_WL2_setupUI;

if (isNull (findDisplay 602)) then {
	["Open", true] spawn BIS_fnc_arsenal;

	_uniform spawn {
		waitUntil {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])};
		while {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])} do {
			if !((backpack player) in (getArray (missionConfigFile >> "arsenalConfig" >> str playerSide >> "Backpacks"))) then {
				removeBackpack player;
			};
			if !(uniform player in (getArray (missionConfigFile >> "arsenalConfig" >> str playerSide >> "Uniforms"))) then {
				player forceAddUniform _this;
			};
			if !(vest player in (getArray (missionConfigFile >> "arsenalConfig" >> str playerSide >> "Vests"))) then {
				removeVest player;
			};
			if !(headgear player in (getArray (missionConfigFile >> "arsenalConfig" >> str playerSide >> "Helmets"))) then {
				if (playerSide == west) then {
					player addHeadgear "H_HelmetB";
				} else {
					player addHeadgear "H_HelmetO_ocamo";
				};
			};
			if !(isNull (findDisplay 602)) then {
				(findDisplay 602) closeDisplay 1;
			};
			sleep 0.01;
		};
	};
};