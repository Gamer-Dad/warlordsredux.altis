_uniform = uniform player;

"RequestMenu_close" call BIS_fnc_WL2_setupUI;

if (isNull (findDisplay 602)) then {
	["Open", true] spawn BIS_fnc_arsenal;

	_uniform spawn {
		waitUntil {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])};
		_side = str BIS_WL_playerSide;
		while {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])} do {
			if !((backpack player) in (getArray (missionConfigFile >> "arsenalConfig" >> _side >> "Backpacks"))) then {
				removeBackpack player;
			};
			if !(uniform player in (getArray (missionConfigFile >> "arsenalConfig" >> _side >> "Uniforms"))) then {
				player forceAddUniform _this;
			};
			if !(vest player in (getArray (missionConfigFile >> "arsenalConfig" >> _side >> "Vests"))) then {
				removeVest player;
			};
			if !(headgear player in (getArray (missionConfigFile >> "arsenalConfig" >> _side >> "Helmets"))) then {
				if (side player == west) then {
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