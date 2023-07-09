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
	while {dialog} do {
		waitUntil {sleep 0.1; hRead == true};
		_time = serverTime + 5;
		waitUntil {sleep 0.1; serverTime > _time};
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
lbSetPicture [69695, _pageAbt, 'img\star.paa'];
lbSetText[69695, _pageHow, localize "STR_MRTM_welcomeInteract_02"];
lbSetPicture [69695, _pageHow, 'img\icon_important.paa'];
lbSetText[69695, _theTeam, localize "STR_MRTM_welcomeInteract_03"];
lbSetPicture [69695, _theTeam, 'img\icon-user.paa'];
lbSetText[69695, _dc, localize "STR_MRTM_welcomeInteract_04"];
lbSetPicture [69695, _dc, 'img\link_out_white.paa'];
lbSetText[69695, _changelog, localize "STR_MRTM_welcomeInteract_05"];
lbSetPicture [69695, _changelog, 'img\icon_update.paa'];
lbSetText[69695, _scripts, localize "STR_MRTM_welcomeInteract_06"];
lbSetPicture [69695, _scripts, 'img\icon-file.paa'];


while {dialog} do {
	_index = lbCurSel 69695;
	_curSel = lbData [69695, _index];

	if (hRead == false) then {
		ctrlShow [6969691, true];
		ctrlSetText [6969691, localize "STR_MRTM_welcomeInteract_21"];
	} else {
		ctrlShow [6969691, false];
	};

	_inventoryKey = actionKeysNames "gear";
	_gearKey = actionKeysNames "cycleThrownItems";
	_earPlugKey = actionKeysNames "user2";

	switch (_curSel) do {
		case "pageAbt": {
			ctrlSetText [69694, "img\wl_logo_ca.paa"];

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
			ctrlSetText [69694, "img\wl.paa"];
			hRead = true;

			private _control = findDisplay 6969 displayCtrl 69696;
			_control ctrlSetStructuredText composeText [
			localize "STR_MRTM_welcomeInteract_02", lineBreak, 
			"", lineBreak,
			parseText format [localize "STR_MRTM_welcomeInteract_10"], lineBreak,
			parseText format ["<a href='https://www.youtube.com/watch?v=qKfCpmqnmQ4'>Walords Redux Guide from GamerDad</a>"], lineBreak,
			parseText format ["<a href='https://www.youtube.com/watch?v=mlZTCnWLgJg'>Walords Redux Guide from Ferrous Creek</a>"], lineBreak,
			"", lineBreak,
			localize "STR_MRTM_welcomeInteract_11", lineBreak,
			format [localize "STR_MRTM_welcomeInteract_12", _inventoryKey], lineBreak,
			format [localize "STR_MRTM_welcomeInteract_13", _earPlugKey], lineBreak,
			format [localize "STR_MRTM_welcomeInteract_14", _gearKey], lineBreak,
			""
			];
		};

		case "theCom": { 
			ctrlSetText [69694, "img\sniper.paa"];

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
			ctrlSetText [69694, "img\wasp.paa"];

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
			ctrlSetText [69694, "img\arma.paa"]; 

			private _control = findDisplay 6969 displayCtrl 69696;
			_control ctrlSetStructuredText composeText [
			"2.5.7", lineBreak,
			"-Alot of code improvement, wich leads to better gameplay experience.", lineBreak,
			"-Teleporting issue when joining late game is should be fixed.", lineBreak,
			"-Alot less network traffick.", lineBreak,
			"-Code security improved.", lineBreak,
			"-Zone restriction not killing a person after bar is filled fixed.", lineBreak,
			"-GPS icons are better. you see alot more now then just infantry.", lineBreak,
			"-Possible UAV issue fixed. (Needs alot of testing)", lineBreak,
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
			"", lineBreak,
			"2.5.6", lineBreak,
			"-Lag issues fixed", lineBreak,
			"-Bug fixes", lineBreak,
			"-Anti cheat improved", lineBreak,
			"-Possible invincible ai fix", lineBreak,
			"-APS improved", lineBreak,
			"-New asset spawning system", lineBreak,
			"", lineBreak,
			"Visit our github to view the earlier changes.", lineBreak,
			"", lineBreak,
			"...", lineBreak,
			"", lineBreak,
			"2.1.0001", lineBreak,
			"- Baseline version number"
			];
		};


		//Scripts
		case "scripts": { 
			ctrlSetText [69694, "img\wl_logo_ca.paa"];
			
			private _control = findDisplay 6969 displayCtrl 69696;
			_control ctrlSetStructuredText composeText [
			"APS System", lineBreak, 
			"", lineBreak,
			"For the APS System we use drongos Active Protection System.", lineBreak,
			"You can use CTRL + G to check your APS Amount.", lineBreak,
			"", lineBreak,
			parseText "<img size='5' image='img\drongo.paa'/>", lineBreak,
			"", lineBreak,
			"Aircraft Loadout", lineBreak,
			"", lineBreak,
			"For the custom aircraft loadout we use Grumpy Old Man's mod.", lineBreak,
			"You can order vehicle ammo box close to your aircraft and then look at the aircraft and press 'Rearm' to change you  loadout.", lineBreak,
			"", lineBreak,
			parseText "<img  size='5' image='img\wasp.paa'/>", lineBreak,
			"", lineBreak,
			"GF Earplugs", lineBreak,
			"", lineBreak,
			"We use George Floros's earplug script wich allows you to lower your volume by the press of 1 button.", lineBreak,
			"You can press the INSERT key to lower your volume.", lineBreak,
			"", lineBreak,
			parseText "<img  size='5' image='img\earPlugs.paa'/>", lineBreak,
			"", lineBreak,
			"Vehicle Unflip", lineBreak,
			"", lineBreak,
			"Oh no did your vehicle flip over? Simply walk up to it and use your scroll wheel to unflip the vehicle.", lineBreak,
			"Note: Static defenses may experience difficulty flipping over.", lineBreak,
			"", lineBreak,
			parseText "<img  size='5' image='img\unflip.paa'/>", lineBreak,
			""
			];
		};
	};
	sleep 0.1;
};


