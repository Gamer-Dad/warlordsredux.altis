["RequestMenu_close"] call BIS_fnc_WL2_setupUI;

createDialog ["welcomeScreen", true];
hRead = false;

(findDisplay 6969) displayAddEventhandler ["KeyDown",{
	if (dialog) then {
		_button = (_this select 1);
		switch (_button) do {
			case 1: {true};
			case 15: {true};
			case 56: {true};
			default {false};
		};
	};
}];

0 spawn {
	if (["(EU) #11", serverName] call BIS_fnc_inString) then {
		while {dialog} do {
			waitUntil {sleep 0.1; hRead == true};
			_time = serverTime + 5;
			waitUntil {sleep 0.1; serverTime > _time};
			ctrlEnable [1, true];
		};
	} else {
		ctrlEnable [1, true];
	};
};

if (side player == west) then {
	private _control1 = findDisplay 6969 displayCtrl 69692;
	_control1 ctrlSetTextColor [0,0.3,0.5,1];

	private _control2 = findDisplay 6969 displayCtrl 69697;
	_control2 ctrlSetBackgroundColor [0,0.3,0.5,1];
} else {
	private _control1 = findDisplay 6969 displayCtrl 69692;
	_control1 ctrlSetTextColor [0.5,0,0,1];

	private _control2 = findDisplay 6969 displayCtrl 69697;
	_control2 ctrlSetBackgroundColor [0.5,0,0,1];	
};

//List Menu + Scripts
_pageAbt = lbAdd [69695, localize "STR_MRTM_welcomeInteract_01"];
_pageHow = lbAdd [69695, localize "STR_MRTM_welcomeInteract_02"];
_theTeam = lbAdd [69695, localize "STR_MRTM_welcomeInteract_03"];
_dc = lbAdd [69695, localize "STR_MRTM_welcomeInteract_04"];
_changelog = lbAdd [69695, localize "STR_MRTM_welcomeInteract_05"];
_scripts = lbAdd [69695, localize "STR_MRTM_welcomeInteract_06"];


//List Menu Data + Scrips
lbSetData[69695, _pageAbt, "pageAbt"];
lbSetData[69695, _pageHow, "pageHow"];
lbSetData[69695, _theTeam, "theCom"];
lbSetData[69695, _dc, "discord"];
lbSetData[69695, _changelog, "changelog"];
lbSetData[69695, _scripts, "scripts"];

lbSetCurSel [69695, _pageAbt];

lbSetText[69695, _pageAbt, localize "STR_MRTM_welcomeInteract_01"];
lbSetPicture [69695, _pageAbt, 'img\star_ca.paa'];
lbSetText[69695, _pageHow, localize "STR_MRTM_welcomeInteract_02"];
lbSetPicture [69695, _pageHow, 'img\icon_important_ca.paa'];
lbSetText[69695, _theTeam, localize "STR_MRTM_welcomeInteract_03"];
lbSetPicture [69695, _theTeam, 'img\icon-user_ca.paa'];
lbSetText[69695, _dc, localize "STR_MRTM_welcomeInteract_04"];
lbSetPicture [69695, _dc, 'img\link_out_white_ca.paa'];
lbSetText[69695, _changelog, localize "STR_MRTM_welcomeInteract_05"];
lbSetPicture [69695, _changelog, 'img\icon_update_ca.paa'];
lbSetText[69695, _scripts, localize "STR_MRTM_welcomeInteract_06"];
lbSetPicture [69695, _scripts, 'img\icon-file_ca.paa'];
ctrlSetText [69694, "img\wl_logo_ca.paa"];

