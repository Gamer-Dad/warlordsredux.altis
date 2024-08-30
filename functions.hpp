class CfgFunctions {
	class MRTM {
		class Init {
			file = "scripts\MRTM";
			class settingsMenu {};
			class openMenu {};
		};
	};
	class KS
	{
		class normalFunctions
		{
			file = "scripts\VUnflip\functions";
			class unflipVehicle {};
			class unflipVehicleAddAction {};
			class isFlipped {};
		};
	};
	class APS
	{
		class APS
		{
			file = "scripts\APS\Scripts\APS";
			class SetupProjectiles {};
			class FiredProjectile {};
			class ServerHandleAPS {};
		};
		class Management
		{
			file = "scripts\APS\Scripts\Management";
			class RearmAPS {};
			class RegisterVehicle {};
		};
		class MISC
		{
			file = "scripts\APS\Scripts\Misc";
			class Active {};
			class CountAmmo {};
			class GetDirection {};
			class HasCharges {};
			class IsIRguided {};
			class IsLaserGuided {};
			class IsRadarGuided {};
			class IsVisualGuided {};
			class MisguideMissile {};
			class RelDir2 {};
			class getMaxAmmo {};
		};
		class Report
		{
			file = "scripts\APS\Scripts\Report";
			class Report {};
		};
	};
	class DIS {
		class SAM
		{
			file = "scripts\DIS";
			class Check {};
			class Frag {};
			class Maneuver {};
			class MissileCamera {};
			class OnSamFired {};
			class RegisterLauncher {};
			class StartMissileCamera {};
		};
	};
	class Fxr {
		class init
		{
			file = "scripts\Fxr";
			class openReportMenu {};
			class closeReportMenu {};
		};
	};
	class SQD {
		class Squads {
			file = "scripts\Squads";
			class client {};
			class initClient {};
			class initServer {};
			class menu {};
			class playerSelectionChanged {};
			class server {};
			class treeSelectionChanged {};
			class voice {};
		};
	};
	class WLM {
		class WLM {
			file = "Scripts\WLM\functions";
			class applyLoadoutAircraft {};
			class applyLoadoutVehicle {};
			class applyPylon {};
			class applyVehicle {};
			class changeHorn {};
			class constructAircraftPylons {};
			class constructPresetMenu {};
			class constructVehicleMagazine {};
			class initMenu {};
			class menuTextOverrides {};
			class moveSmokes {};
			class rearmAircraft {};
			class rearmVehicle {};
			class saveLoadout {};
			class selectLoadout {};
			class startRearmVehicle {};
			class switchUser {};
			class textureLists {};
			class textureSlots {};
			class wipePylonSaves {};
		};
	};
};