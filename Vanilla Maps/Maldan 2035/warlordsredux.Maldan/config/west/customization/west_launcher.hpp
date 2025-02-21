class Launcher {
    class MAAWS {
        name = "MAAWS";
        item = "launch_MRAWS_green_F";
        level = 3;

        class SingleHEAT55: WLCAmmo {
            name = "1x HEAT55";
            level = 3;
            cost = 25;
            magazines[] = {
                { "MRAWS_HEAT55_F", 1 }
            };
        };

        class LightHEAT55: WLCAmmo {
            name = "2x HEAT55";
            level = 3;
            cost = 50;
            magazines[] = {
                { "MRAWS_HEAT55_F", 2 }
            };
        };

        class HeavyHEAT55: WLCAmmo {
            name = "5x HEAT55";
            level = 6;
            cost = 100;
            magazines[] = {
                { "MRAWS_HEAT55_F", 5 }
            };
        };

        class SingleHE: WLCAmmo {
            name = "1x HE";
            level = 9;
            cost = 25;
            magazines[] = {
                { "MRAWS_HE_F", 1 }
            };
        };

        class LightHE: WLCAmmo {
            name = "2x HE";
            level = 9;
            cost = 50;
            magazines[] = {
                { "MRAWS_HE_F", 2 }
            };
        };

        class HeavyHE: WLCAmmo {
            name = "5x HE";
            level = 12;
            cost = 100;
            magazines[] = {
                { "MRAWS_HE_F", 5 }
            };
        };

        class SingleHEAT: WLCAmmo {
            name = "1x HEAT";
            level = 15;
            cost = 40;
            magazines[] = {
                { "MRAWS_HEAT_F", 1 }
            };
        };

        class LightHEAT: WLCAmmo {
            name = "2x HEAT";
            level = 15;
            cost = 75;
            magazines[] = {
                { "MRAWS_HEAT_F", 2 }
            };
        };

        class HeavyHEAT: WLCAmmo {
            name = "5x HEAT";
            level = 18;
            cost = 150;
            magazines[] = {
                { "MRAWS_HEAT_F", 5 }
            };
        };
    };

    class PCML {
        name = "PCML";
        item = "launch_NLAW_F";
        level = 21;

        class Single: WLCAmmo {
            name = "1x";
            level = 21;
            cost = 40;
            magazines[] = {
                { "NLAW_F", 1 }
            };
        };

        class Light: WLCAmmo {
            name = "2x";
            level = 21;
            cost = 75;
            magazines[] = {
                { "NLAW_F", 2 }
            };
        };

        class Heavy: WLCAmmo {
            name = "5x";
            level = 24;
            cost = 150;
            magazines[] = {
                { "NLAW_F", 5 }
            };
        };
    };

    class Titan {
        name = "Titan";
        item = "launch_B_Titan_short_F";
        level = 27;

        class AT_Single: WLCAmmo {
            name = "1x AT";
            level = 27;
            cost = 50;
            magazines[] = {
                { "Titan_AT", 1 }
            };
        };

        class AT_Light: WLCAmmo {
            name = "2x AT";
            level = 27;
            cost = 100;
            magazines[] = {
                { "Titan_AT", 2 }
            };
        };

        class AT_Heavy: WLCAmmo {
            name = "4x AT";
            level = 30;
            cost = 200;
            magazines[] = {
                { "Titan_AT", 4 }
            };
        };

        class AP_Single: WLCAmmo {
            name = "1x AP";
            level = 33;
            cost = 50;
            magazines[] = {
                { "Titan_AP", 1 }
            };
        };

        class AP_Light: WLCAmmo {
            name = "2x AP";
            level = 33;
            cost = 100;
            magazines[] = {
                { "Titan_AP", 2 }
            };
        };

        class AP_Heavy: WLCAmmo {
            name = "4x AP";
            level = 36;
            cost = 200;
            magazines[] = {
                { "Titan_AP", 4 }
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

    class Vorona {
        name = "Vorona";
        item = "launch_O_Vorona_green_F";
        level = 45;

        class HEAT_Single: WLCAmmo {
            name = "1x HEAT";
            level = 45;
            cost = 50;
            magazines[] = {
                { "Vorona_HEAT", 1 }
            };
        };

        class HEAT_Light: WLCAmmo {
            name = "2x HEAT";
            level = 45;
            cost = 100;
            magazines[] = {
                { "Vorona_HEAT", 2 }
            };
        };

        class HEAT_Heavy: WLCAmmo {
            name = "4x HEAT";
            level = 48;
            cost = 200;
            magazines[] = {
                { "Vorona_HEAT", 4 }
            };
        };
    };
};