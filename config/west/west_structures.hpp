class Structures {
    class Land_BagFence_Round_F {
        cost = 50;
        demolishable = 1;
        demolishStepTime = 5;
        hideMap = 1;
        offset[] = {0, 2, 0};
    }; // "Semi Circle Sand bags"

    // class Land_DragonsTeeth_01_4x2_new_F {
    //     cost = 50;
    //     demolishable = 1;
    //     demolishStepTime = 5;
    //     name = "Dragon's Teeth";
    //     offset[] = {0, 5, 0};
    // };

    class Land_HBarrier_5_F {
        cost = 50;
        demolishable = 2;
        demolishStepTime = 5;
        hideMap = 1;
        offset[] = {0, 3, 0};
    }; // "H-barrier"

    class Land_HBarrierWall6_F {
        cost = 60;
        demolishable = 2;
        demolishStepTime = 5;
        hideMap = 1;
        offset[] = {0, 3, 0};
    }; // "H-barrier wall"

    class Land_HBarrierTower_F {
        cost = 70;
        demolishable = 2;
        demolishStepTime = 10;
        hideMap = 1;
        offset[] = {0, 7, 0};
    }; // "Guard Tower (H-barrier)"

    class CamoNet_BLUFOR_big_F {
        cost = 100;
        demolishable = 1;
        demolishStepTime = 3;
        hideMap = 1;
        offset[] = {0, 6, 0};
    }; // "Camouflage Vehicle Cover (Green)"

    class Land_IRMaskingCover_01_F {
        cost = 200;
        demolishable = 1;
        demolishStepTime = 3;
        hideMap = 1;
        offset[] = {0, 8, 0};
    }; // "IR Masking Tent (Large)"

    class Land_Cargo_Tower_V4_F {
        cost = 450;
        demolishable = 3;
        hideMap = 1;
        offset[] = {0, 8, 0};
    };  // "Cargo Tower"

    class Land_BagBunker_01_large_green_F {
        cost = 2000;
        demolishable = 3;
        hasFastTravel = 1;
        name = "Spawn Bunker";
        offset[] = {0, 10, 0};
        requirements[] = {"F"};
    };

    class Land_MobileRadar_01_radar_F {
        cost = 2500;
        demolishable = 5;
        description = "EW Tower can be used to jam enemy autonomous assets and provide EW support to your team. Its position is revealed to the enemy when it is active.";
        name = "EW Tower";
        offset[] = {0, 6, 0};
        // This is not loadable. It will break initialization code to load this.
    };

    class Land_New_WiredFence_10m_F {
        cost = 2500;
        obstacle = 1;
        demolishable = 1;
        demolishStepTime = 3;
        hideMap = 1;
        loaded = "Land_New_WiredFence_10m_F";
        name = "Razor Wire Fence Kit";
        offset[] = {0, 5, 0};
    };

    class Land_DragonsTeeth_01_4x2_new_F {
        cost = 2800;
        obstacle = 1;
        demolishable = 1;
        demolishStepTime = 5;
        hideMap = 1;
        loaded = "Land_DragonsTeeth_01_4x2_new_F";
        name = "Dragon's Teeth Kit";
        offset[] = {0, 5, 0};
    };

    class Land_CzechHedgehog_01_new_F {
        cost = 3000;
        obstacle = 1;
        demolishable = 1;
        demolishStepTime = 5;
        hideMap = 1;
        loaded = "Land_CzechHedgehog_01_new_F";
        name = "Czech Hedgehog Kit";
        offset[] = {0, 5, 0};
    };

    class Land_CraneRail_01_F {
        cost = 5000;
        demolishable = 3;
        description = "Aircraft Catapult can be used to launch fighter jets from your forward airbase.";
        name = "Aircraft Catapult";
        offset[] = {0, 14, 0};
        requirements[] = {"FA"};
    };
};