_magazineTypes = [
	"1Rnd_SmokeRed_Grenade_shell",
	"1Rnd_SmokeGreen_Grenade_shell",
	"1Rnd_SmokeBlue_Grenade_shell",
	"1Rnd_SmokeOrange_Grenade_shell",
	"1Rnd_SmokeYellow_Grenade_shell",
	"SmokeShellOrange",
	"SmokeShellYellow",
	"FirstAidKit"
];	
_itemTypes = [
	"FirstAidKit"
];	

if (side player == west) then {
	player linkItem "B_UavTerminal";
	{player removeItem _x} forEach _itemTypes;
	{player removeMagazine _x} forEach _magazineTypes;
	{player removeMagazine "1Rnd_Smoke_Grenade_shell"} forEach magazines player;
	{player removeMagazine "Chemlight_green"} forEach magazines player;
	{player removeMagazine "SmokeShellGreen"} forEach magazines player;

} else {
	player linkItem "O_UavTerminal";
	{player removeItem _x} forEach _itemTypes;
	{player removeMagazine _x} forEach _magazineTypes;
	{player removeMagazine "1Rnd_Smoke_Grenade_shell"} forEach magazines player;
	{player removeMagazine "Chemlight_red"} forEach magazines player;
	{player removeMagazine "SmokeShellGreen"} forEach magazines player;
};
player linkItem"Integrated_NVG_TI_0_F";
player addPrimaryWeaponItem "muzzle_snds_H";
player addMagazines ["SmokeShellGreen", 1];
player addItem ["FirstAidKit", 3];