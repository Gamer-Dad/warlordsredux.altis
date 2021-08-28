//Welcome page testing 
// info: https://community.bistudio.com/wiki/hintC
// info: https://community.bistudio.com/wiki/Structured_Text
//  Example img: <img image='\a3\Data_f\Flags\flag_Altis_co.paa'/>
// Example link: <a href='http://arma3.com'>Arma 3</a>

private _lineone = parseText "<a href='https://discord.gg/grmzsZE4ua'>Click HERE: To join our discord and speak with the devs!</a>";
private _linetwo = parseText "<a href='https://www.youtube.com/watch?v=A-I4QQELVNk'>Click HERE: Learn to play Warlords!</a>";
private _linethree = parseText "<a href='https://www.youtube.com/watch?v=mlZTCnWLgJg'>Click HERE: What's different about REDUX?</a>";  
private _linefour = "Welcome to the fight, hold I to load the Warlords MENU";

_structuredText = composeText [_lineone, lineBreak, lineBreak, _linetwo, lineBreak, lineBreak, _linethree, lineBreak, lineBreak, _linefour];

sleep 12;

"Welcome to WSV Warlords 2 (Redux)! Please read below..." hintC _structuredText; 
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	_this spawn {
		_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
		};
	}]; 



