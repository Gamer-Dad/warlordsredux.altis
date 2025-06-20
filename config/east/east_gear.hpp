class Gear {
    class O_crate_F {
        container[] = {
            { "launch_O_Vorona_brown_F", 2 },
            { "launch_RPG32_F", 2 },
            { "launch_O_Titan_F", 2 },
            { "launch_O_Titan_short_F", 2 },

            { "RPG32_F", 8 },
            { "RPG32_HE_F", 2 },
            { "Titan_AA", 8 },
            { "Titan_AP", 2 },
            { "Titan_AT", 8 },
            { "Vorona_HE", 2 },
            { "Vorona_HEAT", 8 },

            { "APERSBoundingMine_Range_Mag", 3},
            { "APERSMine_Range_Mag", 3},
            { "APERSTripMine_Wire_Mag", 3},
            { "ATMine_Range_Mag", 3},
            { "ClaymoreDirectionalMine_Remote_Mag", 3},
            { "DemoCharge_Remote_Mag", 3},
            { "SatchelCharge_Remote_Mag", 3},
            { "SLAMDirectionalMine_Wire_Mag", 3},

            { "B_FieldPack_ocamo", 5 },
            { "B_Carryall_ocamo", 5 }
        };
        cost = 200;
        demolishable = 1;
        description = "CSAT gear crate that contains various AT weapons, ammo, and explosives. Can be used to restock infantry units for a price.";
        killReward = 200;
        loadable[] = { 0, -1, 0.5 };
        name = "CSAT Supply Crate";
        offset[] = { 0, 3, 0};
        spawn = "VirtualReammoBox_camonet_F";
        requirements[] = {};
    };

    class Box_East_AmmoVeh_F {
        cost = 250;
        description = "Vehicle Ammo Crates can be used to rearm and switch out ammunition for various types of vehicles.<br /><br />How To Use:<br /> - Place the crate near your vehicle.<br /> - Look towards your vehicle and use your scroll wheel to select the ""Modify/Rearm"" option.<br /> - Modify the vehicles loadout as you see fit and select ""Apply"" to save your loadout and ""Rearm"" to restock it.<br /> - Reminder: After rearming your vehicle you can only rearm it again after a certain amount of time has elapsed, different vehicles have different rearm timers, only make changes to your vehicle once the rearm timer is done.";
        killReward = 70;
        loadable[] = { 0, 0, 0 };
        offset[] = { 0, 3, 0};
        requirements[] = {};
    }; // "Vehicle Ammo [CSAT]"

    class Land_Pod_Heli_Transport_04_fuel_F {
        cost = 300;
        description = "Taru Fuel Pods can be used to refuel various types of vehicles.<br /><br />How To Use:<br /> - Place the pod near your vehicle.<br /> - Look towards your vehicle and use your scroll wheel to select the ""Refuel"" option.";
        killReward = 150;
        loadable[] = {0, -1.8, 0.5};
        requirements[] = {};
    }; // "Taru Fuel Pod"

    class Land_Pod_Heli_Transport_04_ammo_F {
        cost = 500;
        description = "Taru Ammo Pods can be used to rearm and switch out ammunition for various types of vehicles.<br /><br />How To Use:<br /> - Place the pod near your vehicle.<br /> - Look towards your vehicle and use your scroll wheel to select the ""Modify/Rearm"" option.<br /> - Modify the vehicles loadout as you see fit and select ""Apply"" to save your loadout and ""Rearm"" to restock it.<br /> - Reminder: After rearming your vehicle you can only rearm it again after a certain amount of time has elapsed, different vehicles have different rearm timers, only make changes to your vehicle once the rearm timer is done.";
        killReward = 150;
        loadable[] = {0, -1.8, 0.4};
        requirements[] = {};
    }; // "Taru Ammo Pod"

    class Land_Pod_Heli_Transport_04_repair_F {
        cost = 500;
        description = "Taru Repair Pods can be used to fully repair damaged vehicles.<br /><br />How To Use:<br /> - Place the pod near your vehicle.<br /> - Look towards your vehicle and use your scroll wheel to select the ""Repair"" option.<br /> - Reminder: After repairing your vehicle you can only repair it again after a certain amount of time has elapsed, different vehicles have different repair timers, only make changes to your vehicle once the repair timer is done.";
        killReward = 150;
        loadable[] = {0, -1.8, 0.4};
        requirements[] = {};
    }; // "Taru Repair Pod"

    class Land_Pod_Heli_Transport_04_medevac_F {
        cost = 500;
        description = "Taru Medical Pods can be used fully heal infantry and can be teleported to.<br /><br />How To Use:<br /> - Place the pod anywhere or move it to the desired location.<br /> - Press showMap to open the map.<br /> - Find the pod on the map and left click on it, then press ""Fast Travel"" to teleport to the pod.";
        killReward = 200;
        loadable[] = {0, -1.8, 0.5};
        requirements[] = {};
    }; // "Taru Medical Pod"
};