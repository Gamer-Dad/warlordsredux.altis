/*
DAPS includes 15 types of APS:

Light: Protection from rockets (2 charges). 20 meter MMD (Minimum Defeat Distance).
Medium: Protection from rockets and missiles (4 charges). 20 meter MMD.
Heavy: Protection from rockets, missiles and tank shells (6 charges). 20 meter MMD.
Trophy LV: Protection from rockets (4 charges left, 4 charges right). 30 meter MMD.
Trophy MV: Protection from rockets and missiles (3 charges left, 3 charges right). 30 meter MMD.
Trophy HV: Protection from rockets and missiles (5 charges left, 5 charges right). 30 meter MMD.
Trophy HVe: Protection from rockets, missiles and shells (5 charges left, 5 charges right). 30 meter MMD.
Dazzler: Protection from rockets and missiles that use IR or laser guidance (unlimited charges).
Arena: Protection from rockets and missiles (11 charges each side, only covers the front 300 degrees). 30 meter MMD.
Drozd: Protection from rockets and missiles (4 charges each side, only covers the front 60 degrees). 30 meter MMD.
Drozd-2: Protection from rockets and missiles (4 charges each side, only covers the front 120 degrees). 30 meter MMD.
Afganit: Protection from rockets, missiles (5 charges each side, only covers the front 120 degrees). 30 meter MMD.
AfganitE: Protection from rockets, missiles and shells (5 charges each side, only covers the front 120 degrees). 30 meter MMD.
Iron Fist: Protection from rockets and missiles (2 charges left, 2 charges right). 50 meter MMD.
AMAP-ADS: Protection from rockets and missiles and (possibly) HE shells (5 charges left, 5 charges right). 5 meter MMD.

The light, medium and heavy APS are not specifically based on any real-world system, but are intended as generalizations of various systems in use or development. They provide 360 degree protection.

Vanilla NATO and AAF MRAPs use Trophy LV.
Vanilla NATO and AAF IFVs use Trophy MV.
NATO MBTs use Trophy HV.
AAF MBTs use AMAP-ADS.
Vanilla MRAPs use Light.
Vanilla CSAT IFVs use Medium.
The T-100 uses Drozd-2.
The T-140 uses AfganitE.
Some RHS M1 MBT variants use Trophy HV.
Some RHS M2 IFV variants use Trophy MV.
CUP and MEC T-90s use dazzler.
MEC T-72s use dazzler.

As of 0.86 the following vehicles are added (thanks xxsogramboxx):

Trophy HV:
Burnes_M1A1_MEU_01_Public
Burnes_M1A1_MEU_02_Public
EUSAD_CE_leopard_2A7
EUSAD_DAGUET_leopard_2A7
sfp_strv122
sfp_strv122b
BWA3_Leopard2_Tropen
BWA3_Leopard2_Fleck

Iron Fist:
Burnes_FV4034_01
Burnes_FV4034_02

Afganit:
rhs_t90am_tv
rhs_t90sm_tv
Arena, Drozd, Drozd-2 and Afganit/AfganitE can not engage top-attack missiles (basically missiles that are 2 or more meters higher than the vehicle).

AfganitE and TrophyHVe are capable of stopping tank rounds.

AMAP-ADS is capable of stopping HE tank rounds.

The dazzler does not destroy incoming projectiles, but rather causes those that use IR or laser guidance to veer away and (hopefully) miss the vehicle. Dazzlers have unlimited charges.

Outgoing fire and low-caliber weapons should not trigger the APS. Be warned that firing RPGs while standing next to a friendly vehicle with APS may trigger the friendly APS.
*/



