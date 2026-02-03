class Structures {
    class Land_Razorwire_F {
        cost = 50;
        demolishable = 1;
        demolishStepTime = 3;
        hideName = 1;
        offset[] = {0, 5, 0};
    }; // "Razor Wire Fence"

    class Land_BagFence_Round_F {
        cost = 50;
        demolishable = 1;
        demolishStepTime = 5;
        hideName = 1;
        offset[] = {0, 2, 0};
    }; // "Semi Circle Sand bags"

    // class Land_DragonsTeeth_01_4x2_new_F {
    //     cost = 50;
    //     demolishable = 1;
    //     demolishStepTime = 5;
    //     name = "Dragon's Teeth";
    //     offset[] = {0, 5, 0};
    // }; // "Tank barrier"

    class Land_HBarrier_5_F {
        cost = 50;
        demolishable = 2;
        demolishStepTime = 5;
        hideName = 1;
        offset[] = {0, 3, 0};
    }; // "H-barrier"

    class Land_HBarrierWall6_F {
        cost = 60;
        demolishable = 2;
        demolishStepTime = 5;
        hideName = 1;
        offset[] = {0, 3, 0};
    }; // "H-barrier wall"

    class Land_HBarrierTower_F {
        cost = 70;
        demolishable = 2;
        demolishStepTime = 10;
        hideName = 1;
        offset[] = {0, 7, 0};
    }; // "Guard Tower (H-barrier)"

    class CamoNet_INDP_big_F {
        cost = 100;
        demolishable = 2;
        hideName = 1;
        offset[] = {0, 6, 0};
    }; // "Camouflage Vehicle Cover (Hex)"

    class Land_IRMaskingCover_01_F {
        cost = 200;
        demolishable = 1;
        demolishStepTime = 3;
        hideName = 1;
        offset[] = {0, 8, 0};
    }; // "IR Masking Tent (Large)"

    class Land_Cargo_Tower_V4_F {
        cost = 450;
        demolishable = 3;
        hideName = 1;
        offset[] = {0, 8, 0};
    };  // "Cargo Tower"

    class Land_BagBunker_01_large_green_F {
        cost = 2000;
        demolishable = 3;
        hasFastTravel = 1;
        name = "Spawn Bunker";
        offset[] = {0, 10, 0};
        requirements[] = {"F"};
    }; // "Bunker (Large, Green)"

    class Land_MobileRadar_01_radar_F {
        cost = 2500;
        demolishable = 5;
        description = "EW Tower can be used to jam enemy autonomous assets and provide EW support to your team. Its position is revealed to the enemy when it is active.";
        name = "EW Tower";
        offset[] = {0, 6, 0};
        // This is not loadable. It will break initialization code to load this.
    };
};