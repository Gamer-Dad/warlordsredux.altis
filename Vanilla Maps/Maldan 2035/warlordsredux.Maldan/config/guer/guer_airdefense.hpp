class AirDefense {
    class I_E_Radar_System_01_F {
        cost = 1000;
        description = "Long range radar system, capable of detecting and tracking vehicles within line of sight at up to 16km.";
        killReward = 350;
        loadable[] = {0, 0, 1};
        offset[] = {0, 7, 0};
        requirements[] = {};
    };  // "AN/MPQ-105 Radar"

    class I_LT_01_scout_F {
        capValue = 4;
        cost = 1200;
        killReward = 240;
        rearm = 300;
        requirements[] = {};
        // vehicleSpawn = 1;
    };  // "AWC Nyx (Radar)"

    class I_LT_01_AA_F {
        aps = 1;
        capValue = 4;
        cost = 1500;
        killReward = 240;
        rearm = 300;
        requirements[] = {};
        vehicleSpawn = 1;
    };  // "AWC Nyx (AA)"

    class I_E_SAM_System_03_F {
        cost = 8000;
        description = "Long range surface-to-air missile system, capable of engaging aircraft and helicopters. Effective range: >10km.";
        killReward = 500;
        loadable[] = {0, 0, 1};
        offset[] = {0, 6, 0};
        rearm = 450;
        requirements[] = {};
    };  // "MIM-145 Defender"
};