while {dialog} do {
	_index = lbCurSel 69695;
	_curSel = lbData [69695, _index];

	if (hRead == false) then {
		ctrlShow [6969691, true];
		ctrlSetText [6969691, localize "STR_MRTM_welcomeInteract_21"];
	} else {
		ctrlShow [6969691, false];
	};

	switch (_curSel) do {
		case "pageAbt": {
			private _control = findDisplay 6969 displayCtrl 69696;
			_control ctrlSetStructuredText composeText [
			localize "STR_MRTM_welcomeInteract_07", lineBreak,
			"", lineBreak,
			localize "STR_MRTM_welcomeInteract_08", lineBreak,
			"", lineBreak,
			localize "STR_MRTM_welcomeInteract_09", lineBreak,
			"", lineBreak,
			""
			];
		};

		case "pageHow": {
			hRead = true;
			_inventoryKey = actionKeysNames "gear";
			_gearKey = actionKeysNames "cycleThrownItems";
			_settingsKey = actionKeysNames "user2";
			_groupKey = actionKeysNames "user3";
			_emotesKey = actionKeysNames "user4";

			private _control = findDisplay 6969 displayCtrl 69696;
			_control ctrlSetStructuredText composeText [
			localize "STR_MRTM_welcomeInteract_02", lineBreak, 
			"", lineBreak,
			parseText format [localize "STR_MRTM_welcomeInteract_10"], lineBreak,
			parseText format ["<a href='https://www.youtube.com/watch?v=qKfCpmqnmQ4'>Walords Redux Guide by GamerDad</a>"], lineBreak,
			parseText format ["<a href='https://www.youtube.com/watch?v=mlZTCnWLgJg'>Walords Redux Guide by Ferrous Creek</a>"], lineBreak,
			parseText format ["<a href='https://streamable.com/3xwuma'>Mortar Guide by Spooker</a>"], lineBreak,
			parseText format ["<a href='https://streamable.com/oh8k57'>Tank Guide by Spooker</a>"], lineBreak,
			"", lineBreak,
			localize "STR_MRTM_welcomeInteract_11", lineBreak,
			format [localize "STR_MRTM_welcomeInteract_12", _inventoryKey], lineBreak,
			format [localize "STR_MRTM_welcomeInteract_13", "Insert"], lineBreak,
			format [localize "STR_MRTM_welcomeInteract_14", _gearKey], lineBreak,
			format ["Open your settings: %1", _settingsKey], lineBreak,
			format ["Open the group menu: %1", _groupKey], lineBreak,
			format ["Open the emote menu: %1", _emotesKey], lineBreak,
			""
			];
		};

		case "theCom": { 
			private _control = findDisplay 6969 displayCtrl 69696;
			_control ctrlSetStructuredText composeText [
			localize "STR_MRTM_welcomeInteract_03", lineBreak, 
			"", lineBreak,
			localize "STR_MRTM_welcomeInteract_15", lineBreak,
			"", lineBreak,
			localize "STR_MRTM_welcomeInteract_16", lineBreak,
			"- Gamerdad", lineBreak,
			"- TenPenny", lineBreak,
			"- Dwarden", lineBreak,
			"- Witch Doctor", lineBreak,
			"- JWalker08", lineBreak,
			"", lineBreak,
			localize "STR_MRTM_welcomeInteract_17", lineBreak,
			"- MrThomasM", lineBreak,
			"- Rook", lineBreak,
			"", lineBreak,
			localize "STR_MRTM_welcomeInteract_18", lineBreak,
			"- Coffee", lineBreak,
			"- [E Z] N.Jabo", lineBreak,
			"- Dagon", lineBreak,
			"- Hazer_AL", lineBreak,
			"- Tiber Brutus", lineBreak,
			""
			];
		};

		case "discord": { 
			private _control = findDisplay 6969 displayCtrl 69696;
			_control ctrlSetStructuredText composeText [
			localize "STR_MRTM_welcomeInteract_04", lineBreak,
			"", lineBreak, 
			localize "STR_MRTM_welcomeInteract_19", lineBreak,
			localize "STR_MRTM_welcomeInteract_20", lineBreak,
			"", lineBreak, 
			parseText "<a href='https://discord.gg/grmzsZE4ua'>Discord.</a>"
			];
		};

		case "changelog": {
			private _control = findDisplay 6969 displayCtrl 69696;
			_control ctrlSetStructuredText composeText [
			"2.5.8", lineBreak,
			"-Performance improved.", lineBreak,
			"-Group system added.", lineBreak,
			"-APS Improved. 120m -> 40m interception range.", lineBreak,
			"-User settings are saved across games.", lineBreak,
			"-Player stats added: Total kills, K/D, Sectors seized, Total CP earned, Longest kill distance.", lineBreak,
			"-Last loadout unavailable if it's the same as your current.", lineBreak,
			"-Option to spawn vehicles with empty inventory added.", lineBreak,
			"-Dynamic sector population. More players means less AI spawns.", lineBreak,
			"-Kill bonus if the unit you killed was in the AO.", lineBreak,
			"-Emotes added.", lineBreak,
			"-AI availability UI enhanced. *available*/*Total*", lineBreak,
			"-Cheaters can't spawn vehicles anymore.", lineBreak,
			"-Cheaters can't get free vehicles.", lineBreak,
			"-Cheaters can't get sector scans for free or target resets.", lineBreak,
			"-Can't bypass rearm timer anymore.", lineBreak,
			"-New base location code. Bases are now a lot more random and never the same as the game before.", lineBreak,
			"-Option to toggle APS on/off. By default: keybind to switch grenades.", lineBreak,
			"-Option to see APS status added: Custom Controls > Use Action 1", lineBreak,
			"", lineBreak,
			"2.5.7.1", lineBreak,
			"-New capping values.", lineBreak,
			"-Easter egg reward fixed.", lineBreak,
			"-Initial spawn position on game start fixed.", lineBreak,
			"-Vehicle garbage clean up enhanced.", lineBreak,
			"-AAF spawning at sectors when enemy team already targeted it fixed.", lineBreak,
			"-Spawn pod doesn't work when slightly crooked, fixed.", lineBreak,
			"-Dazzler fixed. And when enabled it auto turns on the engine so people don't forget.", lineBreak,
			"-APS and Dazzler intercept missiles faster, missiles that are shot fast after eachother should all still get intercepted.", lineBreak,
			"-Attack helicopters don't play altitude or pull-up warnings anymore as they didn't work very well and would play constantly.", lineBreak,
			"-.5 CP Won't happen anymore.", lineBreak,
			"-AI Regeneration speed is back to normal.", lineBreak,
			"-Map icons fixed. (Some stuff not showing up).", lineBreak,
			"-Mine limit updated to more types.", lineBreak,
			"-Refuelling fixed.", lineBreak,
			"-Vehicles pop smoke when APS is triggered and there is a commander in the vehicle.", lineBreak,
			"-HARM and ARM Missil added to medium APS.", lineBreak,
			"-Sharurs added to heavy APS", lineBreak,
			"", lineBreak,
			"2.5.7", lineBreak,
			"-Alot of code improvement, wich leads to better gameplay experience.", lineBreak,
			"-Teleporting issue when joining late game is should be fixed.", lineBreak,
			"-Alot less network traffick.", lineBreak,
			"-Code security improved.", lineBreak,
			"-Zone restriction not killing a person after bar is filled fixed.", lineBreak,
			"-GPS icons are better. you see alot more now then just infantry.", lineBreak,
			"-UAV issue fixed.", lineBreak,
			"-Double spawn truck icon fixed.", lineBreak,
			"-Spawn truck lock action fixed.", lineBreak,
			"-Free AI Fixed.", lineBreak,
			"-Starting a game with less then 1000CP (due to imbalance) fixed.", lineBreak,
			"-Dazzler should work again like intented.", lineBreak,
			"-Friendly fire penalty fixed", lineBreak,
			"-All huron containers and Taru Pods are added as refuel, rearm, repair possibility.", lineBreak,
			"-All Containers, pods, boxes are loadable onto the flatbed and can be loaded into the Y-32 and Blackfish Vehicle transport.", lineBreak,
			"-New fast travel option added. The huron medical container and taru medical pod.", lineBreak,
			"-You now get a CP refund if you where transfering CP and it canceled because of sector voting.", lineBreak,
			"-Rearm resources shows on rearm action's text.", lineBreak,
			"-APS improved, Added Rhino ATGM (Heavy + Medium) + Nyx AT's missile to the list. (Heavy)", lineBreak,
			"-Newly bought assets have FF protection in base.", lineBreak,
			"-Divers added", lineBreak,
			"", lineBreak,
			"Visit our github to view the earlier changes.", lineBreak,
			"", lineBreak,
			"2.1.0001", lineBreak,
			"- Baseline version number"
			];
		};


		//Scripts
		case "scripts": { 
			private _control = findDisplay 6969 displayCtrl 69696;
			_control ctrlSetStructuredText composeText [
			"Aircraft Loadout", lineBreak,
			"", lineBreak,
			"For the custom aircraft loadout we use Grumpy Old Man's mod.", lineBreak,
			"You can order vehicle ammo box close to your aircraft and then look at the aircraft and press 'Rearm' to change you  loadout.", lineBreak,
			"", lineBreak,
			parseText "<img  size='5' image='a3\data_f_jets\images\dlcbrowser_jets_loadouts_ca.paa'/>", lineBreak,
			"", lineBreak,
			"GF Earplugs", lineBreak,
			"", lineBreak,
			"We use George Floros's earplug script wich allows you to lower your volume by the press of 1 button.", lineBreak,
			"You can press the INSERT key to lower your volume.", lineBreak,
			"", lineBreak,
			parseText "<img  size='5' image='img\earPlugs_ca.paa'/>", lineBreak,
			"", lineBreak,
			"Vehicle Unflip", lineBreak,
			"", lineBreak,
			"Oh no did your vehicle flip over? Simply walk up to it and use your scroll wheel to unflip the vehicle.", lineBreak,
			"Note: Static defenses may experience difficulty flipping over.", lineBreak,
			"", lineBreak,
			parseText "<img  size='5' image='a3\missions_f\data\img\showcase_vehicles_overview_ca.paa'/>", lineBreak,
			""
			];
		};
	};
	sleep 0.1;
};