// MP Security
class CfgRemoteExec {
	class Functions {
		mode = 2;
		jip = 1;

		class WL2_fundsDatabaseWrite {
			allowedTargets = 1;
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
			targets[] = {0,0,0};
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