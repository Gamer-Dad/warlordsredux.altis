_uniform = uniform player;
_weapons = weapons player;

"RequestMenu_close" call BIS_fnc_WL2_setupUI;

if (isNull (findDisplay 602)) then {
	["Open", true] spawn BIS_fnc_arsenal;
	_uniform spawn {
		waitUntil {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])};
		_side = str BIS_WL_playerSide;
		while {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])} do {
			if !((hmd player == "Integrated_NVG_TI_0_F")) then {
				player linkItem"Integrated_NVG_TI_0_F";
			};
			if !((backpack player) in (getArray (missionConfigFile >> "arsenalConfig" >> _side >> "Backpacks"))) then {
				removeBackpack player;
			};
			if !(uniform player in (getArray (missionConfigFile >> "arsenalConfig" >> _side >> "Uniforms"))) then {
				player forceAddUniform _this;
			};
			if !(vest player in (getArray (missionConfigFile >> "arsenalConfig" >> _side >> "Vests"))) then {
				removeVest player;
				if (side player == west) then {
				player addVest "V_PlateCarrierGL_rgr";
				} else {
				player addVest "V_HarnessOGL_brn";
				}
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
			sleep 0.1;
		};
	};
	_weapons spawn{
		waitUntil {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])};
		_side = str BIS_WL_playerSide;
		while {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])} do {
			if (primaryWeapon player in (getArray (missionConfigFile >> "arsenalConfig" >> _side >> "riflesBlacklist"))) then {
				if (side player == west) then {
					player addWeapon "arifle_MX_GL_F";
					player addPrimaryWeaponItem "acc_pointer_IR";
					player addPrimaryWeaponItem "optic_Hamr";
					player addPrimaryWeaponItem "30Rnd_65x39_caseless_mag";
					for "_i" from 1 to 3 do {player addItem "30Rnd_65x39_caseless_mag";};
					for "_i" from 1 to 2 do {player addItem "30Rnd_65x39_caseless_green_mag_Tracer";};
					player addPrimaryWeaponItem "3Rnd_HE_Grenade_shell";
					for "_i" from 1 to 3 do {player addItem "3Rnd_HE_Grenade_shell";};
					for "_i" from 1 to 2 do {player addItem "1Rnd_HE_Grenade_shell";};
					player addPrimaryWeaponItem "muzzle_snds_H";
				} else {
					player addWeapon "arifle_Katiba_GL_F";
					player addPrimaryWeaponItem "acc_pointer_IR";
					player addPrimaryWeaponItem "optic_Arco_blk_F";
					player addPrimaryWeaponItem "30Rnd_65x39_caseless_green";
					for "_i" from 1 to 3 do {player addItem "30Rnd_65x39_caseless_green";};
					for "_i" from 1 to 2 do {player addItem "30Rnd_65x39_caseless_green_mag_Tracer";};
					player addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
					for "_i" from 1 to 10 do {player addItem "1Rnd_HE_Grenade_shell";};
					player addPrimaryWeaponItem "muzzle_snds_H";
				};
			};
			if (secondaryWeapon player in (getArray (missionConfigFile >> "arsenalConfig" >> _side >> "launchersBlacklist"))) then {
					player addWeapon "launch_NLAW_F";
					player addSecondaryWeaponItem "NLAW_F";
					for "_i" from 1 to 3 do {player addItem "NLAW_F";};
				};
			if !(isNull (findDisplay 602)) then {
				(findDisplay 602) closeDisplay 1;
			};
			sleep 0.1;
		};
	};
};