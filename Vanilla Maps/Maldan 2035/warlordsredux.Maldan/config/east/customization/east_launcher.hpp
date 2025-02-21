class Launcher {
    class RPG7 {
        name = "RPG-7";
        item = "launch_RPG7_F";
        level = 3;
        cost = 15;

        class Double: WLCAmmo {
            name = "1x RPG";
            level = 3;
            cost = 15;
            magazines[] = {
                { "RPG7_F", 2 }
            };
        };

        class Light: WLCAmmo {
            name = "4x RPG";
            level = 3;
            cost = 25;
            magazines[] = {
                { "RPG7_F", 4 }
            };
        };

        class Heavy: WLCAmmo {
            name = "8x RPG";
            level = 6;
            cost = 100;
            magazines[] = {
                { "RPG7_F", 8 }
            };
        };
    };

    class RPG42 {
        name = "RPG-42";
        item = "launch_RPG32_F";
        level = 9;
        cost = 20;

        class RPG42_HE_Single: WLCAmmo {
            name = "1x HE";
            level = 9;
            cost = 25;
            magazines[] = {
                { "RPG32_HE_F", 1 }
            };
        };

        class RPG42_HE_Light: WLCAmmo {
            name = "2x HE";
            level = 9;
            cost = 50;
            magazines[] = {
                { "RPG32_HE_F", 2 }
            };
        };

        class RPG42_HE_Heavy: WLCAmmo {
            name = "5x HE";
            level = 12;
            cost = 100;
            magazines[] = {
                { "RPG32_HE_F", 5 }
            };
        };

        class RPG42_HEAT_Single: WLCAmmo {
            name = "1x HEAT";
            level = 15;
            cost = 40;
            magazines[] = {
                { "RPG32_F", 1 }
            };
        };

        class RPG42_HEAT_Light: WLCAmmo {
            name = "2x HEAT";
            level = 15;
            cost = 75;
            magazines[] = {
                { "RPG32_F", 2 }
            };
        };

        class RPG42_HEAT_Heavy: WLCAmmo {
            name = "5x HEAT";
            level = 18;
            cost = 150;
            magazines[] = {
                { "RPG32_F", 5 }
            };
        };
    };

    class PCML {
        name = "PCML";
        item = "launch_NLAW_F";
        level = 21;

        class PCML_Single: WLCAmmo {
            name = "1x";
            level = 21;
            cost = 40;
            magazines[] = {
                { "NLAW_F", 1 }
            };
        };

        class PCML_Light: WLCAmmo {
            name = "2x";
            level = 21;
            cost = 75;
            magazines[] = {
                { "NLAW_F", 2 }
            };
        };

        class PCML_Heavy: WLCAmmo {
            name = "5x";
            level = 24;
            cost = 150;
            magazines[] = {
                { "NLAW_F", 5 }
            };
        };
    };

    class Vorona {
        name = "Vorona";
        item = "launch_O_Vorona_green_F";
        level = 27;

        class HEAT_Single: WLCAmmo {
            name = "1x HEAT";
            level = 27;
            cost = 50;
            magazines[] = {
                { "Vorona_HEAT", 1 }
            };
        };

        class HEAT_Light: WLCAmmo {
            name = "2x HEAT";
            level = 27;
            cost = 100;
            magazines[] = {
                { "Vorona_HEAT", 2 }
            };
        };

        class HEAT_Heavy: WLCAmmo {
            name = "4x HEAT";
            level = 30;
            cost = 200;
            magazines[] = {
                { "Vorona_HEAT", 4 }
            };
        };

        class HE_Single: WLCAmmo {
            name = "1x HE";
            level = 33;
            cost = 50;
            magazines[] = {
                { "Vorona_HE", 1 }
            };
        };

        class HE_Light: WLCAmmo {
            name = "2x HE";
            level = 33;
            cost = 100;
            magazines[] = {
                { "Vorona_HE", 2 }
            };
        };

        class HE_Heavy: WLCAmmo {
            name = "4x HE";
            level = 36;
            cost = 200;
            magazines[] = {
                { "Vorona_HE", 4 }
            };
        };
    };

    class Titan_AA {
        name = "Titan AA";
        item = "launch_B_Titan_F";
        level = 39;

        class AA_Single: WLCAmmo {
            name = "1x AA";
            level = 39;
            cost = 50;
            magazines[] = {
                { "Titan_AA", 1 }
            };
        };

        class AA_Light: WLCAmmo {
            name = "2x AA";
            level = 39;
            cost = 100;
            magazines[] = {
                { "Titan_AA", 2 }
            };
        };

        class AA_Heavy: WLCAmmo {
            name = "4x AA";
            level = 42;
            cost = 200;
            magazines[] = {
                { "Titan_AA", 4 }
            };
        };
    };

    class Titan {
        name = "Titan";
        item = "launch_B_Titan_short_F";
        level = 45;

        class AT_Single: WLCAmmo {
            name = "1x AT";
            level = 45;
            cost = 50;
            magazines[] = {
                { "Titan_AT", 1 }
            };
        };

        class AT_Light: WLCAmmo {
            name = "2x AT";
            level = 45;
            cost = 100;
            magazines[] = {
                { "Titan_AT", 2 }
            };
        };

        class AT_Heavy: WLCAmmo {
            name = "4x AT";
            level = 48;
            cost = 200;
            magazines[] = {
                { "Titan_AT", 4 }
            };
        };
    };
};