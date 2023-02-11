class cfgPatches
{
	class DrongosAPS
	{
		author = "Drongo";
		name = "Drongo's APS";
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {"CBA_main"};
	};
};


class Extended_PostInit_EventHandlers 
{
	dapsInit="execVM'\scripts\DAPS\Scripts\Start.sqf'";
};

#include "\scripts\DAPS\Menu\zCoreDefines.hpp"
#include "\scripts\DAPS\Menu\Dialog.hpp"


class cfgAmmo
{
	class HelicopterExploSmall;
	class DAPSblast: HelicopterExploSmall
	{
		model = "\A3\Weapons_f\Data\bullettracer\tracer_white";
		caliber = 0;
		CraterEffects = "GrenadeCrater";
		CraterWaterEffects = "ImpactEffectsWaterExplosion";
		directionalExplosion = 0; //0
		explosionAngle = 60; //60
		explosionDir = "explosionDir";
		explosionEffects = "HERocketExplosion";
		explosionEffectsDir = "explosionDir";
		explosionSoundEffect = "DefaultExplosion";
		explosionType = "explosive";
		hit = 1;
		indirectHit = 1;
		indirectHitRange = 5;
	};
	
	class DAPSblast2: HelicopterExploSmall
	{
		//model = "\A3\Weapons_f\Data\bullettracer\tracer_white";
		caliber = 0;
		CraterEffects = "GrenadeCrater";
		hit = 1;
		indirectHit = 1;
		indirectHitRange = 5;
	};
	
/*
		explosionEffects = "ExploAmmoExplosion";
		//explosionEffects = "HERocketExplosion";
		//ExplosionEffects = "HEShellExplosion";
		//explosionEffects = "DirectionalMineExplosion";
		//explosionEffects = "ATRocketExplosion";
		//explosionEffects = "ExploAmmoExplosionPlaneCAS";
		//explosionEffects = "GrenadeExplosion";
	
	class DAPSblast2: DAPSblast
	{
		explosionEffects = "HERocketExplosion";
	};
	
	class DAPSblast3: DAPSblast
	{
		ExplosionEffects = "HEShellExplosion";
	};
	
	class DAPSblast4: DAPSblast
	{
		explosionEffects = "DirectionalMineExplosion";
	};
	
	class DAPSblast5: DAPSblast
	{
		explosionEffects = "ATRocketExplosion";
	};
	
	class DAPSblast6: DAPSblast
	{
		explosionEffects = "ExploAmmoExplosionPlaneCAS";
	};
	
	class DAPSblast7: DAPSblast
	{
		explosionEffects = "GrenadeExplosion";
	};
	*/
};

// https://community.bistudio.com/wiki/CfgRemoteExec
class CfgRemoteExec
{
	// List of script functions allowed to be sent from client via remoteExec
	class Functions
	{
		// RemoteExec modes:
		// 0- turned off
		// 1- turned on, taking whitelist into account
		// 2- turned on, ignoring whitelist (default, because of backward compatibility)
		mode = 2;
		// Ability to send jip messages: 0-disabled, 1-enabled (default)
		jip = 1;
		class DAPS_fnc_RegisterVehicle{allowedTargets=0;};
		class DAPS_fnc_DeductAmmo{allowedTargets=0;};
		class DAPS_fnc_Blast{allowedTargets=0;};
		class DAPS_fnc_RearmAPS{allowedTargets=0;};
		class DAPS_fnc_DisableAPStype{allowedTargets=0;};
		class DAPS_fnc_DisableAPS{allowedTargets=0;};
		//class DAPS_fnc_Report{allowedTargets=0;};
	};
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class DAPS_faction: NO_CATEGORY
	{
		displayName="Drongo's APS";
		priority=0.1;
		side=7;
	};
};

class CfgVehicleClasses
{
	class DAPS_class
	{
		displayName="DAPS class";
	};
};

class CfgFunctions 
{
	class DAPS
	{
		tag="DAPS";
		class Start
		{
			file="\scripts\DAPS\functions";
			class AssignAPS{};
			class ForceRecheck{};
			//class ClearAllAPS{};
		};
	};
};

