class Extended_PostInit_EventHandlers 
{
	dapsInit="execVM'\scripts\DAPS\Scripts\Start.sqf'";
};

#include "\scripts\DAPS\Menu\zCoreDefines.hpp"
#include "\scripts\DAPS\Menu\Dialog.hpp"

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
};