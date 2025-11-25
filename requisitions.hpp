/*
Repository for all CfgVehicle related configurations.

class CfgVehicleClassName {
    aircraftSpawn = number (0|1);       // For populating independent sectors, aircraft units.
    allowPylonMagazines[] = array;      // CfgMagazine classes to allow on pylons of aircraft.
    aps = number;                       // Active Protection System, 0 = none, 1 = light, 2 = medium, 3 = heavy, 4 = dazzler
    capValue = number;                  // Value of the vehicle for calculating team's sector capture strength.
    cost = number;                      // Cost of the vehicle, not shown in buy menu if 0.
    demolishable = number (#);          // Max demolishable health. For buildables.
    description = string;               // Description override for vehicle in buy menu.
    disallowMagazines[] = array;        // CfgMagazine classes to disallow in the vehicle.
    flagOffset = array;                 // when set, if the vehicle spawns a flag, its offset will use this.
    garbageCollect = number (0|1);      // Whether we manually delete the vehicle when it's destroyed. For buildables.
    hasHMD = number (0|1);              // Whether the vehicle supports the helmet mounted display system.
    hasScanner = number (0|1);          // Whether the vehicle has a scanner.
    hasReconOptics = number (0|1|2);    // Whether the vehicle has recon optics.
    hasAWACS = number (0|1);            // Whether the vehicle has an AWACS system.
    hasTurretVisualizer = number (0|1); // Whether the vehicle has a turret visualizer.
    isLight = number (0|1);             // Whether the vehicle is considered lightweight.
    loadable = array;                   // when set, the vehicle can be loaded into a flatbed. The array is the offset.
    name = string;                      // Name override for vehicle in buy menu.
    offset[] = array;                   // Offset for placing the vehicle after buying, only valid for some vehicle types.
    rearm = number;                     // Rearm timer in seconds.
    requirements[] = array;             // Requirements for deployment (A = Airport, H = Helipad, W = Harbor).
    spawn = text;                       // If the CfgVehicleClassName is a variant, this is the base class to spawn.
    threatDetection = number;           // Threat detection radius.
    textures[] = array;                 // Skin textures for the vehicle.
    unitSpawn = number (0|1);           // For populating independent sectors, soldier units.
    variant = number (0|1);             // If the vehicle is a variant, set this to 1.
    vehicleSpawn = number (0|1);        // For populating independent sectors, vehicle units.
    WLTurretDefaults[] = classes;       // Turret defaults allows replacing weapons/ammo from a turret of a vehicle.
};

Turret defaults allows replacing weapons/ammo from a turret of a vehicle.
Note: Multiple turrets can be modified by adding more classes.
Note 2: The order of operation is remove magazines, remove weapons, add magazines, add weapons. This allows for skipping reload.

class NameItAnything: WLTurretDefaults {
    addMagazines[] = {};             // CfgMagazine classes to add, same format as above.
    addWeapons[] = {};               // CfgWeapon classes to add, same format as above.
    hideTurret = number (0|1);       // Hide the turret.
    reloadOverride = number;         // Override the reload time of the vehicle's weapons. Can only be shorter than default, and only single weapon turrets.
    removeMagazines[] = {            // CfgMagazine classes to remove.
        "magazine_classname",        // Note: For now, we remove all magazines of this class from the turret.
        ...
    };
    removeWeapons[] = {};            // CfgWeapon classes to remove, same format as above.
    turret[] = { 0 };                // Turret path to modify.
};

*/

class WLTurretDefaults {};

class CfgWLRequisitionPresets {
    class A3ReduxAll {
        #include "config\west.hpp"
        #include "config\east.hpp"
        #include "config\independent.hpp"
    };
};