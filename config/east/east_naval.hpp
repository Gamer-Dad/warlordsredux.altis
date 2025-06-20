class Naval {
    class C_Scooter_Transport_01_F {
        cost = 50;
        description = "Personal watercraft (PWC) of the sit-down type.";
        requirements[] = {"W"};
    };	// "Water scooter"

    class O_Boat_Transport_01_F {
        cost = 100;
        description = "An inflatable boat, often nicknamed 'Rubber Duck', is a lightweight boat constructed from tubes containing pressurized gas.";
        requirements[] = {"W"};
    };	// "Assault Boat"

    class O_SDV_01_F {
        cost = 250;
        description = "The SDV is a manned submersible vehicle used to transport teams of divers over long distances under water.";
        requirements[] = {"W"};
    };	// "SDV"

    class O_Boat_Armed_01_hmg_F {
        cost = 500;
        description = "This V shaped boat with two powerful jet impellers excels in speed and maneuverability.<br /><br />Basic Controls:<br />Press %CYCLE_WEAPON% to cycle between weapons.<br />Press %ZOOM_IN% and %ZOOM_OUT% to zoom in or out.<br />Press %LASE_RANGE% to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press %PANEL_LEFT% and %PANEL_RIGHT% to adjust system panels for the left or right side of your screen.<br />Press %PANELMODE_LEFT% or %PANELMODE_RIGHT% to adjust modes (if available) for system panels.";
        rearm = 400;
        requirements[] = {"W"};
    };	// "Speedboat HMG"

    class O_Boat_Armed_01_autocannon_F {
        cost = 1000;
        description = "Alligator Attack Boat is an upgraded, heavily-armed variant of the Speedboat.<br /><br />Basic Controls:<br />Press %CYCLE_WEAPON% to cycle between weapons.<br />Press %ZOOM_IN% and %ZOOM_OUT% to zoom in or out.<br />Press %LASE_RANGE% to measure distance and automatically adjust gun elevation (Fire Control System).<br />Press %LOCK_TARGET% to lock onto target.<br />Press %PANEL_LEFT% and %PANEL_RIGHT% to adjust system panels for the left or right side of your screen.<br />Press %PANELMODE_LEFT% or %PANELMODE_RIGHT% to adjust modes (if available) for system panels.";
        disallowMagazines[] = {
            "4Rnd_GAA_missiles"
        };
        name = "Alligator Attack Boat";
        rearm = 400;
        requirements[] = {"W"};
        spawn = "O_Boat_Armed_01_hmg_F";
        variant = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "60Rnd_20mm_HE_shells",
                "60Rnd_20mm_HE_shells",
                "60Rnd_20mm_AP_shells",
                "60Rnd_20mm_AP_shells",
                "5Rnd_GAT_missiles",
                "5Rnd_GAT_missiles"
            };
            addWeapons[] = {
                "cannon_20mm",
                "missiles_titan"
            };
            removeMagazines[] = {
                "96Rnd_40mm_G_belt"
            };
            removeWeapons[] = {
                "GMG_40mm"
            };
            turret[] = { 0 };
        };
    };

    class O_Boat_Transport_02_F {
        cost = 1500;
        description = "The Supply RHIB is a fast, agile transport boat that can deploy a Forward Operating Base supplies supply crate which can be used in the creation of a Forward Operating Base.<br /><br />How To Use:<br /> - Place the Supply RHIB in the water.<br /> - Look towards the Supply RHIB and select the ""Deploy Crate"" option to deploy Forward Base Supplies.";
        name = "Supply RHIB";
        requirements[] = {"W"};
        spawn = "I_C_Boat_Transport_02_F";
    };
};