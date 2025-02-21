// APS Type in config file:
// 0 = Light APS
// 1 = Medium APS
// 2 = Heavy APS
// 3 = Dazzler

// APS projectile block lists (heavy contains everything medium, medium contains everything light)

class WLProjectile {
    ammo[] = {};
    aps = 3;
    camera = 0;
    consumption = 0;
    dazzleable = 0;
    sam = 0;
    sead = 0;
};

class WLProjectilesConfig {
    class WLProjectiles_SDB: WLProjectile {
        ammo[] = {
            "ammo_Bomb_SDB"                     // SDB
        };
        aps = 3;
        camera = 1;
        dazzleable = 1;
    };

    class WLProjectile_SAM: WLProjectile {
        ammo[] = {
            "ammo_Missile_rim116",              // Spartan
            "ammo_Missile_rim162",              // Centurion
            "ammo_Missile_s750",                // Rhea
            "ammo_Missile_mim145",              // Defender
            "M_70mm_SAAMI",                     // SAAMI
            "M_Zephyr"                          // Zephyr
        };
        aps = 3;
        camera = 1;
        sam = 1;
    };

    class WLProjectile_SEAD: WLProjectile {
        ammo[] = {
            "ammo_Missile_HARM",                // AGM-88 HARM
            "ammo_Missile_KH58"                 // Kh-58
        };
        aps = 1;
        camera = 1;
        consumption = 3;
        dazzleable = 1;
        sead = 1;
    };

    class WLProjectile_MediumGuided: WLProjectile {
        ammo[] = {
            "M_Titan_AT_long",                  // Titan AT (Vehicle)

            "M_PG_AT",                          // DAGR
            "M_Scalpel_AT",                     // Scalpel
            "M_Scalpel_AT_hidden",              // Scalpel

            "M_NLAW_AT_F",                      // NLAW
            "M_Titan_AP",                       // Titan AP
            "M_Titan_AT",                       // Titan AT
            "M_Titan_AT_static",                // Titan AT (Static)
            "M_Vorona_HE",                      // Vorona HE
            "M_Vorona_HEAT"                     // Vorona HEAT
        };
        aps = 1;
        consumption = 1;
        dazzleable = 1;
    };

    class WLProjectile_MediumGuidedCamera: WLProjectile {
        ammo[] = {
            "M_120mm_cannon_ATGM",              // 120mm Cannon ATGM
            "M_120mm_cannon_ATGM_LG",           // 120mm Cannon ATGM (Laser Guided)
            "M_125mm_cannon_ATGM"               // 125mm Cannon ATGM
        };
        aps = 1;
        camera = 1;
        consumption = 1;
        dazzleable = 1;
    };

    class WLProjectile_DoubleGuided: WLProjectile {
        ammo[] = {
            "M_127mm_Firefist_AT",              // Firefist AT

            "M_Jian_AT",                        // Jian - Max loadout: 4
            "Missile_AGM_02_F"                  // Macer I && II (same mag) - Max loadout: 20
        };
        aps = 1;
        consumption = 2;
        dazzleable = 1;
    };

    class WLProjectile_TripleGuided: WLProjectile {
        ammo[] = {
            "Missile_AGM_01_F"                 // Sharur && KH25 - Max loadout: 8
        };
        aps = 1;
        consumption = 3;
        dazzleable = 1;
    };

    class WLProjectile_LightUnguided: WLProjectile {
        ammo[] = {
            "R_MRAAWS_HE_F",                    // MAAWS HE
            "R_MRAAWS_HEAT_F",                  // MAAWS HEAT
            "R_MRAAWS_HEAT55_F",                // MAAWS HEAT55
            "R_PG32V_F",                        // RPG-42 AT
            "R_PG7_F",                          // RPG-7 HEAT
            "R_TBG32V_F"                        // RPG-42 HE
        };
        aps = 0;
        consumption = 1;
        dazzleable = 0;
    };

    class WLProjectile_MediumUnguided: WLProjectile {
        ammo[] = {
            "M_SPG9_HE",                        // SPG-9 HE
            "M_SPG9_HEAT",                      // SPG-9 HEAT

            "M_AT",                             // DAR
            "R_80mm_HE",                        // Skyfire
            "Rocket_03_AP_F",                   // Tratnyr AP
            "Rocket_03_HE_F",                   // Tratnyr HE
            "Rocket_04_AP_F",                   // Shrieker AP
            "Rocket_04_HE_F"                    // Shrieker HE
        };
        aps = 1;
        consumption = 1;
        dazzleable = 0;
    };
};