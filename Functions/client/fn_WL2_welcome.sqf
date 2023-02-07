["RequestMenu_close"] call BIS_fnc_WL2_setupUI;

createDialog ["welcomeScreen", true];

howRead = false;

ctrlShow [696991, false];

//Language selector
_eng = lbAdd [69699, "English"];
_russ = lbAdd [69699, "Русский"];

if (language == "Russian") then {
	lbSetCurSel [69699, _russ];
} else {
	lbSetCurSel [69699, _eng];
};

//Language selector Data
lbSetData [69699, _eng, "langEnglish"];
lbSetData [69699, _russ, "langRussian"];	

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


while {dialog} do {
	_index = lbCurSel 69695;
	_curSel = lbData [69695, _index];

	indexLang = lbCurSel 69699;
	curSelLang = lbData [69699, indexLang];

	if (curSelLang == "langEnglish") then {
		ctrlSetText [696990, "img\flagAmerican.paa"];
	} else {
		ctrlSetText [696990, "img\flagRussian.paa"];
	};

	lbSetText[69695, _pageAbt, localize "STR_MRTM_welcomeInteract_01"];
	lbSetText[69695, _pageHow, localize "STR_MRTM_welcomeInteract_02"];
	lbSetText[69695, _theTeam, localize "STR_MRTM_welcomeInteract_03"];
	lbSetText[69695, _dc, localize "STR_MRTM_welcomeInteract_04"];
	lbSetText[69695, _changelog, localize "STR_MRTM_welcomeInteract_05"];
	lbSetText[69695, _scripts, localize "STR_MRTM_welcomeInteract_06"];

	inventoryKey = actionKeysNames "gear";

	switch (_curSel) do {
		case "pageAbt": {
			if (curSelLang == "langEnglish") then {
				ctrlSetText [69694, "img\wl_logo_ca.paa"];

				private _control = findDisplay 6969 displayCtrl 69696;
				_control ctrlSetStructuredText composeText [
				localize "STR_MRTM_welcome", lineBreak,
				"", lineBreak,
				"Warlords Redux 2.5 is a community upgrade project for the Original Warlords Redux. It's project goal is to improve on BI vision of warlords with bugfixes and more balanced user experience while staying compatable with official servers for the best player count.", lineBreak,
				"", lineBreak,
				"Warlords Redux introduces a lot of new features like Fog of War and random base locations. It has alot of other new features compared to vanilla warlords like: random base locations, custom aircraft pylons, introduction of all drones/ SAM's/ AAA...", lineBreak,
				"", lineBreak,
				""
				];
			} else {
				ctrlSetText [69694, "img\wl_logo_ca.paa"];

				private _control = findDisplay 6969 displayCtrl 69696;
				_control ctrlSetStructuredText composeText [
				localize "STR_MRTM_welcome", lineBreak,
				"", lineBreak,
				"Warlords Redux 2.5 — это проект сообщества по обновлению оригинальной Warlords Redux. Цель проекта — улучшить BI-видение военачальников c помощью исправлений ошибок и более сбалансированного взаимодействия c пользователем, сохраняя при этом совместимость c официальными серверами для наибольшего количества игроков.", lineBreak,
				"", lineBreak,
				"Warlords Redux представляет множество новых функций, таких как туман войны и случайные местоположения базы. Он имеет много других новых функций по сравнению c ванильными военачальниками, такими как: случайное расположение баз, пользовательские пилоны самолетов, введение всех дронов / BPK / AAA ...", lineBreak,
				"", lineBreak,
				""
				];	
			};
		};

		case "pageHow": {
			howRead = true;
			if (curSelLang == "langEnglish") then {
				ctrlSetText [69694, "img\wl.paa"];

				private _control = findDisplay 6969 displayCtrl 69696;
				_control ctrlSetStructuredText composeText ["How to play.", lineBreak, 
				"", lineBreak,
				parseText format ["In these video's you can see a detailed guide on how to play warlords redux:"], lineBreak,
				parseText format ["<a href='https://www.youtube.com/watch?v=qKfCpmqnmQ4'>Walords Redux Guide from GamerDad</a>"], lineBreak,
				parseText format ["<a href='https://www.youtube.com/watch?v=mlZTCnWLgJg'>Walords Redux Guide from Ferrous Creek</a>"], lineBreak,
				"", lineBreak,
				"Keybinds:", lineBreak,
				format ["Hold %1 - Opens the Warlords Menu.", inventoryKey], lineBreak,
				"Press INSERT - To insert your earplugs.", lineBreak,
				"CTRL + G - Shows your APS in the chat.", lineBreak,
				""
				];
			} else {
				ctrlSetText [69694, "img\wl.paa"];

				private _control = findDisplay 6969 displayCtrl 69696;
				_control ctrlSetStructuredText composeText ["Как играть.", lineBreak, 
				"", lineBreak,
				parseText format ["B этом видео вы можете увидеть подробный гайд как играть в Warlords Redux: <a href='https://www.youtube.com/watch?v=qKfCpmqnmQ4'>Руководство по Walords Redux</a>"], lineBreak,
				"", lineBreak,
				"Связки клавиш:", lineBreak,
				format ["Держать %1 - Открывает меню Warlords.", inventoryKey], lineBreak,
				"Нажимать INSERT - Чтобы вставить беруши.", lineBreak,
				"CTRL + G - Показывает ваш APS в чате.", lineBreak,
				""
				];			
			};
		};

		case "theCom": { 
			if (curSelLang == "langEnglish") then {
				ctrlSetText [69694, "img\sniper.paa"];

				private _control = findDisplay 6969 displayCtrl 69696;
				_control ctrlSetStructuredText composeText [
				"The WSV Community", lineBreak, 
				"", lineBreak,
				"The War Sim Vets community organizes arma 3 events and works on the Warlords Redux project know as EU#11.", lineBreak,
				"", lineBreak,
				"Project Managers:", lineBreak,
				"- Gamerdad", lineBreak,
				"- TenPenny", lineBreak,
				"- Dwarden", lineBreak,
				"", lineBreak,
				"Developers:", lineBreak,
				"- MrThomasM", lineBreak,
				"- Tin", lineBreak,
				"- ★ 爪卂尺ﾉﾉ ★", lineBreak,
				"", lineBreak,
				"Admins: (Events)", lineBreak,
				"- Witch Doctor", lineBreak,
				"- Coffee", lineBreak,
				"- JWalker08", lineBreak,
				"- [POLAND] Grom Soldier", lineBreak,
				"- Iron", lineBreak,
				""
				];
			} else {
				ctrlSetText [69694, "img\sniper.paa"];

				private _control = findDisplay 6969 displayCtrl 69696;
				_control ctrlSetStructuredText composeText [
				"Сообщество WSV", lineBreak, 
				"", lineBreak,
				"Сообщество War Sim Vets организует мероприятия Arma 3 и работает над проектом Warlords Redux, известным как EU#11.", lineBreak,
				"", lineBreak,
				"Менеджеры проекта:", lineBreak,
				"- Gamerdad", lineBreak,
				"- TenPenny", lineBreak,
				"- Dwarden", lineBreak,
				"", lineBreak,
				"Разработчики:", lineBreak,
				"- MrThomasM", lineBreak,
				"- Tin", lineBreak,
				"- ★ 爪卂尺ﾉﾉ ★", lineBreak,
				"", lineBreak,
				"Админы: (События)", lineBreak,
				"- Witch Doctor", lineBreak,
				"- Coffee", lineBreak,
				"- JWalker08", lineBreak,
				"- [POLAND] Grom Soldier", lineBreak,
				"- Iron", lineBreak,
				""
				];
			};
		};

		case "discord": { 
			if (curSelLang == "langEnglish") then {
				ctrlSetText [69694, "img\wasp.paa"];

				private _control = findDisplay 6969 displayCtrl 69696;
				_control ctrlSetStructuredText composeText [
				"Our discord", lineBreak,
				"", lineBreak, 
				"Join our discord to stay notified of Warlords Redux updates and events.", lineBreak,
				"In our discord you can also suggest new stuff or report bugs.", lineBreak,
				"", lineBreak, 
				parseText "<a href='https://discord.gg/grmzsZE4ua'>Our Discord</a>"
				];
			} else {
				ctrlSetText [69694, "img\wasp.paa"];

				private _control = findDisplay 6969 displayCtrl 69696;
				_control ctrlSetStructuredText composeText [
				"Наш discord", lineBreak,
				"", lineBreak, 
				"Присоединяйтесь к нашему discord чтобы получать уведомления o6 обновлениях и событиях Warlords Redux.", lineBreak,
				"B нашем discord вы также можете предлагать новые материалы или сообщать o6 ошибках.", lineBreak,
				"", lineBreak, 				
				parseText "<a href='https://discord.gg/grmzsZE4ua'>Наш Discord</a>"
				];
			};
		};

		case "changelog": {
			ctrlSetText [69694, "img\arma.paa"]; 

			private _control = findDisplay 6969 displayCtrl 69696;
			_control ctrlSetStructuredText composeText [
			"2.1.0001", lineBreak,
			"- Baseline version number", lineBreak,
			"", lineBreak,
			"2.1.0002", lineBreak,
			"- Fixed capping height to be 25 meters-ish", lineBreak,
			"", lineBreak,
			"2.1.0003", lineBreak,
			"- Fixed fast travel to friendly sector zoom bug", lineBreak,
			"", lineBreak,
			"2.1.0004", lineBreak,
			"- Dynamic AI buddy count working on dedi servers", lineBreak,
			"", lineBreak,
			"2.1.0005", lineBreak,
			"- Fix for unflip script on MP servers", lineBreak,
			"- Minor changes to spawn tables/numbers for official servers", lineBreak,
			"", lineBreak,
			"2.1.0006", lineBreak,
			"- Reduced number of votes required to reset a sector", lineBreak,
			"- Reduced CP cost to start a target reset sector vote", lineBreak,
			"- Increased player count before AI buddy reduction", lineBreak,
			"- Reduced to the cost of SAM battery and AA tanks to balance out re-arm timer", lineBreak,
			"- Rebalanced VTOL cost based on PvP effectiveness", lineBreak,
			"- Increased CP transfer tax rate from 2% to 4% in order to limit early game money laundering schemes", lineBreak, 
			"- base starting locations are now 200% more random", lineBreak,
			"- Reduced AI enemies per town to help with server/network performance", lineBreak,
			"- Improved flight profile/waypoints of AI aircraft", lineBreak,
			"", lineBreak,
			"2.1.0007", lineBreak,
			"- Vec Ammo Box cost adjusted to prevent abuse", lineBreak,
			"- Corpse and Asset cleanup code Improved", lineBreak,
			"- Kavala removed as a heliport until Heli spawn code is improved", lineBreak,
			"", lineBreak,
			"2.1.0008", lineBreak,
			"- Removed all mines from arsenal", lineBreak,
			"- Increased cost of Exp crates by 3x", lineBreak,
			"- All mines are deleted from the map when a zone is captured", lineBreak,
			"- Friendly fire penalty is 3x more painful", lineBreak,
			"", lineBreak,
			"2.1.0009", lineBreak,
			"- Fixed some first time player spawns being in the ocean", lineBreak,
			"- Randomized AI Vehicle locations spawning at non-randomized zones", lineBreak,
			"- Inf and Vehicles now spawn on the ground", lineBreak,
			"- Fix for Vehicles landing on buildings", lineBreak,
			"- Fix for Vehicles falling through the ground", lineBreak,
			"- Helis/VTOLs now spawn on the player", lineBreak,
			"- Kavala heliport added back", lineBreak,
			"", lineBreak,
			"2.2.0000", lineBreak,
			"- Prices for vehicles and aircraft overhauled.", lineBreak,
			"", lineBreak,
			"2.2.0001", lineBreak,
			"- Vehicles now spawn on the ground", lineBreak,
			"- Minor tweaks to heli spawn code", lineBreak,
			"- Minor tweaks to jet spawn code", lineBreak,
			"- Minor tweaks to Kavala", lineBreak,
			"- Doubled spawn protection timer", lineBreak,
			"", lineBreak,
			"2.2.0002", lineBreak,
			"- GOM script fix", lineBreak,
			"- 80% fix for setOwner bug", lineBreak,
			"- Tiered Rearming", lineBreak,
			"- Added Arty", lineBreak,
			"", lineBreak,
			"2.2.0003", lineBreak,
			"- Added Stealth jets", lineBreak,
			"- Added new Helis/VTOLs", lineBreak,
			"- blackfish Inf B_T_VTOL_01_infantry_F", lineBreak,
			"- Blackfish Vic B_T_VTOL_01_vehicle_F", lineBreak,
			"- Taru Medical O_Heli_Transport_04_medevac_F", lineBreak,
			"-  Xi'an Vic   O_T_VTOL_02_vehicle_F", lineBreak,
			"- Added HMG and AT offroads", lineBreak,
			"- Added Dwarden.", lineBreak,
			"- Added Mortars", lineBreak,
			"- Doubled CP cost of Mortars", lineBreak,
			"- Revamped AI buddy system, More AI buddies and more modular system", lineBreak,
			"", lineBreak,
			"2.2.0004", lineBreak,
			"-Price Adjustments 1.2 - More expensive jets, cheaper INF", lineBreak,
			"-Drongos TROPHY System - Fully working, might needs tweaking.", lineBreak,
			"-Added Push & Hold I for menu on map", lineBreak,
			"-Increased Funds Transfer cost to 5k", lineBreak,
			"-Sector Reset Cheaper at 500", lineBreak,
			"-More AI in early game overall, no AI when players > 40.", lineBreak,
			"", lineBreak,
			"2.3", lineBreak,
			"-Price Adjustments based on use.", lineBreak,
			"-Performance tweaks thanks to Korbels", lineBreak,
			"-Team Switch Revert", lineBreak,
			"-Vehicles no longer spawn on roads/buildings", lineBreak,
			"-Increased safe spawn for vehicles", lineBreak,
			"-Sector Selection Fix", lineBreak,
			"-Sector ownership bug Fix", lineBreak,
			"-Fixed UAV delete bug", lineBreak,
			"-Possible Teleport bug fix", lineBreak,
			"-Sector Voting Bug Fix", lineBreak,
			"", lineBreak,
			"2.4", lineBreak,
			"-Price Adjustments after months of data", lineBreak,
			"-Extended Mortar rearm delays", lineBreak,
			"-Edits to map to prevent explosions on spawn", lineBreak,
			"-AI take 10min to become available to prevent spam", lineBreak, 
			"-Increased AI to players, at max population 1 will be allowed", lineBreak,
			"-Aircraft will only spawn at airfields now", lineBreak,
			"-Teamswitch chat removal fixed", lineBreak,
			"-Defending players have a larger spawn in zone", lineBreak,
			"-Friendly fire threshold decreased", lineBreak,
			"-AI max starts players out at 0 upon first load into server", lineBreak,
			"-Rearm bug fixed", lineBreak,
			"-Vehicle spawn adjustments", lineBreak,
			"-Town AI spawn in combat mode.", lineBreak,
			"-Mission End Timer @ 6 hours.", lineBreak,
			"", lineBreak,
			"2.5", lineBreak,
			"-CP is saved every 5 minutes.", lineBreak,
			"-CP is saved after every funds transfer for each person.", lineBreak,
			"-Prior CP is given back on join.", lineBreak,
			"-Code improvements.", lineBreak,
			"-Anti-cheat improvements.", lineBreak,
			"-Mine limit is fixed (limit is now server sided not per client, you recieve a message when limit is reached).", lineBreak,
			"-Fixed the issue of UAV's beeing locked when a player dies.", lineBreak,
			"-Added a moving spawn.", lineBreak,
			"-Made a new intro screen.", lineBreak,
			"-Introduction of all drones. (Both Sides)", lineBreak,
			"-Added VLS, Praetorian, Centurion, Spartan."
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
			"View Distance", lineBreak,
			"", lineBreak,
			"You can increase your view distance by using using you scroll wheel, scroll to 'settings' there you can change your visual settings.", lineBreak,
			"Remember your own video settings need to be atleast at 4000 for you to get maximum view distance.", lineBreak,
			"", lineBreak,
			parseText "<img  size='5' image='img\vieuw.paa'/>", lineBreak,
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


