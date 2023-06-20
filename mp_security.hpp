// MP Security
class CfgRemoteExec {
	class Functions {
		mode = 2;
		jip = 1;

		class WL2_fundsDatabaseWrite {
			allowedTargets = 2;
		};
	};
};

class CfgDisabledCommands {
	class SETVELOCITYMODELSPACE {
		class SYNTAX1 
		{
			targets[] = {1,0,0};
			args[] = {{"OBJECT"},{"ARRAY"}};		
		};
	};
	class SETVELOCITY {
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
	class SETPOS {
		class SYNTAX1
		{
			targets[] = {1,0,0};
			args[] = {{"OBJECT"},{"ARRAY"}};
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
	class SETPOSASL
	{
		class SYNTAX1
		{
			targets[] = {1,0,0};
			args[] = {{"OBJECT"},{"ARRAY"}};
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
	class SETPOSWORLD
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
	class CREATEUNIT
	{
		class SYNTAX1
		{
			targets[] = {1,0,0};
			args[] = {{"STRING"},{"ARRAY"}};
		};

		class SYNTAX2
		{
			targets[] = {1,0,0};
			args[] = {{"GROUP"},{"ARRAY"}};
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