class Primary {
    // MX
    class MX {
        name = "MX";
        item = "arifle_MX_F";
        level = 0;

        class Standard: WLCAmmo {
            name = "Standard";
            magazines[] = {
                { "30Rnd_65x39_caseless_mag", 6 }
            };
        };

        class Tracers: WLCAmmo {
            name = "Tracers";
            magazines[] = {
                { "30Rnd_65x39_caseless_mag_Tracer", 6 }
            };
        };

        #include "west_optics.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_H"
        };
    };

    // MX GL
    class MX_GL {
        name = "MX GL";
        item = "arifle_MX_GL_F";
        level = 1;
        cost = 20;

        class Standard: WLCAmmo {
            name = "Standard";
            magazines[] = {
                { "30Rnd_65x39_caseless_mag", 6 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class Tracers: WLCAmmo {
            name = "Tracers";
            magazines[] = {
                { "30Rnd_65x39_caseless_mag_Tracer", 6 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            name = "Extra Ammo";
            magazines[] = {
                { "30Rnd_65x39_caseless_mag", 9 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class TracersExtraAmmo: WLCAmmo {
            name = "Tracers, Extra Ammo";
            magazines[] = {
                { "30Rnd_65x39_caseless_mag_Tracer", 9 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class Grenadier: WLCAmmo {
            name = "Extra Grenades";
            level = 30;
            magazines[] = {
                { "30Rnd_65x39_caseless_mag", 6 },
                { "3Rnd_HE_Grenade_shell", 6 }
            };
        };

        class TracersGrenadier: WLCAmmo {
            name = "Tracers, Extra Grenades";
            level = 31;
            magazines[] = {
                { "30Rnd_65x39_caseless_mag_Tracer", 6 },
                { "3Rnd_HE_Grenade_shell", 6 }
            };
        };

        #include "west_optics.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_H"
        };
    };

    // MXC
    class MXC {
        name = "MXC";
        item = "arifle_MXC_F";
        level = 3;
        cost = 20;

        class Standard: WLCAmmo {
            level = 3;
            name = "Standard";
            magazines[] = {
                { "30Rnd_65x39_caseless_mag", 6 }
            };
        };

        class Tracers: WLCAmmo {
            name = "Tracers";
            magazines[] = {
                { "30Rnd_65x39_caseless_mag_Tracer", 6 }
            };
        };

        #include "west_optics_short.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_H"
        };
    };

    // Sting
    class Sting {
        name = "Sting";
        item = "SMG_02_F";
        level = 4;
        cost = 20;

        class Standard: WLCAmmo {
            level = 4;
            name = "Standard";
            magazines[] = {
                { "30Rnd_9x21_Mag_SMG_02", 5 }
            };
        };

        class ExtraLoad: WLCAmmo {
            level = 5;
            name = "Extra Load";
            magazines[] = {
                { "30Rnd_9x21_Mag_SMG_02", 10 }
            };
        };

        class MaxLoad: WLCAmmo {
            level = 6;
            name = "Max Load";
            magazines[] = {
                { "30Rnd_9x21_Mag_SMG_02", 15 }
            };
        };

        #include "west_optics_short.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_L"
        };
    };

    // Protector
    class Protector {
        name = "Protector";
        item = "SMG_05_F";
        level = 5;
        cost = 20;

        class Standard: WLCAmmo {
            level = 5;
            name = "Standard";
            magazines[] = {
                { "30Rnd_9x21_Mag_SMG_02", 5 }
            };
        };

        class ExtraLoad: WLCAmmo {
            level = 6;
            name = "Extra Load";
            magazines[] = {
                { "30Rnd_9x21_Mag_SMG_02", 10 }
            };
        };

        class MaxLoad: WLCAmmo {
            level = 7;
            name = "Max Load";
            magazines[] = {
                { "30Rnd_9x21_Mag_SMG_02", 15 }
            };
        };

        #include "west_optics_short.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_L"
        };
    };

    // Vermin
    class Vermin {
        name = "Vermin";
        item = "SMG_01_F";
        level = 6;
        cost = 20;

        class Standard: WLCAmmo {
            name = "Standard";
            magazines[] = {
                { "30Rnd_45ACP_Mag_SMG_01", 5 }
            };
        };

        class ExtraLoad: WLCAmmo {
            level = 7;
            name = "Extra Load";
            magazines[] = {
                { "30Rnd_45ACP_Mag_SMG_01", 10 }
            };
        };

        class MaxLoad: WLCAmmo {
            level = 8;
            name = "Max Load";
            magazines[] = {
                { "30Rnd_45ACP_Mag_SMG_01", 15 }
            };
        };

        #include "west_optics_short.hpp"

        attachments[] = {
            "muzzle_snds_acp"
        };
    };

    // ADR-97 TR
    class ADR97_TR {
        name = "ADR-97 TR";
        item = "SMG_03_TR_khaki";
        level = 7;
        cost = 20;

        class Standard: WLCAmmo {
            level = 7;
            name = "Standard";
            magazines[] = {
                { "50Rnd_570x28_SMG_03", 5 }
            };
        };

        class ExtraLoad: WLCAmmo {
            level = 8;
            name = "Extra Load";
            magazines[] = {
                { "50Rnd_570x28_SMG_03", 10 }
            };
        };

        class MaxLoad: WLCAmmo {
            level = 9;
            name = "Max Load";
            magazines[] = {
                { "50Rnd_570x28_SMG_03", 15 }
            };
        };

        #include "west_optics_short.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_570"
        };
    };

    // Promet GL
    class Promet_GL {
        name = "Promet GL";
        item = "arifle_MSBS65_GL_F";
        level = 8;
        cost = 20;

        class Standard: WLCAmmo {
            level = 8;
            name = "Standard";
            magazines[] = {
                { "30Rnd_65x39_caseless_msbs_mag", 6 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class Tracers: WLCAmmo {
            level = 9;
            name = "Tracers";
            magazines[] = {
                { "30Rnd_65x39_caseless_msbs_mag_Tracer", 6 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 10;
            name = "Extra Ammo";
            magazines[] = {
                { "30Rnd_65x39_caseless_msbs_mag", 9 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class ExtraAmmoTracers: WLCAmmo {
            level = 11;
            name = "Tracers, Extra Ammo";
            magazines[] = {
                { "30Rnd_65x39_caseless_msbs_mag_Tracer", 9 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class ExtraGrenades: WLCAmmo {
            level = 12;
            name = "Extra Grenades";
            magazines[] = {
                { "30Rnd_65x39_caseless_msbs_mag", 6 },
                { "1Rnd_HE_Grenade_shell", 6 }
            };
        };

        class ExtraGrenadesTracers: WLCAmmo {
            level = 13;
            name = "Tracers, Extra Grenades";
            magazines[] = {
                { "30Rnd_65x39_caseless_msbs_mag_Tracer", 6 },
                { "1Rnd_HE_Grenade_shell", 6 }
            };
        };

        class MaxGrenades: WLCAmmo {
            level = 14;
            name = "Max Grenades";
            magazines[] = {
                { "30Rnd_65x39_caseless_msbs_mag", 3 },
                { "1Rnd_HE_Grenade_shell", 9 }
            };
        };

        class MaxGrenadesTracers: WLCAmmo {
            level = 15;
            name = "Tracers, Max Grenades";
            magazines[] = {
                { "30Rnd_65x39_caseless_msbs_mag_Tracer", 3 },
                { "1Rnd_HE_Grenade_shell", 9 }
            };
        };

        #include "west_optics.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_H"
        };
    };

    // Promet SG
    class Promet_SG {
        name = "Promet SG";
        item = "arifle_MSBS65_UBS_F";
        level = 11;
        cost = 50;

        class Standard: WLCAmmo {
            level = 11;
            name = "Standard";
            magazines[] = {
                { "30Rnd_65x39_caseless_msbs_mag", 6 },
                { "6Rnd_12Gauge_Pellets", 2 },
                { "6Rnd_12Gauge_Slug", 2 }
            };
        };

        class Tracers: WLCAmmo {
            level = 12;
            name = "Tracers";
            magazines[] = {
                { "30Rnd_65x39_caseless_msbs_mag_Tracer", 6 },
                { "6Rnd_12Gauge_Pellets", 2 },
                { "6Rnd_12Gauge_Slug", 2 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 13;
            name = "Extra Ammo";
            magazines[] = {
                { "30Rnd_65x39_caseless_msbs_mag", 9 },
                { "6Rnd_12Gauge_Pellets", 2 },
                { "6Rnd_12Gauge_Slug", 2 }
            };
        };

        class ExtraAmmoTracers: WLCAmmo {
            level = 14;
            name = "Tracers, Extra Ammo";
            magazines[] = {
                { "30Rnd_65x39_caseless_msbs_mag_Tracer", 9 },
                { "6Rnd_12Gauge_Pellets", 2 },
                { "6Rnd_12Gauge_Slug", 2 }
            };
        };

        class SlugsOnly: WLCAmmo {
            level = 15;
            name = "Slugs Only";
            magazines[] = {
                { "30Rnd_65x39_caseless_msbs_mag", 6 },
                { "6Rnd_12Gauge_Slug", 6 }
            };
        };

        class TracersSlugsOnly: WLCAmmo {
            level = 16;
            name = "Tracers, Slugs Only";
            magazines[] = {
                { "30Rnd_65x39_caseless_msbs_mag_Tracer", 6 },
                { "6Rnd_12Gauge_Slug", 6 }
            };
        };

        class PelletsOnly: WLCAmmo {
            level = 17;
            name = "Pellets Only";
            magazines[] = {
                { "30Rnd_65x39_caseless_msbs_mag", 6 },
                { "6Rnd_12Gauge_Pellets", 6 }
            };
        };

        class TracersPelletsOnly: WLCAmmo {
            level = 18;
            name = "Tracers, Pellets Only";
            magazines[] = {
                { "30Rnd_65x39_caseless_msbs_mag_Tracer", 6 },
                { "6Rnd_12Gauge_Pellets", 6 }
            };
        };

        #include "west_optics.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_H"
        };
    };

    // SPAR-16
    class SPAR16 {
        name = "SPAR-16 GL";
        item = "arifle_SPAR_01_GL_blk_F";
        level = 14;
        cost = 50;

        class Standard: WLCAmmo {
            level = 14;
            name = "Standard";
            magazines[] = {
                { "30Rnd_556x45_Stanag", 6 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class Tracers: WLCAmmo {
            level = 15;
            name = "Tracers";
            magazines[] = {
                { "30Rnd_556x45_Stanag_Tracer_Red", 2 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class DrumMags: WLCAmmo {
            level = 16;
            name = "Drum Mags";
            magazines[] = {
                { "150Rnd_556x45_Drum_Mag_F", 2 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class TracersDrumMags: WLCAmmo {
            level = 17;
            name = "Tracers, Drum Mags";
            magazines[] = {
                { "150Rnd_556x45_Drum_Mag_Tracer_F", 2 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class ExtraAmmo : WLCAmmo {
            level = 18;
            name = "Extra Ammo";
            magazines[] = {
                { "30Rnd_556x45_Stanag", 9 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class TracersExtraAmmo: WLCAmmo {
            level = 19;
            name = "Tracers, Extra Ammo";
            magazines[] = {
                { "30Rnd_556x45_Stanag_Tracer_Red", 9 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class DrumMagsExtraAmmo: WLCAmmo {
            level = 20;
            name = "Drum Mags, Extra Ammo";
            magazines[] = {
                { "150Rnd_556x45_Drum_Mag_F", 4 },
                { "1Rnd_HE_Grenade_shell", 6 }
            };
        };

        class TracersDrumMagsExtraAmmo: WLCAmmo {
            level = 21;
            name = "Tracers, Drum Mags, Extra Ammo";
            magazines[] = {
                { "150Rnd_556x45_Drum_Mag_Tracer_F", 4 },
                { "1Rnd_HE_Grenade_shell", 6 }
            };
        };

        #include "west_optics.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_M"
        };
    };

    // AK-12
    class AK12 {
        name = "AK-12";
        item = "arifle_AK12_GL_F";
        level = 17;
        cost = 50;

        class Standard: WLCAmmo {
            level = 17;
            name = "Standard";
            magazines[] = {
                { "30Rnd_762x39_AK12_Mag_F", 6 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class Tracers: WLCAmmo {
            level = 18;
            name = "Tracers";
            magazines[] = {
                { "30Rnd_762x39_AK12_Mag_Tracer_F", 6 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class DrumMags: WLCAmmo {
            level = 19;
            name = "Drum Mags";
            magazines[] = {
                { "75rnd_762x39_AK12_Mag_F", 2 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class TracersDrumMags: WLCAmmo {
            level = 20;
            name = "Tracers, Drum Mags";
            magazines[] = {
                { "75rnd_762x39_AK12_Mag_Tracer_F", 2 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class ExtraAmmo : WLCAmmo {
            level = 21;
            name = "Extra Ammo";
            magazines[] = {
                { "30Rnd_762x39_AK12_Mag_F", 9 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class TracersExtraAmmo: WLCAmmo {
            level = 22;
            name = "Tracers, Extra Ammo";
            magazines[] = {
                { "30Rnd_762x39_AK12_Mag_Tracer_F", 9 },
                { "1Rnd_HE_Grenade_shell", 3 }
            };
        };

        class DrumMagsExtraAmmo: WLCAmmo {
            level = 23;
            name = "Drum Mags, Extra Ammo";
            magazines[] = {
                { "75rnd_762x39_AK12_Mag_F", 4 },
                { "1Rnd_HE_Grenade_shell", 6 }
            };
        };

        class TracersDrumMagsExtraAmmo: WLCAmmo {
            level = 24;
            name = "Tracers, Drum Mags, Extra Ammo";
            magazines[] = {
                { "75rnd_762x39_AK12_Mag_Tracer_F", 4 },
                { "1Rnd_HE_Grenade_shell", 6 }
            };
        };

        #include "west_optics.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_B"
        };
    };

    // CAR-95-1
    class CAR95_1 {
        name = "CAR-95-1";
        item = "arifle_CTARS_blk_F";
        level = 20;
        cost = 50;

        class Standard: WLCAmmo {
            level = 20;
            name = "Standard";
            magazines[] = {
                { "100Rnd_580x42_Mag_F", 3 }
            };
        };

        class Tracers: WLCAmmo {
            level = 21;
            name = "Tracers";
            magazines[] = {
                { "100Rnd_580x42_Mag_Tracer_F", 3 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 22;
            name = "Extra Ammo";
            magazines[] = {
                { "100Rnd_580x42_Mag_F", 6 }
            };
        };

        class TracersExtraAmmo: WLCAmmo {
            level = 23;
            name = "Tracers, Extra Ammo";
            magazines[] = {
                { "100Rnd_580x42_Mag_Tracer_F", 6 }
            };
        };

        #include "west_optics.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_58_blk_F"
        };
    };

    // Type-115
    class Type115 {
        name = "Type-115";
        item = "arifle_ARX_blk_F";
        level = 23;
        cost = 50;

        class Standard: WLCAmmo {
            level = 23;
            name = "Standard";
            magazines[] = {
                { "30Rnd_65x39_caseless_green", 6 },
                { "10Rnd_50BW_Mag_F", 3 }
            };
        };

        class Tracers: WLCAmmo {
            level = 24;
            name = "Tracers";
            magazines[] = {
                { "30Rnd_65x39_caseless_green_mag_Tracer", 6 },
                { "10Rnd_50BW_Mag_F", 3 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 25;
            name = "Extra Ammo";
            magazines[] = {
                { "30Rnd_65x39_caseless_green", 9 },
                { "10Rnd_50BW_Mag_F", 3 }
            };
        };

        class TracersExtraAmmo: WLCAmmo {
            level = 26;
            name = "Tracers, Extra Ammo";
            magazines[] = {
                { "30Rnd_65x39_caseless_green_mag_Tracer", 9 },
                { "10Rnd_50BW_Mag_F", 3 }
            };
        };

        class Extra50: WLCAmmo {
            level = 27;
            name = "Extra .50";
            magazines[] = {
                { "30Rnd_65x39_caseless_green", 6 },
                { "10Rnd_50BW_Mag_F", 6 }
            };
        };

        class TracersExtra50: WLCAmmo {
            level = 28;
            name = "Tracers, Extra .50";
            magazines[] = {
                { "30Rnd_65x39_caseless_green_mag_Tracer", 6 },
                { "10Rnd_50BW_Mag_F", 6 }
            };
        };

        #include "west_optics.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_h"
        };
    };

    // MX SW
    class MX_SW {
        name = "MX SW";
        item = "arifle_MX_SW_F";
        level = 26;
        cost = 50;

        class Standard: WLCAmmo {
            level = 26;
            name = "Standard";
            magazines[] = {
                { "100Rnd_65x39_caseless_mag", 3 }
            };
        };

        class Tracers: WLCAmmo {
            level = 27;
            name = "Tracers";
            magazines[] = {
                { "100Rnd_65x39_caseless_mag_Tracer", 3 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 28;
            name = "Extra Ammo";
            magazines[] = {
                { "100Rnd_65x39_caseless_mag", 6 }
            };
        };

        class TracersExtraAmmo: WLCAmmo {
            level = 29;
            name = "Tracers, Extra Ammo";
            magazines[] = {
                { "100Rnd_65x39_caseless_mag_Tracer", 6 }
            };
        };

        #include "west_optics.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_H"
        };
    };

    // RPK-12
    class RPK12 {
        name = "RPK-12";
        item = "arifle_RPK12_F";
        level = 28;
        cost = 50;

        class Standard: WLCAmmo {
            level = 28;
            name = "Standard";
            magazines[] = {
                { "75rnd_762x39_AK12_Mag_F", 3 }
            };
        };

        class Tracers: WLCAmmo {
            level = 29;
            name = "Tracers";
            magazines[] = {
                { "75rnd_762x39_AK12_Mag_Tracer_F", 3 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 30;
            name = "Extra Ammo";
            magazines[] = {
                { "75rnd_762x39_AK12_Mag_F", 6 }
            };
        };

        class TracersExtraAmmo: WLCAmmo {
            level = 31;
            name = "Tracers, Extra Ammo";
            magazines[] = {
                { "75rnd_762x39_AK12_Mag_Tracer_F", 6 }
            };
        };

        #include "west_optics.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_B"
        };
    };

    // LIM-85
    class LIM85 {
        name = "LIM-85";
        item = "LMG_03_F";
        level = 30;
        cost = 50;

        class Standard: WLCAmmo {
            level = 30;
            name = "Standard";
            magazines[] = {
                { "200Rnd_556x45_Box_F", 2 }
            };
        };

        class Tracers: WLCAmmo {
            level = 31;
            name = "Tracers";
            magazines[] = {
                { "200Rnd_556x45_Box_Tracer_F", 2 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 32;
            name = "Extra Ammo";
            magazines[] = {
                { "200Rnd_556x45_Box_F", 4 }
            };
        };

        class TracersExtraAmmo: WLCAmmo {
            level = 33;
            name = "Tracers, Extra Ammo";
            magazines[] = {
                { "200Rnd_556x45_Box_Tracer_F", 4 }
            };
        };

        #include "west_optics.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_M"
        };
    };

    // Zafir
    class Zafir {
        name = "Zafir";
        item = "LMG_Zafir_F";
        level = 32;
        cost = 50;

        class Standard: WLCAmmo {
            level = 32;
            name = "Standard";
            magazines[] = {
                { "150Rnd_762x54_Box", 2 }
            };
        };

        class Tracers: WLCAmmo {
            level = 33;
            name = "Tracers";
            magazines[] = {
                { "150Rnd_762x54_Box_Tracer", 2 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 34;
            name = "Extra Ammo";
            magazines[] = {
                { "150Rnd_762x54_Box", 4 }
            };
        };

        class TracersExtraAmmo: WLCAmmo {
            level = 35;
            name = "Tracers, Extra Ammo";
            magazines[] = {
                { "150Rnd_762x54_Box_Tracer", 4 }
            };
        };

        #include "west_optics.hpp"

        attachments[] = {
            "acc_pointer_IR"
        };
    };

    // SPMG
    class SPMG {
        name = "SPMG";
        item = "MMG_02_camo_F";
        level = 34;
        cost = 75;

        class Standard: WLCAmmo {
            level = 34;
            name = "Standard";
            magazines[] = {
                { "130Rnd_338_Mag", 2 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 35;
            name = "Extra Ammo";
            magazines[] = {
                { "130Rnd_338_Mag", 4 }
            };
        };

        #include "west_optics.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_338_sand"
        };
    };

    // Navid
    class Navid {
        name = "Navid";
        item = "MMG_01_hex_F";
        level = 36;
        cost = 75;

        class Standard: WLCAmmo {
            level = 36;
            name = "Standard";
            magazines[] = {
                { "150Rnd_93x64_Mag", 2 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 37;
            name = "Extra Ammo";
            magazines[] = {
                { "150Rnd_93x64_Mag", 4 }
            };
        };

        #include "west_optics.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_93mmg"
        };
    };

    // MXM
    class MXM {
        name = "MXM";
        item = "arifle_MXM_F";
        level = 38;
        cost = 50;

        class Standard: WLCAmmo {
            level = 38;
            name = "Standard";
            magazines[] = {
                { "30Rnd_65x39_caseless_mag", 6 }
            };
        };

        class Tracers: WLCAmmo {
            level = 39;
            name = "Tracers";
            magazines[] = {
                { "30Rnd_65x39_caseless_mag_Tracer", 6 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 40;
            name = "Extra Ammo";
            magazines[] = {
                { "30Rnd_65x39_caseless_mag", 9 }
            };
        };

        class TracersExtraAmmo: WLCAmmo {
            level = 41;
            name = "Tracers, Extra Ammo";
            magazines[] = {
                { "30Rnd_65x39_caseless_mag_Tracer", 9 }
            };
        };

        #include "west_optics_long.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_H"
        };
    };

    // Rahim 7.62
    class Rahim_762 {
        name = "Rahim 7.62";
        item = "srifle_DMR_01_F";
        level = 39;
        cost = 50;

        class Standard: WLCAmmo {
            level = 39;
            name = "Standard";
            magazines[] = {
                { "10Rnd_762x54_Mag", 6 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 40;
            name = "Extra Ammo";
            magazines[] = {
                { "10Rnd_762x54_Mag", 9 }
            };
        };

        #include "west_optics_long.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_B"
        };
    };

    // MK1 EMR
    class MK1_EMR {
        name = "MK1 EMR";
        item = "srifle_DMR_03_F";
        level = 40;
        cost = 50;

        class Standard: WLCAmmo {
            level = 40;
            name = "Standard";
            magazines[] = {
                { "20Rnd_762x51_Mag", 6 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 41;
            name = "Extra Ammo";
            magazines[] = {
                { "20Rnd_762x51_Mag", 9 }
            };
        };

        #include "west_optics_long.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_B"
        };
    };

    // SPAR-17
    class SPAR17 {
        name = "SPAR-17";
        item = "arifle_SPAR_03_snd_F";
        level = 41;
        cost = 50;
        class Standard: WLCAmmo {
            level = 41;
            name = "Standard";
            magazines[] = {
                { "20Rnd_762x51_Mag", 6 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 41;
            name = "Extra Ammo";
            magazines[] = {
                { "20Rnd_762x51_Mag", 9 }
            };
        };

        #include "west_optics_long.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_B"
        };
    };

    // ASP-1 Kir
    class ASP1_Kir {
        name = "ASP-1 Kir";
        item = "srifle_DMR_04_F";
        level = 42;
        cost = 75;

        class Standard: WLCAmmo {
            level = 42;
            name = "Standard";
            magazines[] = {
                { "10Rnd_127x54_Mag", 6 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 43;
            name = "Extra Ammo";
            magazines[] = {
                { "10Rnd_127x54_Mag", 9 }
            };
        };

        #include "west_optics_long.hpp"

        attachments[] = {
            "acc_pointer_IR"
        };
    };

    // MAR-10
    class MAR10 {
        name = "MAR-10";
        item = "srifle_DMR_02_camo_F";
        level = 43;
        cost = 75;

        class Standard: WLCAmmo {
            level = 43;
            name = "Standard";
            magazines[] = {
                { "10Rnd_338_Mag", 6 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 44;
            name = "Extra Ammo";
            magazines[] = {
                { "10Rnd_338_Mag", 9 }
            };
        };

        #include "west_optics_long.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_338_black"
        };
    };

    // Cyrus
    class Cyrus {
        name = "Cyrus";
        item = "srifle_DMR_05_tan_F";
        level = 44;
        cost = 75;

        class Standard: WLCAmmo {
            level = 44;
            name = "Standard";
            magazines[] = {
                { "10Rnd_93x64_DMR_05_Mag", 6 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 45;
            name = "Extra Ammo";
            magazines[] = {
                { "10Rnd_93x64_DMR_05_Mag", 9 }
            };
        };

        #include "west_optics_long.hpp"

        attachments[] = {
            "acc_pointer_IR",
            "muzzle_snds_93mmg"
        };
    };

    // M320 LRR
    class M320_LRR {
        name = "M320 LRR";
        item = "srifle_LRR_F";
        level = 45;
        cost = 100;

        class Standard: WLCAmmo {
            level = 45;
            name = "Standard";
            magazines[] = {
                { "7Rnd_408_Mag", 6 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 46;
            name = "Extra Ammo";
            magazines[] = {
                { "7Rnd_408_Mag", 9 }
            };
        };

        #include "west_optics_long.hpp"

        attachments[] = {};
    };

    // GM6 Lynx
    class GM6_Lynx {
        name = "GM6 Lynx";
        item = "srifle_GM6_F";
        level = 46;
        cost = 100;

        class Standard: WLCAmmo {
            level = 46;
            name = "Standard";
            magazines[] = {
                { "5Rnd_127x108_Mag", 6 }
            };
        };

        class ExtraAmmo: WLCAmmo {
            level = 47;
            name = "Extra Ammo";
            magazines[] = {
                { "5Rnd_127x108_Mag", 9 }
            };
        };

        class APDS: WLCAmmo {
            level = 48;
            name = "APDS";
            magazines[] = {
                { "5Rnd_127x108_APDS_Mag", 6 }
            };
        };

        class APDSExtraAmmo: WLCAmmo {
            level = 49;
            name = "APDS, Extra Ammo";
            magazines[] = {
                { "5Rnd_127x108_APDS_Mag", 9 }
            };
        };

        #include "west_optics_long.hpp"

        attachments[] = {};
    };
};