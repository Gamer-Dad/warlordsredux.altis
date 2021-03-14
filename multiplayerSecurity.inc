class CfgRemoteExec
{
	class Server
	{
		class Functions
		{
			mode = 2;
		};
		class Commands
		{
			mode = 2;
		};
	};
	class Client
	{
		class Functions
		{
			mode = 0;
		};
		class Commands
		{
			mode = 0;
		};
	};
};

class CfgDisabledCommands
{
	class SETDAMAGE
	{
		class SYNTAX1
		{
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"SCALAR","ARRAY"}};
		};
	};
	class SETDAMMAGE
	{
		class SYNTAX1
		{
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"SCALAR"}};
		};
	};
	class SETPOS
	{
		class SYNTAX1
		{
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	/*class SETPOSASL
	{
		class SYNTAX1
		{
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};*/
	class SETPOSASL2
	{
		class SYNTAX1
		{
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
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
	class SETVEHICLEPOSITION
	{
		class SYNTAX1
		{
			targets[] = {1,0,1};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class CREATEUNIT
	{
		class SYNTAX1
		{
			targets[] = {1,0,1};
			args[] = {{"STRING"},{"ARRAY"}};
		};

		class SYNTAX2
		{
			targets[] = {1,0,1};
			args[] = {{"GROUP"},{"ARRAY"}};
		};
	};
	class CREATEVEHICLE
	{
		class SYNTAX1
		{
			targets[] = {1,0,1};
			args[] = {{"STRING"},{"ARRAY"}};
		};

		class SYNTAX2
		{
			targets[] = {1,0,1};
			args[] = {{},{"ARRAY"}};
		};
	};
	class CREATEVEHICLELOCAL
	{
		class SYNTAX1
		{
			targets[] = {1,0,1};
			args[] = {{"STRING"},{"ARRAY"}};
		};
	};
	class CREATEGROUP
	{
		class SYNTAX1
		{
			targets[] = {1,0,1};
			args[] = {{},{"ARRAY","SIDE"}};
		};
	};
	class DELETEVEHICLE
	{
		class SYNTAX1
		{
			targets[] = {1,0,1};
			args[] = {{},{"OBJECT"}};
		};
	};
	class ENABLESIMULATIONGLOBAL
	{
		class SYNTAX1
		{
			targets[] = {1,1,1};
			args[] = {{"OBJECT"},{"BOOL"}};
		};
	};
	class HIDEOBJECTGLOBAL
	{
		class SYNTAX1
		{
			targets[] = {1,1,1};
			args[] = {{"OBJECT"},{"BOOL"}};
		};

		class SYNTAX2
		{
			targets[] = {1,1,1};
			args[] = {{},{"OBJECT"}};
		};
	};
	class SETVELOCITY
	{
		class SYNTAX1
		{
			targets[] = {1,1,1};
			args[] = {{"OBJECT"},{"ARRAY"}};
		};
	};
	class CREATEVEHICLECREW
	{
		class SYNTAX1
		{
			targets[] = {1,1,1};
			args[] = {{},{"OBJECT"}};
		};
	};

};