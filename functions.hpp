class CfgFunctions {
	class MRTM {
		class Init {
			file = "scripts\MRTM";
			class settingsMenu {
				ext = ".fsm";
				postInit = 1;
				headerType = -1;
			};
			class openMenu {};
		};
	};
	class GOM {
		class init
		{
			file = "scripts\GOM\functions";
			class aircraftLoadoutInit {preInit = 1;};
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
			class Frag {};
			class SAMFired {};
			class RegisterSAM {};
			class IsSam {};
			class SAMmaneuver {};
		};
	};
};