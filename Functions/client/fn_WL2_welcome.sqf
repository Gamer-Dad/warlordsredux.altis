["RequestMenu_close"] spawn BIS_fnc_WL2_setupUI;

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
		ctrlSetText [1, localize "STR_MRTM_welcomeInteract_close_btn"];
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
private _pageAbt = lbAdd [69695, localize "STR_MRTM_welcomeInteract_01"];
private _pageHow = lbAdd [69695, localize "STR_MRTM_welcomeInteract_02"];
private _theTeam = lbAdd [69695, localize "STR_MRTM_welcomeInteract_03"];
private _dc = lbAdd [69695, localize "STR_MRTM_welcomeInteract_04"];
private _changelog = lbAdd [69695, localize "STR_MRTM_welcomeInteract_05"];
private _scripts = lbAdd [69695, localize "STR_MRTM_welcomeInteract_06"];


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

private _inventoryKey = actionKeysNames "gear";
private _gearKey = actionKeysNames "cycleThrownItems";

while {dialog} do {
	private _index = lbCurSel 69695;
	private _curSel = lbData [69695, _index];

	if (hRead == false) then {
		ctrlShow [6969691, true];
		ctrlSetText [6969691, localize "STR_MRTM_welcomeInteract_21"];
	} else {
		ctrlShow [6969691, false];
	};

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
			localize "STR_MRTM_welcomeInteract_13", lineBreak,
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
			"- Tin", lineBreak,
			"- Weasley Wells", lineBreak,
			"", lineBreak,
			localize "STR_MRTM_welcomeInteract_18", lineBreak,
			"- Coffee", lineBreak,
			"- [E Z] N.Jabo", lineBreak,
			"- Dagon", lineBreak,
			"- Hazer_AL", lineBreak,
			"- Tiber Brutus", lineBreak,
			"- [POLAND] Grom Soldier", lineBreak,
			"- Iron", lineBreak,
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
			"2.5.4", lineBreak,
			"-All friendly AI owned by players is shown on map.", lineBreak,
			"-Gunner/Driver/Command of a vehicle all (nut the person who got the kill) get the assist for the kill. (blackfish armed not so bad anymore)", lineBreak,
			"-You can kick players/ AI that you don't own out of your vehicles. (As long as you are within 50 meters)", lineBreak,
			"-Vehicle spawning reworked.", lineBreak,
			"-Voice warning systems have been improved.", lineBreak,
			"-New settings menu.", lineBreak,
			"-You can now change the volumes of the voice warning systems.", lineBreak,
			"-Kill bonus for people using 1st person. + 50%", lineBreak,
			"-Option to disable kill sound.", lineBreak,
			"", lineBreak,
			"2.5.3", lineBreak,
			"-New CP system. (More secure against cheaters)", lineBreak,
			"-Kill assists added.", lineBreak,
			"-New improved map icons.", lineBreak,
			"-Gorgon has new camo.", lineBreak,
			"-Performance updates. (both client and server)", lineBreak,
			"-Arsenal reworked. (More options added)", lineBreak,
			"-APS Upgrades added.", lineBreak,
			"-APS double deduction is now fixed.", lineBreak,
			"-Fast travel truck not available when owner leaves is now fixed.", lineBreak,
			"-Ammo truck ammo is now 30ton instead of 10ton", lineBreak,
			"-Option to vote for forfeit added", lineBreak,
			"-Improved heli spawns", lineBreak,
			"-New ground vehicle rearm menu added", lineBreak,
			"-Vehicles cant go underwater.", lineBreak,
			"-AAF has stronger defence on sectors with a helipad/runway.", lineBreak,
			"-Rita (voice warning system) added to opfor aircrafts (Neophron and shikra).", lineBreak,
			"", lineBreak,
			"2.5.2", lineBreak,
			"-Added the famous 'Bitching' betty to NATO's wipeout and blackwasp.", lineBreak,
			parseText format ["<a href='https://www.youtube.com/watch?v=zg8FcRgOfPY'>Bitching betty preview.</a>"], lineBreak,
			"-Arsenal reworked.", lineBreak,
			"-New map icons.", lineBreak,
			"", lineBreak,
			"2.5.1", lineBreak,
			"-UAV limit to 2 again.", lineBreak,
			"-Added drones under the aircraft section to autonomous limit.", lineBreak,
			"-Remote designator added.", lineBreak,
			"-Added a confirmation when deleting assets.", lineBreak,
			"-Fixed arsenal - inventory exploit.", lineBreak,
			"-Improved server performance.", lineBreak,
			"-Stopped players from connecting to unowned drone.", lineBreak,
			"-Increased CP balance.", lineBreak,
			"-Stopped players from having unlimited rockets on their aircrafts.", lineBreak,
			"-Player slot count now 40 Nato - 40 Csat to allow for better balancing.", lineBreak,
			"-Removed UAV cleanup code.", lineBreak,
			"-Fixed chat spam on ai availability.", lineBreak,
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
			"-Added VLS, Praetorian, Centurion, Spartan, MLRS.", lineBreak,
			"-Added sector names.", lineBreak,
			"-Added logistics transport. Ability to load crates on flatbed. Can't spawn gear/infantry outside of owned sectors anymore. ", lineBreak,
			"-Added a CP bonus multiplier and punishment when teams are uneven. (Combat team stacking)", lineBreak,
			"-Reworked the mission timer and added gui.", lineBreak,
			"-Fixed gear boxes spawning on position after beeing ordered in owned sector.", lineBreak,
			"-Added respawn vehicle, 1/team.", lineBreak,
			"-Added anti air, air burst system & improved missile speed and maneuverability.", lineBreak,
			"-Fixed the asset limit bug.", lineBreak,
			"-Added DAZZLER defense for the device truck, added to both sides. Type of electronic warfare defense to confuse incoming guided missiles in a dome of 300m around truck, also effects outgoing.  We'll likely dive into EW in 2.6 and make more fun stuff.", lineBreak,
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
			"2.2.0004", lineBreak,
			"-Price Adjustments 1.2 - More expensive jets, cheaper INF", lineBreak,
			"-Drongos TROPHY System - Fully working, might needs tweaking.", lineBreak,
			"-Added Push & Hold I for menu on map", lineBreak,
			"-Increased Funds Transfer cost to 5k", lineBreak,
			"-Sector Reset Cheaper at 500", lineBreak,
			"-More AI in early game overall, no AI when players > 40.", lineBreak,
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
			"2.2.0002", lineBreak,
			"- GOM script fix", lineBreak,
			"- 80% fix for setOwner bug", lineBreak,
			"- Tiered Rearming", lineBreak,
			"- Added Arty", lineBreak,
			"", lineBreak,
			"2.2.0001", lineBreak,
			"- Vehicles now spawn on the ground", lineBreak,
			"- Minor tweaks to heli spawn code", lineBreak,
			"- Minor tweaks to jet spawn code", lineBreak,
			"- Minor tweaks to Kavala", lineBreak,
			"- Doubled spawn protection timer", lineBreak,
			"", lineBreak,
			"2.2.0000", lineBreak,
			"- Prices for vehicles and aircraft overhauled.", lineBreak,
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
			"2.1.0008", lineBreak,
			"- Removed all mines from arsenal", lineBreak,
			"- Increased cost of Exp crates by 3x", lineBreak,
			"- All mines are deleted from the map when a zone is captured", lineBreak,
			"- Friendly fire penalty is 3x more painful", lineBreak,
			"", lineBreak,
			"2.1.0007", lineBreak,
			"- Vec Ammo Box cost adjusted to prevent abuse", lineBreak,
			"- Corpse and Asset cleanup code Improved", lineBreak,
			"- Kavala removed as a heliport until Heli spawn code is improved", lineBreak,
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
			"2.1.0005", lineBreak,
			"- Fix for unflip script on MP servers", lineBreak,
			"- Minor changes to spawn tables/numbers for official servers", lineBreak,
			"", lineBreak,
			"2.1.0004", lineBreak,
			"- Dynamic AI buddy count working on dedi servers", lineBreak,
			"", lineBreak,
			"2.1.0003", lineBreak,
			"- Fixed fast travel to friendly sector zoom bug", lineBreak,
			"", lineBreak,
			"2.1.0002", lineBreak,
			"- Fixed capping height to be 25 meters-ish", lineBreak,
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


