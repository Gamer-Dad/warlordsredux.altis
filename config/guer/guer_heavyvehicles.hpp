class HeavyVehicles {
    class I_MBT_03_cannon_F {
        aps = 3;
        capValue = 5;
        cost = 8000;
        vehicleSpawn = 1;
    };  // "MBT-52 Kuma"

    class I_APC_Wheeled_03_cannon_F {
        aps = 2;
        capValue = 5;
        cost = 3000;
        vehicleSpawn = 1;

        class Gunner: WLTurretDefaults {
            addMagazines[] = {
                "5Rnd_GAT_missiles",
                "5Rnd_GAT_missiles"
            };
            addWeapons[] = {
                "missiles_titan"
            };
            removeMagazines[] = {
                "2Rnd_GAT_missiles"
            };
            removeWeapons[] = {
                "missiles_titan"
            };
            turret[] = { 0 };
        };
    };  // "AFV-4 Gorgon"

    class I_APC_tracked_03_cannon_F {
        aps = 3;
        capValue = 5;
        cost = 5000;
        vehicleSpawn = 1;
    };  // "FV-720 Mora"
};