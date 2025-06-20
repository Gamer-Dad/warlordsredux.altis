class Gear {
    class B_crate_F {
        container[] = {
            { "launch_O_Vorona_brown_F", 2 },
            { "launch_MRAWS_olive_F", 2 },
            { "launch_O_Titan_F", 2 },
            { "launch_O_Titan_short_F", 2 },

            { "MRAWS_HEAT_F", 8 },
            { "MRAWS_HE_F", 2 },
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

            { "B_FieldPack_cbr", 5 },
            { "B_Carryall_mcamo", 5 }
        };
        cost = 200;
        demolishable = 1;
        description = "NATO gear crate that contains various AT weapons, AA weapons, ammo, mines, and explosives. Can be used to restock infantry units for a price.";
        killReward = 200;
        loadable[] = { 0, -1, 0.5 };
        name = "NATO Supply Crate";
        offset[] = { 0, 3, 0};
        spawn = "VirtualReammoBox_camonet_F";
        requirements[] = {};
    };

    class Box_NATO_AmmoVeh_F {
        cost = 250;
        description = "Vehicle Ammo Crates can be used to rearm and switch out ammunition for various types of vehicles.<br /><br />How To Use:<br /> - Place the crate near your vehicle.<br /> - Look towards your vehicle and use your scroll wheel to select the ""Modify/Rearm"" option.<br /> - Modify the vehicles loadout as you see fit and select ""Apply"" to save your loadout and ""Rearm"" to restock it.<br /> - Reminder: After rearming your vehicle you can only rearm it again after a certain amount of time has elapsed, different vehicles have different rearm timers, only make changes to your vehicle once the rearm timer is done.";
        killReward = 70;
        loadable[] = { 0, 0, 0 };
        offset[] = { 0, 3, 0};
        requirements[] = {};
    }; // "Vehicle Ammo [NATO]"

    class B_Slingload_01_Fuel_F {
        cost = 300;
        description = "Huron Fuel Containers can be used to refuel various types of vehicles.<br /><br />How To Use:<br /> - Place the container near your vehicle.<br /> - Look towards your vehicle and use your scroll wheel to select the ""Refuel"" option.";
        killReward = 150;
        loadable[] = {0, -1.5, 0.5};
        requirements[] = {};
    }; // "Huron Fuel Container"

    class B_Slingload_01_Ammo_F {
        cost = 500;
        description = "Huron Ammo Containers can be used to rearm and switch out ammunition for various types of vehicles.<br /><br />How To Use:<br /> - Place the container near your vehicle.<br /> - Look towards your vehicle and use your scroll wheel to select the ""Modify/Rearm"" option.<br /> - Modify the vehicles loadout as you see fit and select ""Apply"" to save your loadout and ""Rearm"" to restock it.<br /> - Reminder: After rearming your vehicle you can only rearm it again after a certain amount of time has elapsed, different vehicles have different rearm timers, only make changes to your vehicle once the rearm timer is done.";
        killReward = 150;
        loadable[] = {0, -1.5, 0.5};
        requirements[] = {};
    }; // "Huron Ammo Container"

    class B_Slingload_01_Repair_F {
        cost = 500;
        description = "Huron Repair Containers can be used to fully repair damaged vehicles.<br /><br />How To Use:<br /> - Place the container near your vehicle.<br /> - Look towards your vehicle and use your scroll wheel to select the ""Repair"" option.<br /> - Reminder: After repairing your vehicle you can only repair it again after a certain amount of time has elapsed, different vehicles have different repair timers, only make changes to your vehicle once the repair timer is done.";
        killReward = 150;
        loadable[] = {0, -1.5, 0.5};
        requirements[] = {};
    }; // "Huron Repair Container"

    class B_Slingload_01_Medevac_F {
        cost = 500;
        description = "Huron Medical Containers can be used fully heal infantry and can be teleported to.<br /><br />How To Use:<br /> - Place the container anywhere or move it to the desired location.<br /> - Press showMap to open the map.<br /> - Find the container on the map and left click on it, then press ""Fast Travel"" to teleport to the container.";
        killReward = 200;
        loadable[] = {0, -1.5, 0.5};
        requirements[] = {};
    }; // "Huron Medical Pod"
};