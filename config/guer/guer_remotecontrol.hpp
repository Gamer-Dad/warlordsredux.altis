class RemoteControl {
    class I_UGV_02_Demining_F {
        cost = 100;
        offset[] = {0, 3, 0};
        rearm = 200;
        requirements[] = {};
    };  // "UGAS demining"

    class I_UGV_01_F {
        cost = 150;
        offset[] = {0, 5, 0};
        requirements[] = {};
    };  // "UGV Stomper"

    class I_UAV_01_F {
        cost = 500;
        offset[] = {0, 3, 0};
        requirements[] = {};
    };  // "AR-2"

    class I_UGV_01_rcws_F {
        cost = 500;
        offset[] = {0, 5, 0};
        rearm = 300;
        requirements[] = {};
    };  // "UGAV rcws"

    class I_UAV_06_F {
        cost = 1000;
        offset[] = {0, 3, 0};
        requirements[] = {};
    };  // "AR-6"

    class I_UAV_01_UP_F {
        cost = 1200;
        description = "AR-2 Darter UP is a variant of the AR-2 Darter armed with a 45ACP SMG.";
        name = "AR-2 Darter UP";
        offset[] = {0, 3, 0};
        rearm = 300;
        requirements[] = {};
        spawn = "I_UAV_01_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow"
            };
            addWeapons[] = {
                "SMG_01_F"
            };
            removeMagazines[] = {};
            removeWeapons[] = {};
            turret[] = { 0 };
        };
    };

    class I_UGV_01_rcws_up_F {
        cost = 1200;
        description = "UGV Stomper UP is a variant of the UGV Stomper armed with a 30mm autocannon.";
        name = "UGV Stomper UP";
        offset[] = {0, 5, 0};
        rearm = 300;
        requirements[] = {};
        spawn = "I_UGV_01_rcws_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "60Rnd_20mm_HE_shells",
                "60Rnd_20mm_HE_shells",
                "60Rnd_20mm_AP_shells",
                "60Rnd_20mm_AP_shells"
            };
            addWeapons[] = {
                "cannon_20mm"
            };
            removeMagazines[] = {
                "96Rnd_40mm_G_belt"
            };
            removeWeapons[] = {
                "GMG_40mm"
            };
            turret[] = { 0 };
        };
    };
};