//https://community.bistudio.com/wiki/Modules
class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits
		{
			class Units;
		};
		class ModuleDescription;
	};
	
	class DAPS_Options: Module_F
	{
		author="Drongo";
		_generalMacro="DMP_Options";
		scope=2;
		displayName="DAPS Options";
		category="DAPS_faction";
		//function="DAPS_fnc_AssignAPS";
		functionPriority=1;
		isGlobal=1;
		isTriggerActivated=0;
		isDisposable=0;
		class Arguments
		{	
			class dapsDebug
			{
				displayName="Debug";
				description="Debug";
				typeName="STRING";
				class values
				{
					class TRUE
					{
						name="True";
						value="TRUE";
					};
					class FALSE
					{
						name="False";
						value="FALSE";
						default=1;
					};
				};
			};
/*			class dapsRearmCycle
  			{
				displayName="Rearm cycle";
				description="How many seconds between APS rearm checks";
				typeName="NUMBER";
				defaultValue="15";
			};*/
			class dapsBlastSize
			{
				displayName="Blast size";
				description="Size of APS blast";
				typeName="STRING";
				class values
				{
					class SMALL
					{
						name="Small";
						value="Small";
						default=1;
					};
					class BIG
					{
						name="Big";
						value="BIG";
					};
				};
			};
			class dapsClearAll
			{
				displayName="Clear all";
				description="Remove APS from all vehicles (Assign APS module will overwrite this)";
				typeName="STRING";
				class values
				{
					class TRUE
					{
						name="True";
						value="TRUE";
					};
					class FALSE
					{
						name="False";
						value="FALSE";
						default=1;
					};
				};
			};
		};
	};
	
	class DAPS_AssignAPS: Module_F
	{
		author="Drongo";
		_generalMacro="DMP_AssignAPS";
		scope=2;
		displayName="Assign APS type";
		category="DAPS_faction";
		function="DAPS_fnc_AssignAPS";
		functionPriority=1;
		isGlobal=1;
		isTriggerActivated=0;
		isDisposable=0;
		class Arguments
		{	
			class dapsAPSType
			{
				displayName="APS types";
				description="The type of APS that will be added to all vehicles of this type (NOTE: sync this to a dummy vehicle that will not be used in the mission)";
				typeName="STRING";
				class values
				{
					class None
					{
						name="None";
						value="NONE";
						default=1;
					};
					class Light
					{
						name="Light";
						value="Light";
					};
					class Medium
					{
						name="Medium";
						value="Medium";
					};
					class Heavy
					{
						name="Heavy";
						value="Heavy";
					};
					class TrophyLV
					{
						name="Trophy LV";
						value="TrophyLV";
					};
					class TrophyMV
					{
						name="Trophy MV";
						value="TrophyMV";
					};
					class TrophyHV
					{
						name="Trophy HV";
						value="TrophyHV";
					};
					class TrophyHVe
					{
						name="Trophy HVe";
						value="TrophyHVe";
					};
					class Arena
					{
						name="Arena";
						value="Arena";
					};
					class Drozd
					{
						name="Drozd";
						value="Drozd";
					};
					class Drozd_2
					{
						name="Drozd-2";
						value="Drozd-2";
					};
					class Afganit
					{
						name="Afganit";
						value="Afganit";
					};
					class AfganitE
					{
						name="AfganitE";
						value="AfganitE";
					};
					class IronFist
					{
						name="Iron Fist";
						value="IronFist";
					};
					class AMAP_ADS
					{
						name="AMAP-ADS";
						value="AMAP-ADS";
					};
					class Dazzler
					{
						name="Dazzler";
						value="Dazzler";
					};
					class Vitebsk
					{
						name="Vitebsk";
						value="Vitebsk";
					};
					class Nemesis
					{
						name="Nemesis";
						value="Nemesis";
					};
				};
			};
		};
	};
	
	class DAPS_ClearAllAPS: Module_F
	{
		author="Drongo";
		_generalMacro="DAPS_ClearAllAPS";
		scope=1;
		displayName="Clear all APS settings";
		category="DAPS_faction";
		functionPriority=1;
		isGlobal=1;
		isTriggerActivated=0;
		isDisposable=0;
	};

	class DAPS_ForceRecheck: Module_F
	{
		author="Drongo";
		_generalMacro="DAPS_ForceRecheck";
		scope=2;
		scopeCurator=2;
		displayName="Force recheck";
		category="DAPS_faction";
		function="DAPS_fnc_ForceRecheck";
		functionPriority=1;
		isGlobal=1;
		isTriggerActivated=0;
		isDisposable=0;
	};
};