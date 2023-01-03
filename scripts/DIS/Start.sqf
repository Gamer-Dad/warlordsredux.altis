sleep 1;

disReg=[];

DIS_fnc_IsSAM=compile preprocessFile"scripts\DIS\SAM\IsSAM.sqf";
DIS_fnc_RegisterSAM=compile preprocessFile"scripts\DIS\SAM\RegisterSAM.sqf";
//dao_fnc_IsAAA=compile preprocessFile"DAO\Scripts\SAM\IsAAA.sqf";
//DIS_fnc_RegisterSAM=compile preprocessFile"DAO\Scripts\SAM\RegisterSAM.sqf";

//DAO_fnc_CheckIfAircraft=compile preprocessFile"DAO\Scripts\Aircraft\CheckIfAircraft.sqf";

if!(isServer)exitWith{};

private _units=[];
private _isSAM=false;

while{TRUE}do{
	_units=[]+vehicles;
	{if((count(crew _x))<1)then{_units=_units-[_x]}}forEach _units;
	_units=_units-disReg;
	// Add everything to Zeus for testing
	{_x addCuratorEditableObjects[_units,TRUE]}forEach allCurators;
	
	{
		_isSAM=_x call DIS_fnc_IsSAM;
		if(_isSAM)then{[_x]spawn DIS_fnc_RegisterSAM};
		//if(_x call DIS_fnc_CheckIfAircraft)then{[_x]spawn DIS_fnc_RegisterAircraft};
	}forEach _units;
	publicVariable"daoVAMinfo";
	sleep 5;
};