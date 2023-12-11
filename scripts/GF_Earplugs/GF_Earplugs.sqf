


//________________	Author : GEORGE FLOROS [GR]	___________	29.03.19	___________


/*
________________	GF Earplugs Script - Mod	________________
https://forums.bohemia.net/forums/topic/215844-gf-earplugs-script-mod/
*/

disableSerialization;
waitUntil {!(isNull (findDisplay 46))};
_display = findDisplay 46;
_display displayAddEventHandler["KeyDown", {
	params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
	_musicvolume = soundvolume;
	_soundvolume = soundvolume;
	_keyPlug1 = 0xD2;

	if (_key isEqualTo _keyPlug1) then {
		if (!(_soundvolume isEqualto 0.1) or !(_soundvolume isEqualto 0.1)) then {
			//________________ EARPLUGS IN ________________
			"GF_Earplugs" cutRsc ["Rsc_GF_Earplugs", "PLAIN"];
			titleText ["<t color='#339933' size='2'font='PuristaBold'>EARPLUGS IN</t>", "PLAIN DOWN", -1, true, true];	
			1 fadeSound 0.1;		
		};
			
		if ((_soundvolume isEqualto 0.1) or (_soundvolume isEqualto 0.1)) then {		
			
			//________________ EARPLUGS OUT ________________			
			"GF_Earplugs" cutText ["", "PLAIN"];			
			titleText ["<t color='#FF3333' size='2'font='PuristaBold'>EARPLUGS OUT</t>", "PLAIN DOWN", -1, true, true];	
			1 fadeSound 0.5;
		};
	};
}];