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
			targets[] = {1,0,0};
			args[] = {{"OBJECT"},{"OBJECT"}};
		};
	};
	class SETVELOCITYMODELSPACE {
		class SYNTAX1 
		{
			targets[] = {1,0,0};
			args[] = {{"OBJECT"},{"ARRAY"}};		
		};
	};
	class SETANIMSPEEDCOEF {
		class SYNTAX1 
		{
			targets[] = {1,0,0};
			args[] = {{"OBJECT"},{"SCALAR"}};
		};
	};
	class  SETDAMAGE {
		class SYNTAX1
		{
			targets[] = {1,0,0};
			args[] = {{"OBJECT"},{"SCALAR","ARRAY"}};
		};
	};
	class  SETDAMMAGE {
		class SYNTAX1
		{
			targets[] = {0,0,0};
			args[] = {{"OBJECT"},{"SCALAR"}};
		};
	};
	class SETPOSASLW
	{
		class SYNTAX1
		{
			targets[] = {1,0,0};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class SETPOSATL
	{
		class SYNTAX1
		{
			targets[] = {1,0,0};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class SETVEHICLEPOSITION
	{
		class SYNTAX1
		{
			targets[] = {1,0,0};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class SETVELOCITY
	{
		class SYNTAX1
		{
			targets[] = {1,0,0};
			args[] = {{"OBJECT"},{"ARRAY"}};	
		};
	}; 
};