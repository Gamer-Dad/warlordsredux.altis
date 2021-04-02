//Welcome page testing 
// info: https://community.bistudio.com/wiki/hintC
// info: https://community.bistudio.com/wiki/Structured_Text
//  Example img: <img image='\a3\Data_f\Flags\flag_Altis_co.paa'/>
// Example link: <a href='http://arma3.com'>Arma 3</a>

private _discord = parseText "<a href='https://discord.gg/grmzsZE4ua'>Discord link</a>";

private _linetwo = "Hold i to fast travel";

private _linethree = "Something else important goes here";

private _linefour = "More important stuff here";

_structuredText = composeText [_discord, lineBreak, lineBreak, _linetwo, lineBreak, lineBreak, _linethree, lineBreak, lineBreak, _linefour];

sleep 5;
"Welcome" hintC _structuredText; 

hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	_this spawn {
		_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];