dapsLight=["O_MRAP_02_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_T_MRAP_02_F","O_T_MRAP_02_gmg_F","O_T_MRAP_02_hmg_F"];
dapsMedium=["O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_v2_F","O_T_APC_Tracked_02_cannon_ghex_F","O_T_APC_Wheeled_02_rcws_v2_ghex_F",
"O_SFIA_APC_Tracked_02_cannon_lxWS",
"VME_PLA_ZTZ99A","VME_PLA_ZTZ99","VME_PLA_ZTZ99_DES","VME_PLA_ZTZ99A_DES",
"O_ZTZ99A","O_ZTZ96B","O_ZTQ15","O_ZBD04A","O_ZBL09","O_ZTL11"
];
dapsHeavy=[];
dapsTrophyLV=["B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_T_MRAP_01_F","B_T_MRAP_01_gmg_F","B_T_MRAP_01_hmg_F",
"I_MRAP_03_F","I_MRAP_03_gmg_F","I_MRAP_03_hmg_F",
"B_D_MRAP_01_hmg_lxWS",
"B_D_MRAP_01_lxWS",
"B_D_MRAP_01_hmg_lxWS",
"B_UN_MRAP_01_lxWS"
];
dapsTrophyMV=[
"B_APC_Wheeled_01_cannon_F","B_T_APC_Wheeled_01_cannon_F",
"B_AFV_Wheeled_01_cannon_F","B_AFV_Wheeled_01_up_cannon_F","B_T_AFV_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_up_cannon_F",
"I_APC_Wheeled_03_cannon_F","I_APC_tracked_03_cannon_F",
"I_APC_Wheeled_03_Cannon_LDF_F","I_E_APC_tracked_03_cannon_F",
"B_APC_Tracked_01_rcws_F",
"B_T_APC_Tracked_01_rcws_F",
"B_D_APC_Wheeled_01_atgm_lxWS",
"B_D_APC_Wheeled_01_cannon_lxWS",
"B_D_APC_Wheeled_01_command_lxWS",
"B_ION_APC_Wheeled_01_command_lxWS",
"B_UN_APC_Wheeled_01_command_lxWS",
"RHS_M2A2_wd",
"RHS_M2A2",
"RHS_M2A2_BUSKI_WD",
"RHS_M2A2_BUSKI",
"RHS_M2A3_wd",
"RHS_M2A3",
"RHS_M2A3_BUSKI_wd",
"RHS_M2A3_BUSKI",
"RHS_M2A3_BUSKIII_wd",
"RHS_M2A3_BUSKIII",
"RHS_M6_wd",
"RHS_M6"
];
dapsTrophyHV=[
"B_MBT_01_arty_F",
"O_MBT_02_arty_F",
"O_MBT_02_cannon_F",
"O_T_MBT_02_cannon_ghex_F",
"B_MBT_01_cannon_F",
"B_T_MBT_01_cannon_F",
"B_MBT_01_TUSK_F",
"B_T_MBT_01_TUSK_F",
"O_MBT_04_cannon_F",
"O_MBT_04_command_F",
"O_T_MBT_04_cannon_F",
"O_T_MBT_04_command_F",
"O_APC_Tracked_02_AA_F",
"B_APC_Tracked_01_AA_F",
"rhsusf_m1a1aimwd_usarmy",
"rhsusf_m1a1aimd_usarmy",
"rhsusf_m1a1aim_tuski_wd",
"rhsusf_m1a1aim_tuski_d",
"rhsusf_m1a1fep_wd",
"rhsusf_m1a1fep_d",
"rhsusf_m1a2sep1wd_usarmy",
"rhsusf_m1a2sep1d_usarmy",
"rhsusf_m1a2sep1tuskiwd_usarmy",
"rhsusf_m1a2sep1tuskid_usarmy",
"rhsusf_m1a2sep1tuskiiwd_usarmy",
"rhsusf_m1a2sep1tuskiid_usarmy",
"MEC_IDF_Merkava",
"MEC_IDF_Merkava4",
"WIC_IDF_Merkava",
"WIC_IDF_Merkava4",
"DSF_IDF_Merkava",
"DSF_IDF_Merkava4",
"Burnes_M1A1_MEU_01_Public",
"Burnes_M1A1_MEU_02_Public",
"EUSAD_CE_leopard_2A7",
"EUSAD_DAGUET_leopard_2A7",
"sfp_strv122",
"sfp_strv122b",
"BWA3_Leopard2_Tropen",
"BWA3_Leopard2_Fleck",
"CUP_B_M1A2C_Desert_US_Army","CUP_B_M1A2C_TUSK_Desert_US_Army","CUP_B_M1A2C_TUSK_II_Desert_US_Army",
"CUP_B_M1A2C_OD_US_Army","CUP_B_M1A2C_TUSK_OD_US_Army","CUP_B_M1A2C_TUSK_II_OD_US_Army",
"CUP_B_M1A2C_OD_US_Army","CUP_B_M1A2C_TUSK_OD_US_Army","CUP_B_M1A2C_TUSK_II_OD_US_Army",
"CUP_B_M1A2C_Woodland_US_Army","CUP_B_M1A2C_TUSK_Woodland_US_Army","CUP_B_M1A2C_TUSK_II_Woodland_US_Army"
];
dapsTrophyHVe=[
"West_Abrams"
];
dapsArena=[
"min_rf_t_14",
"min_rf_t_15"
];
dapsDrozd=[
"rhs_bmd2m"
];
dapsDrozd2=[

];
dapsAfganit=[
"rhs_t72be_tv",
"rhs_bmd4ma_vdv",
"rhs_t90am_tv",
"rhs_t90sm_tv"
//,
//"rhs_t14_tv",
//"rhs_t15_tv"
];
dapsAfganitE=[
"O_SFIA_MBT_02_cannon_lxWS",
"rhs_sprut_vdv"
];
dapsDazzler=["O_MBT_02_cannon_F","CUP_O_T90_RU","MEC_SAA_T72","MEC_SAA_T90","WIC_SAA_T72","WIC_SAA_T90","rhs_t90a_tv","rhs_t90_tv","rhs_t80uk","CUP_O_BMP3_RU"];
dapsIronFist=[
"Burnes_FV4034_01",
"Burnes_FV4034_02"
];
dapsAMAP=["I_MBT_03_cannon_F","I_MBT_03_Cannon_LDF_F"];