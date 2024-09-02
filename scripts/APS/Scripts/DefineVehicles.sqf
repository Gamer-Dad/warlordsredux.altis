// APS projectile block lists (heavy contains everything medium, medium contains everything light)
// value = [APS Type (0-2, 3), APS ammo consumption]
// APS Type:
// 0 = Light APS
// 1 = Medium APS
// 2 = Heavy APS
// 3 = Dazzler

_heavyBlockList = [];				    // For now, heavy doesn't block anything extra

_mediumBlockList = [
    // Tank ATGM
    ["M_120mm_cannon_ATGM", 1],			// 120mm Cannon ATGM
    ["M_120mm_cannon_ATGM_LG", 1],		// 120mm Cannon ATGM (Laser Guided)
    ["M_125mm_cannon_ATGM", 1],			// 125mm Cannon ATGM

    // Ground Vehicle AT
    ["M_127mm_Firefist_AT",	2],		    // Nyx Firefist AT - Max loadout: 6
    ["M_Titan_AT_long",	1],			    // Titan AT (Vehicle)
    ["M_SPG9_HE", 1],				    // SPG-9 HE
    ["M_SPG9_HEAT",	1],				    // SPG-9 HEAT

    // Air Vehicle SEAD
    ["ammo_Missile_HARM", 3],		    // AGM-88 HARM - Max loadout: 2
    ["ammo_Missile_KH58", 2],		    // KH-58 ARM - Max loadout: 3

    // Air Vehicle Guided
    ["M_AT", 1],						// DAR
    ["M_Jian_AT", 2],				    // Jian - Max loadout: 4
    ["M_PG_AT", 1],					    // DAGR
    ["M_Scalpel_AT", 1],				// Scalpel
    ["M_Scalpel_AT_hidden",	1],		    // Scalpel (x2)
    ["Missile_AGM_01_F", 3],			// Sharur && KH25 - Max loadout: 8
    ["Missile_AGM_02_F", 2],			// Macer I && II (same mag) - Max loadout: 20

    // Air Vehicle Unguided
    ["R_80mm_HE", 1],					// Skyfire
    ["Rocket_03_AP_F", 1],				// Tratnyr AP
    ["Rocket_03_HE_F", 1],				// Tratnyr HE
    ["Rocket_04_AP_F", 1],				// Shrieker AP
    ["Rocket_04_HE_F", 1],				// Shrieker HE

    // Infantry
    ["M_NLAW_AT_F",	1],				    // PCML
    ["M_Titan_AP", 1],				    // Titan AP
    ["M_Titan_AT", 1],					// Titan AT
    ["M_Titan_AT_static", 1],			// Titan AT (Static)
    ["M_Vorona_HE", 1],					// Vorona HE
    ["M_Vorona_HEAT", 1]				// Vorona HEAT
];

_lightBlockList = [
    ["R_MRAAWS_HE_F", 1],				// MAAWS HE
    ["R_MRAAWS_HEAT_F", 1],				// MAAWS HEAT
    ["R_MRAAWS_HEAT55_F", 1],			// MAAWS HEAT55
    ["R_PG32V_F", 1],					// RPG-42 AT
    ["R_PG7_F", 1],						// RPG-7 HEAT
    ["R_TBG32V_F", 1]					// RPG-42 HE
];

apsEligibleProjectiles = createHashMap;
{
    apsEligibleProjectiles set [_x # 0, [2, _x # 1]];
} forEach _heavyBlockList;
{
    apsEligibleProjectiles set [_x # 0, [1, _x # 1]];
} forEach _mediumBlockList;
{
    apsEligibleProjectiles set [_x # 0, [0, _x # 1]];
} forEach _lightBlockList;