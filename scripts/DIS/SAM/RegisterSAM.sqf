private _SAM=_this select 0;
disReg pushBack _SAM;
private _EH=_SAM addEventHandler["fired","nul=_this execVM'scripts\DIS\SAM\SAMfired.sqf'"];

/*
//_side=side _SAM;
if(local _SAM)then{
	//[_SAM]remoteExec["DAO_fnc_SAM"];
	//_EH=_SAM addEventHandler["fired",compile format["nul=[_this,%1]execVM'DAO\Scripts\SAM\SAMfired.sqf'",_side]];
	_EH=_SAM addEventHandler["fired","nul=_this execVM'DAO\Scripts\SAM\SAMfired.sqf'"];
};
if((side _SAM)==(side player))then{[_SAM]spawn DAO_fnc_SAMMarker};