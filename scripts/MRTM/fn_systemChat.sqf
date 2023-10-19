params ["_text"];

if (isRemoteExecuted && {remoteExecutedOwner == 2}) then {
	[_text] remoteExec ["systemChat", 0];
};