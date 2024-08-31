class Aircraft {
    class O_Heli_Light_02_unarmed_F {
        cost = 500;
        requirements[] = {"H"};
        killReward = 125;
    }; // "PO-30 Orca (Unarmed)"

    class O_Heli_Transport_04_F {
        cost = 500;
        requirements[] = {"H"};
        killReward = 100;
    }; // "Mi-290 Taru"

    class O_Heli_Transport_04_covered_F {
        cost = 400;
        requirements[] = {"H"};
        killReward = 100;
    }; // "Mi-290 Taru (Transport)"

    class O_Heli_Transport_04_medevac_F {
        cost = 500;
        requirements[] = {"H"};
        killReward = 100;
    }; // "Mi-290 Taru (Medical)"

    class O_Heli_Light_02_dynamicLoadout_F {
        cost = 4000;
        requirements[] = {"H"};
        killReward = 300;
    }; // "PO-30 Orca"

    class O_T_UAV_04_CAS_F {
        cost = 6000;
        requirements[] = {"A"};
        rearm = 500;
        killReward = 600;
    }; // "KH-3A Fenghuang"

    class O_Heli_Attack_02_dynamicLoadout_F {
        cost = 10000;
        requirements[] = {"H"};
        rearm = 700;
        killReward = 550;

        allowPylonMagazines[] = {
            "PylonRack_12Rnd_PG_missiles"
        };
    }; // "Mi-48 Kajman"

    class O_UAV_02_dynamicLoadout_F {
        cost = 8000;
        requirements[] = {"A"};
        rearm = 330;
        killReward = 600;

        allowPylonMagazines[] = {
            "PylonRack_12Rnd_PG_missiles"
        };
    }; // "K40 Ababil-3"

    class O_T_VTOL_02_infantry_dynamicLoadout_F {
        cost = 14000;
        requirements[] = {"A"};
        rearm = 700;
        killReward = 600;
    }; // "Y-32 Xi'an (Infantry Transport)"

    class I_Plane_Fighter_03_dynamicLoadout_F {
        cost = 15000;
        requirements[] = {"A"};
        rearm = 900;
        killReward = 600;
    }; // "A-143 Buzzard"

    class O_Plane_CAS_02_dynamicLoadout_F {
        cost = 20000;
        requirements[] = {"A"};
        rearm = 900;
        killReward = 900;
    }; // "To-199 Neophron (CAS)"

    class O_Plane_Fighter_02_F {
        cost = 32000;
        requirements[] = {"A"};
        rearm = 900;
        killReward = 1100;
    }; // "To-201 Shikra"

    class O_Plane_Fighter_02_Stealth_F {
        cost = 28000;
        requirements[] = {"A"};
        rearm = 900;
        killReward = 1100;
    }; // "To-201 Shikra (Stealth)"
};