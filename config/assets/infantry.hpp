class Infantry {
    category = "Infantry";
};

class Basic_Infantry: Infantry {
    cost = 10;
};
class Specialized_Infantry: Infantry {
    cost = 50;
};
class Heavy_Infantry: Infantry {
    cost = 100;
};
class Special_Infantry: Infantry {
    cost = 150;
};

// Basic, West
class B_Helipilot_F: Basic_Infantry {
    side[] = {"west"};
};
class B_Pilot_F: Basic_Infantry {
    side[] = {"west"};
};
class B_crew_F: Basic_Infantry {
    side[] = {"west"};
};
class B_medic_F: Basic_Infantry {
    side[] = {"west"};
};
class B_Soldier_F: Basic_Infantry {
    side[] = {"west"};
};
class B_Soldier_A_F: Basic_Infantry {
    side[] = {"west"};
};
class B_soldier_PG_F: Basic_Infantry {
    side[] = {"west"};
};
class B_CTRG_Soldier_tna_F: Basic_Infantry {
    side[] = {"west"};
};

// Basic, East
class O_Helipilot_F: Basic_Infantry {
    side[] = {"east"};
};
class O_Pilot_F: Basic_Infantry {
    side[] = {"east"};
};
class O_crew_F: Basic_Infantry {
    side[] = {"east"};
};
class O_medic_F: Basic_Infantry {
    side[] = {"east"};
};
class O_Soldier_F: Basic_Infantry {
    side[] = {"east"};
};
class O_Soldier_A_F: Basic_Infantry {
    side[] = {"east"};
};
class O_soldier_PG_F: Basic_Infantry {
    side[] = {"east"};
};
class O_V_Soldier_hex_F: Basic_Infantry {
    side[] = {"east"};
};

// Specialized, West
class B_diver_F: Specialized_Infantry {
    side[] = {"west"};
};
class B_soldier_AR_F: Specialized_Infantry {
    side[] = {"west"};
};
class B_Soldier_GL_F: Specialized_Infantry {
    side[] = {"west"};
};
class B_soldier_M_F: Specialized_Infantry {
    side[] = {"west"};
};
class B_diver_exp_F: Specialized_Infantry {
    side[] = {"west"};
};
class B_HeavyGunner_F: Specialized_Infantry {
    side[] = {"west"};
};
class B_Sharpshooter_F: Specialized_Infantry {
    side[] = {"west"};
};

// Specialized, East
class O_diver_F: Specialized_Infantry {
    side[] = {"east"};
};
class O_soldier_AR_F: Specialized_Infantry {
    side[] = {"east"};
};
class O_Soldier_GL_F: Specialized_Infantry {
    side[] = {"east"};
};
class O_soldier_M_F: Specialized_Infantry {
    side[] = {"east"};
};
class O_diver_exp_F: Specialized_Infantry {
    side[] = {"east"};
};
class O_HeavyGunner_F: Specialized_Infantry {
    side[] = {"east"};
};
class O_Sharpshooter_F: Specialized_Infantry {
    side[] = {"east"};
};

// Heavy, West
class B_soldier_repair_F: Heavy_Infantry {
    side[] = {"west"};
};
class B_soldier_LAT_F: Heavy_Infantry {
    side[] = {"west"};
};
class B_soldier_LAT2_F: Heavy_Infantry {
    side[] = {"west"};
};
class B_sniper_F: Heavy_Infantry {
    side[] = {"west"};
};

// Heavy, East
class O_soldier_repair_F: Heavy_Infantry {
    side[] = {"east"};
};
class O_soldier_LAT_F: Heavy_Infantry {
    side[] = {"east"};
};
class O_sniper_F: Heavy_Infantry {
    side[] = {"east"};
};

// Special, West
class B_Captain_Dwarden_F: Special_Infantry {
    side[] = {"west"};
};
class B_soldier_AA_F: Special_Infantry {
    side[] = {"west"};
};
class B_soldier_AT_F: Special_Infantry {
    side[] = {"west"};
};
class B_CTRG_Soldier_LAT_tna_F: Special_Infantry {
    side[] = {"west"};
};

// Special, East
class O_Soldier_AA_F: Special_Infantry {
    side[] = {"east"};
};
class O_soldier_AT_F: Special_Infantry {
    side[] = {"east"};
};
class O_V_Soldier_LAT_hex_F: Special_Infantry {
    side[] = {"east"};
};
class O_soldier_HAT_F: Special_Infantry {
    side[] = {"east"};
};

// Guer
class Green_Infantry: Infantry {
    cost = 20;
    unitSpawn = 1;
    sides[] = {"guer"};
};

class I_soldier_F: Green_Infantry {};
class I_Soldier_GL_F: Green_Infantry {};
class I_Soldier_AR_F: Green_Infantry {};
class I_Soldier_AAR_F: Green_Infantry {};
class I_Soldier_TL_F: Green_Infantry {};
class I_Soldier_A_F: Green_Infantry {};
class I_Soldier_M_F: Green_Infantry {};
class I_Soldier_LAT_F: Green_Infantry {};
class I_Soldier_LAT2_F: Green_Infantry {};
class I_Soldier_SL_F: Green_Infantry {};
class I_Soldier_AAT_F: Green_Infantry {};
class I_Soldier_AAA_F: Green_Infantry {};
class I_Soldier_AT_F: Green_Infantry {};
class I_Soldier_AA_F: Green_Infantry {};
class I_medic_F: Green_Infantry {};
class I_Soldier_repair_F: Green_Infantry {};
class I_engineer_F: Green_Infantry {};
class I_Soldier_exp_F: Green_Infantry {};
class I_officer_F: Green_Infantry {};
class I_Spotter_F: Green_Infantry {};
class I_Sniper_F: Green_Infantry {};