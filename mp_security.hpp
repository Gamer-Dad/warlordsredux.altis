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

		class DAPS_fnc_Dazzler {
			allowedTargets = 2;
		};

		class DIS_fnc_SAMmaneuver {
			allowedTargets = 2;
		};

		class KS_fnc_unflipVehicle {
			allowedTargets = 2;
		};

		class BIS_fnc_WL2_forfeitHandleServer {
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

		class BIS_fnc_WL2_killRewardClient {
			allowedTargets = 1;
		};

		class BIS_fnc_advHint {
			allowedTargets = 1;
		};

		class DAPS_fnc_Report {
			allowedTargets = 1;
		};

		class DAPS_fnc_PopSmoke {
			allowedTargets = 1;
		};

		class DAPS_fnc_PopSmokeTurn {
			allowedTargets = 1;
		};

		class BIS_fnc_WL2_orderSavedLoadout {
			allowedTargets = 1;
		};

		class BIS_fnc_WL2_orderLastLoadout {
			allowedTargets = 1;
		};

		//All allowed
		class BIS_fnc_WL2_newAssetHandle {
			allowedTargets = 0;
		};

		class BIS_fnc_WL2_handleEnemyCapture {
			allowedTargets = 0;
		};

		class BIS_fnc_WL2_sectorScanHandle {
			allowedTargets = 0;
		};

		class BIS_fnc_WL2_forfeitHandle {
			allowedTargets = 0;
		};

		//Don't touch
		class BIS_fnc_effectKilledAirDestruction {allowedTargets = 0; jip = 0;};
		class BIS_fnc_effectKilledSecondaries {allowedTargets = 0; jip = 0;};
		class BIS_fnc_objectVar {allowedTargets = 0; jip = 0;};
		class BIS_fnc_setCustomSoundController {allowedTargets = 0; jip = 0;};
		class BIS_fnc_debugConsoleExec {allowedTargets = 0; jip = 0;};
	};

	class Commands {
		mode = 1; // Whitelist only

		//Server only
		class setVehiclePosition {
			allowedTargets = 2;
		};

		//Client only

		//All allowed
		class setVehicleAmmoDef {
			allowedTargets = 0;
		};

		class setVehicleVarName {
			allowedTargets = 0;
		};

		class systemChat {
			allowedTargets = 0;
		};

		class setPylonLoadOut {
			allowedTargets = 0;
		};

		class SetAmmoOnPylon {
			allowedTargets = 0;
		};

		class setFuel {
			allowedTargets = 0;
		};

		class setFuelCargo {
			allowedTargets = 0;
		};

		class setRepairCargo {
			allowedTargets = 0;
		};

		class setAmmoCargo {
			allowedTargets = 0;
		};

		class setPylonsPriority {
			allowedTargets = 0;
		};

		class hint {
			allowedTargets = 0;
		};
	};
};

class CfgDisabledCommands {
	//Other
	class DISABLECOLLISIONWITH {
		class SYNTAX1 
		{
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"OBJECT"}};
		};
	};

	class CREATEUNIT
	{
		class SYNTAX1
		{
			targets[] = {1,0,1};
			args[] = {{"STRING"}, {"ARRAY"}};
		};
	};

	class SKIPTIME {
		class SYNTAX1
		{
			targets[] = {1,0,1};
			args[] = {{}, {"SCALAR"}};
		};		
	};

	class DRAWLINE3D {
		class SYNTAX1 {
			targets[] = {1,0,1};
			args[] = {{}, {"ARRAY"}};
		};
	};

	class SETCUSTOMAIMCOEF {
		class SYNTAX1 {
			targets[] = {1,0,1};
			args[] = {{"OBJECT"}, {"SCALAR"}};
		};
	};

	class REMOVEALLWEAPONS {
		class SYNTAX1 {
			targets[] = {1,0,1};
			args[] = {{}, {"OBJECT"}};
		};
	};

	class ADDWEAPONGLOBAL {
		class SYNTAX1 {
			targets[] = {1,0,1};
			args[] = {{"OBJECT"}, {"STRING"}};
		};
	};

	class CREATEAGENT {
		class SYNTAX1 {
			targets[] = {1,0,1};
			args[] = {{}, {"ARRAY"}};
		};
	};

	//Velocity
	class SETVELOCITYTRANSFORMATION {
		class SYNTAX1 {
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class ADDFORCE {
		class SYNTAX1 {
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class SETVELOCITYMODELSPACE {
		class SYNTAX1 
		{
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"ARRAY"}};		
		};
	};
	class SETANIMSPEEDCOEF {
		class SYNTAX1 
		{
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"SCALAR"}};
		};
	};

	class ENABLEFATIGUE {
		class SYNTAX1 {
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"BOOL"}};	
		};		
	};

	//Damage
	class SETHIT {
		class SYNTAX1 {
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class SETHITINDEX {
		class SYNTAX1 {
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class SETHITPOINTDAMAGE {
		class SYNTAX1 {
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class SETDAMAGE {
		class SYNTAX1
		{
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"SCALAR", "ARRAY"}};
		};
	};
	class SETDAMMAGE {
		class SYNTAX1
		{
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"SCALAR"}};
		};
	};

	//Positions
	class SETPOSASLW
	{
		class SYNTAX1
		{
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class SETPOSATL
	{
		class SYNTAX1
		{
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class SETPOSWORLD
	{
		class SYNTAX1
		{
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
};