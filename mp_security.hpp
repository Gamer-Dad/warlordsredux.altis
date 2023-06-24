// MP Security
class CfgRemoteExec {
	class Functions {
		mode = 1; // Whitelist only
		jip = 1;

		//Server only
		class BIS_fnc_WL2_handleClientRequest {
			allowedTargets = 2;
		};

		class BIS_fnc_WL2_sub_deleteAsset {
			allowedTargets = 2;
		};

		class DAPS_fnc_Generic {
			allowedTargets = 2;
		};

		class DAPS_fnc_MisguideMissile {
			allowedTargets = 2;
		};

		class DIS_fnc_SAMmaneuver {
			allowedTargets = 2;
		};

		class GOM_fnc_handleResources {
			allowedTargets = 2;
		};

		class KS_fnc_unflipVehicle {
			allowedTargets = 2;
		};

		//Client only
		class BIS_fnc_WL2_refreshOSD {
			allowedTargets = 1;
		};

		class BIS_fnc_WL2_orderArsenal {
			allowedTargets = 1;
		};

		class BIS_fnc_WL2_displayCPtransfer {
			allowedTargets = 1;
		};

		class DAPS_fnc_Report {
			allowedTargets = 1;
		};

		//All allowed
		class BIS_fnc_WL2_newAssetHandle {
			allowedTargets = 0;
		};
	};
};

class CfgDisabledCommands {
	class DISABLECOLLISIONWITH {
		class SYNTAX1 
		{
			targets[] = {0,1,0};
			args[] = {{"OBJECT"},{"OBJECT"}};
		};
	};

	//Velocity
	class SETVELOCITYTRANSFORMATION {
		class SYNTAX1 {
			targets[] = {0,1,0};
			args[] = {{"OBJECT"},{"ARRAY"}};			
		};
	};
	class ADDFORCE {
		class SYNTAX1 {
			targets[] = {0,1,0};
			args[] = {{"OBJECT"},{"ARRAY"}};			
		};
	};
	class SETVELOCITYMODELSPACE {
		class SYNTAX1 
		{
			targets[] = {0,1,0};
			args[] = {{"OBJECT"},{"ARRAY"}};		
		};
	};
	class SETANIMSPEEDCOEF {
		class SYNTAX1 
		{
			targets[] = {0,1,0};
			args[] = {{"OBJECT"},{"SCALAR"}};
		};
	};

	//Damage
	class SETHIT {
		class SYNTAX1 {
			targets[] = {0,1,0};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class SETHITINDEX {
		class SYNTAX1 {
			targets[] = {0,1,0};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class SETHITPOINTDAMAGE {
		class SYNTAX1 {
			targets[] = {0,1,0};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class SETDAMAGE {
		class SYNTAX1
		{
			targets[] = {0,1,0};
			args[] = {{"OBJECT"},{"SCALAR", "ARRAY"}};
		};
	};
	class SETDAMMAGE {
		class SYNTAX1
		{
			targets[] = {0,1,0};
			args[] = {{"OBJECT"},{"SCALAR"}};
		};
	};

	//Positions
	class SETPOS
	{
		class SYNTAX1
		{
			targets[] = {0,1,0};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class SETPOSASLW
	{
		class SYNTAX1
		{
			targets[] = {0,1,0};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class SETPOSATL
	{
		class SYNTAX1
		{
			targets[] = {0,1,0};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class SETPOSASL
	{
		class SYNTAX1
		{
			targets[] = {0,1,0};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class SETPOSWORLD
	{
		class SYNTAX1
		{
			targets[] = {0,1,0};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class SETVEHICLEPOSITION
	{
		class SYNTAX1
		{
			targets[] = {0,1,0};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
};