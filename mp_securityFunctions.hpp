// MP Security
class CfgRemoteExec {
	class Functions {
		mode = 1;
		jip = 1;

		class APS_fnc_Report {
			allowedTargets = 2;
		};

		class BIS_fnc_WL2_handleClientRequest {
			allowedTargets = 2;
		};

		class KS_fnc_unflipVehicle {
			allowedTargets = 2;
		};

		class BIS_fnc_WL2_forfeitHandleServer {
			allowedTargets = 2;
		};

		class MRTM_fnc_invite {
			allowedTargets = 2;
		};

		class MRTM_fnc_accept {
			allowedTargets = 2;
		};

		class BIS_fnc_WL2_forgiveTeamkill {
			allowedTargets = 2;
		};

		class MRTM_fnc_execCode {
			allowedTargets = 2;
		};

		class BIS_fnc_WL2_forfeitHandle {
			allowedTargets = 0;
		};

		class DIS_fnc_SAMFired {
			allowedTargets = 0;
		};

		class MRTM_fnc_leaveGroup {
			allowedTargets = 0;
		};

		//Don't touch
		class BIS_fnc_effectKilledAirDestruction {allowedTargets = 0; jip = 0;};
		class BIS_fnc_effectKilledSecondaries {allowedTargets = 0; jip = 0;};
		class BIS_fnc_objectVar {allowedTargets = 0; jip = 0;};
		class BIS_fnc_setCustomSoundController {allowedTargets = 0; jip = 0;};
		class BIS_fnc_debugConsoleExec {allowedTargets = 0; jip = 0;};
		class BIS_fnc_setIdentity {allowedTargets = 0; jip = 0;};
		class BIS_fnc_curatorRespawn {allowedTargets = 0; jip = 0;};
		class BIs_fnc_fire {allowedTargets = 0; jip = 0;};
	};

	class Commands {
		mode = 1;

		class setVehicleAmmoDef {
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

		class setPylonsPriority {
			allowedTargets = 0;
		};

		class lock {
			allowedTargets = 0;
		};

		class selectLeader {
			allowedTargets = 0;
		};

		class setRepairCargo {
			allowedTargets = 0;
		};

		class setAmmoCargo {
			allowedTargets = 0;
		};

		class removeWeaponGlobal {
			allowedTargets = 0;
		};

		class systemChat {
			allowedTargets = 0;
		};

		class diag_log {
			allowedTargets = 2;
		};
	};
};