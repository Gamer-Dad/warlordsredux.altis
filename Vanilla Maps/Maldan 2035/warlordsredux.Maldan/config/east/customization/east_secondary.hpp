class Secondary {
    class None {
        name = "None";
        item = "none";
        level = 0;
        magazines[] = {};
        attachments[] = {};
    };

    class Rook40 {
        name = "Rook-40";
        item = "hgun_Rook40_F";
        level = 0;

        class Standard: WLCAmmo {
            level = 0;
            name = "Standard";
            magazines[] = {
                { "16Rnd_9x21_Mag", 3 }
            };
        };

        class MinimalAmmo: WLCAmmo {
            level = 0;
            name = "Minimal Ammo";
            magazines[] = {
                { "16Rnd_9x21_Mag", 1 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 1;
            name = "Extra Ammo";
            magazines[] = {
                { "16Rnd_9x21_Mag", 5 }
            };
        };

        attachments[] = {
            "muzzle_snds_L"
        };
    };

    class PM9 {
        name = "PM 9mm";
        item = "hgun_Pistol_01_F";
        level = 0;

        class Standard: WLCAmmo {
            level = 0;
            name = "Standard";
            magazines[] = {
                { "10Rnd_9x21_Mag", 3 }
            };
        };

        class MinimalAmmo: WLCAmmo {
            level = 0;
            name = "Minimal Ammo";
            magazines[] = {
                { "10Rnd_9x21_Mag", 1 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 1;
            name = "Extra Ammo";
            magazines[] = {
                { "10Rnd_9x21_Mag", 5 }
            };
        };

        attachments[] = {};
    };

    class ACP {
        name = "ACP-C2";
        item = "hgun_ACPC2_F";
        level = 5;

        class Standard: WLCAmmo {
            level = 5;
            name = "Standard";
            magazines[] = {
                { "9Rnd_45ACP_Mag", 3 }
            };
        };

        class MinimalAmmo: WLCAmmo {
            level = 5;
            name = "Minimal Ammo";
            magazines[] = {
                { "9Rnd_45ACP_Mag", 1 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 6;
            name = "Extra Ammo";
            magazines[] = {
                { "9Rnd_45ACP_Mag", 5 }
            };
        };

        attachments[] = {
            "muzzle_snds_acp"
        };
    };

    class FourFive {
        name = "4-Five";
        item = "hgun_Pistol_heavy_01_F";
        level = 10;

        class Standard: WLCAmmo {
            level = 10;
            name = "Standard";
            magazines[] = {
                { "11Rnd_45ACP_Mag", 3 }
            };
        };

        class MinimalAmmo: WLCAmmo {
            level = 10;
            name = "Minimal Ammo";
            magazines[] = {
                { "11Rnd_45ACP_Mag", 1 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 11;
            name = "Extra Ammo";
            magazines[] = {
                { "11Rnd_45ACP_Mag", 5 }
            };
        };

        class OpticMRD: WLCAttachment {
            name = "MRD";
            attachments[] = {
                "optic_MRD"
            };
        };

        class NoOptic: WLCAttachment {
            name = "No Optic";
            attachments[] = {};
        };

        attachments[] = {
            "muzzle_snds_acp"
        };
    };

    class Zubr {
        name = "Zubr";
        item = "hgun_Pistol_heavy_02_F";
        level = 15;

        class Standard: WLCAmmo {
            level = 15;
            name = "Standard";
            magazines[] = {
                { "6Rnd_45ACP_Cylinder", 3 }
            };
        };

        class MinimalAmmo: WLCAmmo {
            level = 15;
            name = "Minimal Ammo";
            magazines[] = {
                { "6Rnd_45ACP_Cylinder", 1 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 16;
            name = "Extra Ammo";
            magazines[] = {
                { "6Rnd_45ACP_Cylinder", 5 }
            };
        };

        class OpticYorris: WLCAttachment {
            name = "Yorris";
            attachments[] = {
                "optic_Yorris"
            };
        };

        class NoOptic: WLCAttachment {
            name = "No Optic";
            attachments[] = {};
        };

        attachments[] = {};
    };

    class SpectrumDevice {
        name = "Spectrum Device";
        item = "hgun_esd_01_F";
        level = 20;
        cost = 50;
        magazines[] = {};

        class LongRangeAntenna: WLCAttachment {
            name = "SD Military Antenna";
            attachments[] = {
                "muzzle_antenna_01_f"
            };
        };

        class RangeBoosterAntenna: WLCAttachment {
            name = "Experimental Antenna";
            attachments[] = {
                "muzzle_antenna_02_f"
            };
        };

        class ShortRangeAntenna: WLCAttachment {
            name = "SD Jammer Antenna";
            attachments[] = {
                "muzzle_antenna_03_f"
            };
        };

        class NoAntenna: WLCAttachment {
            name = "No Antenna";
            attachments[] = {};
        };

        attachments[] = {};
    };
};