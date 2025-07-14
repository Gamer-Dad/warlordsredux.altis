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

            { "bipod_01_F_snd", 5 },

            { "B_FieldPack_cbr", 5 },
            { "B_Carryall_mcamo", 5 }
        };
        cost = 200;
        demolishable = 1;
        description = "NATO gear crate that contains various AT weapons, ammo, and explosives. Can be used to restock infantry units for a price.";
        loadable[] = { 0, -1, 0.5 };
        name = "NATO Supply Crate";
        offset[] = { 0, 3, 0};
        spawn = "VirtualReammoBox_camonet_F";
    };

    class Box_NATO_AmmoVeh_F {
        cost = 250;
        loadable[] = { 0, 0, 0 };
        offset[] = { 0, 3, 0};
    }; // "Vehicle Ammo [NATO]"

    class B_Slingload_01_Fuel_F {
        cost = 300;
        loadable[] = {0, -1.5, 0.5};
    }; // "Huron Fuel Container"

    class B_Slingload_01_Ammo_F {
        cost = 500;
        loadable[] = {0, -1.5, 0.5};
    }; // "Huron Ammo Container"

    class B_Slingload_01_Repair_F {
        cost = 500;
        loadable[] = {0, -1.5, 0.5};
    }; // "Huron Repair Container"

    class B_Slingload_01_Medevac_F {
        cost = 500;
        hasFastTravel = 1;
        loadable[] = {0, -1.5, 0.5};
    }; // "Huron Medical Pod"
};