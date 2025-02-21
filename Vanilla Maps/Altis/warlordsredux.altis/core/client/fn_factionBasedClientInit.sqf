_magazineTypes = [
	"1Rnd_SmokeRed_Grenade_shell",
	"1Rnd_SmokeGreen_Grenade_shell",
	"1Rnd_SmokeBlue_Grenade_shell",
	"1Rnd_SmokeOrange_Grenade_shell",
	"1Rnd_SmokeYellow_Grenade_shell",
	"1Rnd_Smoke_Grenade_shell",
	"SmokeShellOrange",
	"SmokeShellBlue",
	"SmokeShellYellow",
	"SmokeShellGreen",
	"SmokeShell",
	"SmokeShellRed",
	"Chemlight_green",
	"Chemlight_red"
];

{
	player removeMagazines _x;
} forEach _magazineTypes;

switch (side group player) do {
	case west: {
		player linkItem "B_UavTerminal";
		player addMagazineGlobal "Laserbatteries";
		player addWeaponGlobal "Laserdesignator";
	};
	case east: {
		player linkItem "O_UavTerminal";
		player addMagazineGlobal "Laserbatteries";
		player addWeaponGlobal "Laserdesignator_02";
	};
	case independent: {
		player linkItem "I_UavTerminal";
		player addMagazineGlobal "Laserbatteries";
		player addWeaponGlobal "Laserdesignator_03";
	};
};

{
	player removeMagazines _x;
} forEach _magazineTypes;

player linkItem "Integrated_NVG_TI_0_F";
player addPrimaryWeaponItem "muzzle_snds_H";
player addPrimaryWeaponItem "muzzle_snds_M";
player addMagazines ["SmokeShell", 1];