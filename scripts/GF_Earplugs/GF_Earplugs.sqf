


//________________	Author : GEORGE FLOROS [GR]	___________	29.03.19	___________


/*
________________	GF Earplugs Script - Mod	________________

https://forums.bohemia.net/forums/topic/215844-gf-earplugs-script-mod/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

ArmA 3 | Notepad ++ SQF tutorial
https://www.youtube.com/watch?v=aI5P7gp3x90

and also use the extra pluggins
(this way will be better , it will give also some certain colors to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/

BI Forum Ravage Club Owner :
https://forums.bohemia.net/clubs/73-bi-forum-ravage-club/
*/


/*
https://forums.bohemia.net/forums/topic/215798-weapon-Earplugs-by-key-pressed/?tab=comments#comment-3281031

You can search here for key bindings
https://community.bistudio.com/wiki/DIK_KeyCodes

DIK_5               0x06
DIK_TAB             0x0F


//________________	Place this code in the init.sqf	________________

[] execVM "GF_Earplugs\Credits.sqf";	// Please keep the Credits or add them to your Diary

addMissionEventHandler ["Loaded", {
	params ["_saveType"];
	
	If(_saveType isEqualto "continue") then{
		[] execVM "GF_Earplugs\GF_Earplugs.sqf";
	};
}];

[] execVM "GF_Earplugs\GF_Earplugs.sqf";
*/




waitUntil {!isNull player};

//________________ Settings ________________
//________________ Set true or false  ________________

GF_Earplugs_hintSilent_info					= true;
GF_Earplugs_systemchat_info 				= true;
GF_Earplugs_diag_log_info 					= true;

GF_Earplugs_key								= 0xD2;	//	key insert https://community.bistudio.com/wiki/DIK_KeyCodes




if (GF_Earplugs_systemchat_info) then{
systemchat "GF Earplugs Script - Mod initializing";			
};	

if (GF_Earplugs_diag_log_info) then{
diag_log "//________________	GF Earplugs Script - Mod initializing	________________";
};




[player] spawn {

	GF_Earplugs_soundvolume = soundvolume;
	disableSerialization;
	waitUntil {!(isNull (findDisplay 46))};
	_display = findDisplay 46;
	_display displayAddEventHandler["KeyDown", {
	params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
	_musicvolume = soundvolume;
	_soundvolume = soundvolume;
	
		if(_key isEqualto GF_Earplugs_key) then {

			if (!(_soundvolume isEqualto 0.1) or !(_soundvolume isEqualto 0.1))then{
			
				//________________ EARPLUGS IN ________________
				"GF_Earplugs" cutRsc ["Rsc_GF_Earplugs", "PLAIN"];
				titleText ["<t color='#339933' size='2'font='PuristaBold'>EARPLUGS IN</t>", "PLAIN DOWN", -1, true, true];	
				1 fadeSound 0.1;
				//	hint str soundVolume;			
			};
				
			if ((_soundvolume isEqualto 0.1) or (_soundvolume isEqualto 0.1))then{		
				
				//________________ EARPLUGS OUT ________________			
				"GF_Earplugs" cutText ["", "PLAIN"];			
				titleText ["<t color='#FF3333' size='2'font='PuristaBold'>EARPLUGS OUT</t>", "PLAIN DOWN", -1, true, true];	
				1 fadeSound 0.5;	//forcing this up to 0.5
				//	hint str soundVolume;	
			};
		};
	}];
};


if (GF_Earplugs_systemchat_info) then{
systemchat "GF Earplugs Script - Mod initialized";
systemchat "E a r p l u g s    w i t h    i n s e r t    k e y";			
};	

if (GF_Earplugs_diag_log_info) then{
diag_log "//________________	GF Earplugs Script - Mod initialized	________________";
};