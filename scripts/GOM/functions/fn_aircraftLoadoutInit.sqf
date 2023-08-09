//GOM_fnc_aircraftLoadout V1.35 made by Grumpy Old Man 17-5-2017
/*
feel free to use as you like, as long as I'm credited as the original author
*/

GOM_fnc_addAircraftLoadout = {

	params [["_unit",objnull]];
	if (_unit isequalto objnull) exitWith {systemchat "You need to enter a player as parameter"};
		waitUntil {_unit isequalto _unit};
		sleep 1;
		_support = [_unit,"GOM_aircraftLoadoutMenu"] call BIS_fnc_addCommMenuItem;
		_unit setvariable ["GOM_fnc_aircraftLoadoutCommID",_support];

	true

};


GOM_fnc_removeAircraftLoadout = {
params [["_unit",player]];


	_ID = _unit getvariable ["GOM_fnc_aircraftLoadoutCommID",-1];

	[_unit,_ID] call BIS_fnc_removeCommMenuItem;

	true

};

GOM_fnc_addAircraftLoadoutArea = {

	params ["_thislist"];
	if !(vehicle player in _thislist) exitWith {false};
	if (player isequalto vehicle player) exitWith {false};
	_support = [player,"GOM_aircraftLoadoutMenu"] call BIS_fnc_addCommMenuItem;
	player setvariable ["GOM_fnc_aircraftLoadoutCommID",_support];

	_initpos = getposasl player;

	waituntil {!alive player OR player distance2d _initPos > 30};
	_remove = player spawn GOM_fnc_removeAircraftLoadout;

	true

};

GOM_fnc_roundByDecimals = {

	params ["_num",["_digits",2]];
	round (_num * (10 ^ _digits)) / (10 ^ _digits)

};

GOM_fnc_kgToTon = {

params ["_num",["_limit",10000]];

_out = format ["%1kg",_num];

if (_num >= _limit) then {_num = [(_num / 1000),1] call GOM_fnc_roundByDecimals;_out = format ["%1t",_num,""]};

_out

};

GOM_fnc_setRepairCargo = {

	params ["_veh","_amount"];
	_veh setvariable ["GOM_fnc_repairCargo",_amount max 0,true];
	true

};

if !(profileNamespace getVariable ["GOM_fnc_prepareUI",false]) then {

	profileNamespace setVariable ["GOM_fnc_aircraftLoadoutPresets",[]];
	profileNamespace setVariable ["GOM_fnc_prepareUI",true];

};

GOM_fnc_setAmmoCargo = {

	params ["_veh","_amount"];
	_veh setvariable ["GOM_fnc_ammoCargo",_amount max 0,true];
	true


};


//GOM_fnc_updateDialog performance
//1.24 performance: 0.806452 ms
//increasing performance for 1.3 where this is called on every frame
//1.3 changing GOM_fnc_aircraftLoadoutResourcesCheck changed from 3x vehicles select checks to 3x nearentities: 0.501253 ms
//1.3 GOM_fnc_aircraftLoadoutResourcesCheck from 3x nearentities to 1 nearentities check, then filter the result: 0.473485 ms
//1.3 GOM_fnc_aircraftLoadoutResourcesCheck 1x nearentities check, filter the result for fuel/ammo/repair: 0.429738 ms, almost 50% speed increase
GOM_fnc_updateDialog = {

	params ["_obj",["_preset",false]];


	if (lbCursel 1500 < 0) exitWith {



		_obj = player;
	_check = [_obj] call GOM_fnc_aircraftLoadoutResourcesCheck;

	_check params ["_flags","_vehs"];
	_flags params ["_canRefuel","_canRepair","_canRearm"];
	_vehs params ["_refuelVehs","_repairVehs","_rearmVehs"];


	_availableTexts = ["<t color='#E51B1B'>Not available!</t>","<t color='#1BE521'>Available!</t>"];


	_fueltext = "";
	_repairtext = if (!_canRepair) then {"You need repair sources to repair the aircraft."} else {""};
	_rearmtext = if (!_canRearm) then {"You need ammo sources to rearm the aircraft."} else {""};


_totalammo = 0;
_totalrepair = 0;
_rearmVehs apply {_totalammo = _totalammo + (_x getvariable ["GOM_fnc_ammoCargo",0])};
_repairVehs apply {_totalrepair = _totalrepair + (_x getvariable ["GOM_fnc_repairCargo",0])};

_ammoInfo = format ["%1 from ",(_totalammo call GOM_fnc_kgToTon)];
_repairInfo = format ["%1 from ",(_totalrepair call GOM_fnc_kgToTon)];

_repairVehs = _repairVehs apply {typeof _x};
_rearmVehs = _rearmVehs apply {typeof _x};

	if (_canRepair) then {
		_t = "";
_getText = (_repairVehs call BIS_fnc_consolidateArray) apply {_t = (_t + " " + str (_x select 1) + " " + (getText (configfile >> "CfgVehicles" >> (_x select 0) >> "displayName")) + ",")};

		_s = ["source","sources"] select (count _repairVehs > 1);

		_repairtext = format ["%1%2 repair %3 nearby:%4",_repairInfo,count _repairVehs,_s,_t select [0,((count _t) -1)]];

	};
	if (_canRearm) then {
		_t = "";
	_getText = (_rearmVehs call BIS_fnc_consolidateArray) apply {_t = (_t + " " + str (_x select 1) + " " + (getText (configfile >> "CfgVehicles" >> (_x select 0) >> "displayName")) + ",")};

		_s = ["source","sources"] select (count _rearmVehs > 1);

		_rearmtext = format ["%1%2 ammo %3 nearby:%4",_ammoInfo,count _rearmVehs,_s,_t select [0,((count _t) -1)]];

	};


	_text = format ["<t shadow='2' size='0.75'><t align='center'>Repairing: %1<br />Refueling: %2<br />Rearming: %3<br /><t align='left'>%4<br />%5<br />%6",(_availableTexts select _canRepair),(_availableTexts select _canRefuel),(_availableTexts select _canRearm),_repairtext,_fueltext,_rearmtext];

	(finddisplay 66 displayctrl 1100) ctrlSetStructuredText parsetext _text;

	};

	_veh = call compile  lbData [1500,lbcursel 1500];
	_dispName = lbText [1500,lbCurSel 1500];

	if (lbcursel 2101 >= 0) exitWith {

	_presets = profileNamespace getVariable ["GOM_fnc_aircraftLoadoutPresets",[]];
	_preset = (_presets select {(_x select 0) isEqualTo typeOf _veh AND {(_x select 1) isEqualTo lbText [2101,lbcursel 2101]}}) select 0;
	_preset params ["_vehType","_presetName","_pylons","_pylonAmmoCounts","_textureParams","_pylonOwners","_priorities","_serialNumber"];
	_textureParams params ["_textureName","_textures"];

	_pylonInfoText = "";
	_sel = 0;
	_align = ["<t align='left'>","<t align='center'>","<t align='right'>"];
	_count = 0;
	_priorities = 	_veh getVariable ["GOM_fnc_pylonPriorities",[]];

	{
		_count = _count + 1;
		_owner = "Pilot";
		if !(_pylonOwners isEqualTo []) then {

		_owner = if ((_pylonowners select _forEachIndex+1) isEqualTo []) then {"Pilot"} else {"Gunner"};
	};

	_pylonDispname = getText (configfile >> "CfgMagazines" >> _x >> "displayName");
	_setAlign = _align select _sel;
		_sel = _sel + 1;
	_break = "";
	if (_sel > 2) then {_sel = 0;_break = "<br />"};
	if (count _pylons <= 6) then {_setAlign = "<t align='left'>";_break = "<br />"};

		_priority = "N/A";
		if (count _priorities > 0) then {

	_priority = _priorities select _foreachindex;
};
		_pylonInfoText = _pylonInfoText + format ["%1Pyl%2: %3 Prio. %4 %5 (%6).%7",_setAlign,_count,_owner,_priority,_pylonDispname,_pylonAmmoCounts select _forEachIndex,_break];

	} forEach _pylons;
			_text = format ["<t align='center' size='0.75'>Selected %1 preset: %2 Tail No. %5<br /><br /><t align='left'>Livery: %3<br />%4",_dispName,_presetName,_textureName,_pylonInfoText,_serialNumber];

	(finddisplay 66 displayctrl 1100) ctrlSetStructuredText parsetext _text;

	};

		if (lbCursel 1502 < 0 AND lbCursel 1501 >= 0) exitWith {


	_pylonInfoText = "";
	_sel = 0;
	_align = ["<t align='left'>","<t align='center'>","<t align='right'>"];
	_count = 0;
		_priorities = 	_veh getVariable ["GOM_fnc_pylonPriorities",[]];
	{
		_priority = "N/A";
		if (count _priorities > 0) then {

	_priority = _priorities select _foreachindex;
};
		_count = _count + 1;
		_owner = "N/A";

	_ammo = _veh AmmoOnPylon (_foreachindex+1);

	_pylonDispname = getText (configfile >> "CfgMagazines" >> _x >> "displayName");
	_setAlign = _align select _sel;
		_sel = _sel + 1;
	_break = "";
	if (_sel > 2) then {_sel = 0;_break = "<br />"};
	if (count _pylons <= 6) then {_setAlign = "<t align='left'>";_break = "<br />"};
		_pylonInfoText = _pylonInfoText + format ["%1Pyl%2: %3 Prio. %4 %5 (%6).%7",_setAlign,_count,_owner,_priority,_pylonDispname,_ammo,_break];

	} forEach GetPylonMagazines _veh;
			_text = format ["<t align='center' size='0.75'>%1 current loadout:<br /><br /><t align='left' size='0.75'><br />%2",_dispName,_pylonInfoText];

	(finddisplay 66 displayctrl 1100) ctrlSetStructuredText parsetext _text;

	};

	_driverName = (name ((_veh getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID));
	_rank = "";

	_mag = "N/A";
	_get = "";
	if (lbcursel 1502 > -1) then {_get = (lbdata [1502,(lbCursel 1502)]);};
	_ind2 = "N/A";
	_pylonMagDispName = getText (configfile >> "CfgMagazines" >> _get >> "displayName");
	_pylonMagType = getText (configfile >> "CfgMagazines" >> _get >> "displayNameShort");
	_pylonMagDetails = getText (configfile >> "CfgMagazines" >> _get >> "descriptionShort");
	if (_pylonMagDispName isequalto "") then {_pylonMagDispName = "N/A"};
	if (_pylonMagType isequalto "") then {_pylonMagType = "N/A"};
	if (_pylonMagDetails isequalto "") then {_pylonMagDetails = "N/A"};
	_pyl = "N/A";
	if (lbcursel 1501 > -1) then {_pyl = (lbdata [1501,(lbCursel 1501)]);};

	_curFuel = fuel _veh;

	_maxFuel = getNumber (configfile >> "CfgVehicles" >> typeof _veh >> "fuelCapacity");
	_fuel = [(_curFuel * _maxfuel),1] call GOM_fnc_roundByDecimals;

		_missingFuel = _maxfuel - _fuel;

	_pylonOwner = _veh getVariable ["GOM_fnc_aircraftLoadoutPylonOwner",[]];

	_pylonOwnerName = "Pilot";
	_nextOwnerName = "Gunner";
	if !(_pylonOwner isEqualTo []) then {_pylonOwnerName = "Gunner"};
	_ownerText = format ["Operated by: %1",_pylonOwnerName];

	_integrity = [((damage _veh * 100) - 100) * -1] call GOM_fnc_roundByDecimals;

	_pylontext = format ["Mount %1 on %2 - %3<br /><br /><t align='left'>Weapon Type: %4<br />Details: %5",_pylonMagDispName,_pyl,_ownertext,_pylonMagType,_pylonMagDetails];

		if (lbcursel 1502 < 0) then {_pylontext = ""};

		_kills = _veh getVariable ["GOM_fnc_aircraftLoadoutTrackStats",[]];

		_killtext = if (_kills isequalto []) then {"Confirmed kills:<br />None"} else {
		_kills params ["_infantry","_staticWeapon","_cars","_armored","_chopper","_plane","_ship","_building","_parachute"];

		_typeNamesS = ["infantry","static weapon","vehicle","armored vehicle","helicopter","plane","ship","building","parachuting kitten"];
		_typeNamesPL = ["infantry","static weapons","vehicles","armored vehicles","helicopters","planes","ships","buildings","parachuting kittens"];

		_out = "Confirmed kills:<br />";
		_index = -1;
		_killText = _kills apply {_index = _index + 1;_kind = ([_typeNamesS select _index,_typeNamesPL select _index] select (_x > 1));
			if (_x > 0) then {

				_out = _out + (format ["%1 %2, ",_x,_kind])};

		};
_out = _out select [0,count _out - 2];
_out = _out + ".";
_out
		};

_landings = _veh getvariable ["GOM_fnc_aircraftStatsLandings",0];

_landingtext = format ["Successful landings: %1<br />",_landings];
if (typeof _veh iskindof "Helicopter") then {_landingtext = "<br />"};
if (lbcursel 1502 >= 0) then {_landingtext = "";_killtext = ""};


	_tailNumber = [] call GOM_fnc_aircraftGetSerialNumber;


	_text = format ["<t align='center' size='0.75'>%1 - %11, Integrity: %2%3<br />Pilot: %4%5<br />Fuel: %6l / %7l<br />%8<br />%9<br />%10",_dispName,_integrity,"%",_rank,_driverName,_fuel,_maxFuel,_pylontext,_landingtext,_killtext,_tailnumber];

	(finddisplay 66 displayctrl 1100) ctrlSetStructuredText parsetext _text;
true
};

GOM_fnc_setPylonLoadoutLBPylonsUpdate = {
	params ["_obj"];
	if (lbCursel 1500 < 0) exitWith {false};

	_veh = call compile  lbData [1500,lbcursel 1500];
	_updateLB = [_obj] call GOM_fnc_updatePresetLB;
	_validPylons = (("isClass _x" configClasses (configfile >> "CfgVehicles" >> typeof _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons")) apply {configname _x});

	lbClear 1501;
	{
		if !(["dummy", _x] call BIS_fnc_inString) then {
			lbAdd [1501,_x];
			lbsetData [1501,_foreachIndex,_x];
		};
	} forEach _validPylons;

	_colorConfigs = "true" configClasses (configfile >> "CfgVehicles" >> typeof _veh >> "textureSources");
	if (_colorConfigs isequalto []) then {lbclear 2100;lbAdd [2100,"No paintjobs available."];lbSetCurSel [2100,0]};

	findDisplay 66 displayCtrl 2800 cbSetChecked (vehicleReportRemoteTargets _veh);
	findDisplay 66 displayCtrl 2801 cbSetChecked (vehicleReceiveRemoteTargets _veh);
	findDisplay 66 displayCtrl 2802 cbSetChecked (vehicleReportOwnPosition _veh);

	playSound "Click";
	true
};

GOM_fnc_updateAmmoCountDisplay = {

	if (lbCursel 1500 >= 0 AND lbCursel 1501 < 0 AND lbCursel 1502 < 0) exitWith {

	ctrlSettext [1600,format ["Set Serial Number",""]];
	(finddisplay 66 displayctrl 1105) ctrlSetStructuredText parsetext "<t align='center'>Serial Number:";
	ctrlSetText [1400,[] call GOM_fnc_aircraftGetSerialNumber];

	};

	if (lbCursel 1500 < 0) exitWith {false};
	if (lbCursel 1501 < 0) exitWith {false};
	if (lbCursel 1502 < 0) exitWith {false};


	ctrlSettext [1600,"Install Weapon"];

	(finddisplay 66 displayctrl 1105) ctrlSetStructuredText parsetext "<t align='center'>Amount:";

	_mag = lbdata [1502,lbCursel 1502];
	_count = getNumber (configfile >> "CfgMagazines" >> _mag >> "count");

	ctrlSetText [1400,str _count];

true
};

GOM_fnc_pylonInstallWeapon = {

	params ["_obj"];



	if (lbCursel 1502 < 0 OR lbCursel 1501 < 0) exitWith {false};

	_veh = call compile  lbData [1500,lbcursel 1500];

	_mag = lbdata [1502,lbCurSel 1502];
	_magDispName = getText (configfile >> "CfgMagazines" >> _mag >> "displayName");

	_maxAmount = getNumber (configfile >> "CfgMagazines" >> _mag >> "count");

	_setAmount = parsenumber (ctrlText 1400);//only allows numbers

	_finalAmount = _setAmount min _maxAmount max 0;//limit range

	if (_setAmount > _maxAmount) then {systemchat "Invalid number, defaulting to allowed amount.";playsound "Simulation_Fatal";ctrlsetText [1400,str _maxAmount]};

	_pylonNum = lbCurSel 1501 + 1;
	_pylonName = lbdata [1501,lbCurSel 1501];

_check = _veh call GOM_fnc_rearmCheck;
_check params ["_abort","_text","_ammosource"];
if (_abort) exitWith {true};


	_add = [_veh,_pylonNum,_mag,_finalAmount,_magDispName,_pylonName,_ammosource] spawn GOM_fnc_installPylons;


	playSound "Click";
true
};

GOM_fnc_properWeaponRemoval = {

params ["_veh","_pylonToCheck"];

_currentweapons = weapons _veh;
_pylons = GetPylonMagazines _veh;
_pylonWeapons = _pylons apply {getText ((configfile >> "CfgMagazines" >> _x >> "pylonWeapon"))};
_weaponToCheck = _pylonweapons select lbcursel 1501;
_check = (count (_pylonweapons select {_x isEqualTo _weaponToCheck}) isEqualTo 1);
_check2 = _pylonweapons select {_x isEqualTo _weaponToCheck};
systemchat str _check;
systemchat str _check2;
systemchat format ["2Checking for %1",_weaponToCheck];
if (count (_pylonweapons select {_x isEqualTo _weaponToCheck}) isEqualTo 1) then {_veh removeWeaponGlobal _weaponToCheck;Systemchat ("Removed " + _weaponToCheck)};//remove the current pylon weapon if no other pylon is using it

};


GOM_fnc_installPylons = {

	params ["_veh","_pylonNum","_mag","_finalAmount","_magDispName","_pylonName","_ammosource"];
	_weaponCheck = [_veh,_mag] call GOM_fnc_properWeaponRemoval;
	_check = _veh getVariable ["GOM_fnc_airCraftLoadoutPylonInstall",[]];

	if (_pylonNum in _check) exitWith {systemchat "Installation in progress!"};
	_pylonOwner = _veh getVariable ["GOM_fnc_aircraftLoadoutPylonOwner",[]];

	_pylonOwnerName = "Pilot";
	_nextOwnerName = "Gunner";
	if !(_pylonOwner isEqualTo []) then {_pylonOwnerName = "Gunner"};
	_initArray = GetPylonMagazines _veh;
	_init = [];
	_initArray apply {_init pushback []};//should solve r3vos bug, might be because undefined pylon owner
	_storePylonOwners = _veh getVariable ["GOM_fnc_aircraftLoadoutPylonOwners",_init];//maybe r3vos bug
	_storePylonOwners set [_pylonNum,_pylonOwner];
	_veh setVariable ["GOM_fnc_aircraftLoadoutPylonOwners",_storePylonOwners,true];

	systemchat format ["Installing %1 %2 on %3, operated by %4!",_finalAmount,_magDispName,_pylonName,_pylonOwnerName];
	_check pushback _pylonNum;
	_veh setVariable ["GOM_fnc_airCraftLoadoutPylonInstall",_check, [2, clientOwner]];

sleep random [0.5,1,2.5];



		[_veh,[_pylonNum,"",true,_pylonOwner]] remoteexec ["setPylonLoadOut",0];
		[_veh,[_pylonNum,_mag,true,_pylonOwner]] remoteexec ["setPylonLoadOut",0];



		[_veh,[_pylonNum,0]] remoteexec ["SetAmmoOnPylon",0];

sleep random [0.5,1,2.5];
		[_ammosource,_mag,_veh] call GOM_fnc_handleAmmoCost;
	if (_finalamount <= 24) then {

	for "_i" from 1 to _finalamount do {


		[_veh,[_pylonNum,_i]] remoteexec ["SetAmmoOnPylon",0];
		_sound = [_veh,_pylonNum-1] call GOM_fnc_pylonSound;
		sleep random [0.5,1,2.5];

	};

	} else {

		[_veh,[_pylonNum,_finalamount]] remoteexec ["SetAmmoOnPylon",0];
		_sound = [_veh,_pylonNum-1] call GOM_fnc_pylonSound;
sleep random [0.5,1,2.5];
	};
		_ammosource setvariable ["GOM_fnc_aircraftLoadoutBusyAmmoSource",false,true];
	_checkOut = _veh getVariable ["GOM_fnc_airCraftLoadoutPylonInstall",[]];
	_checkOut = _checkOut - [_pylonNum];
	_veh setVariable ["GOM_fnc_airCraftLoadoutPylonInstall",_checkOut,[2, clientOwner]];

	systemchat format ["Successfully installed %1 %2 on %3!",_finalAmount,_magDispName,_pylonName];
	true
};

GOM_fnc_clearAllPylons = {


	if (!(finddisplay 66 isequalto displaynull) AND lbcursel 1500 < 0) exitWith {"No aircraft selected!"};
	params [["_veh",call compile lbData [1500,lbcursel 1500]]];
	_nosound = false;
	if (finddisplay 66 isequalto displaynull) then {_nosound = true} else {_veh = call compile lbdata [1500,lbcursel 1500]};
	_activePylonMags = GetPylonMagazines _veh;

	{

		[_veh,[_foreachIndex + 1,"",true]] remoteexec ["setPylonLoadOut",0];
		[_veh,[_foreachIndex + 1,0]] remoteexec ["SetAmmoOnPylon",0];
		if (!_nosound) then {

	_sound = [_veh,_foreachindex] call GOM_fnc_pylonSound;
};

	} forEach _activePylonMags;

		if (!_nosound) then {
	playSound "Click";
};
	_pylonWeapons = [];
	{ _pylonWeapons append getArray (_x >> "weapons") } forEach ([_veh, configNull] call BIS_fnc_getTurrets);
	{ [_veh,_x] remoteexec ["removeWeaponGlobal",0] } forEach ((weapons _veh) - _pylonWeapons);

	systemchat "All pylons cleared!";
true
};

GOM_fnc_aircraftLoadoutClear = {
	params ["_veh"];

	_activePylonMags = GetPylonMagazines _veh;

	{

		[_veh,[_foreachIndex + 1,"",true]] remoteexec ["setPylonLoadOut",0] ;
		[_veh,[_foreachIndex + 1,0]] remoteexec ["SetAmmoOnPylon",0] ;

	} forEach _activePylonMags;

	_pylonWeapons = [];
	{ _pylonWeapons append getArray (_x >> "weapons") } forEach ([_veh, configNull] call BIS_fnc_getTurrets);
	{ _veh removeWeaponGlobal _x } forEach ((weapons _veh) - _pylonWeapons);
true
};

GOM_fnc_handleAmmoCost = {

params ["_source","_mag","_veh"];


	_ammocargo = _source getVariable ["GOM_fnc_ammoCargo",0];

	_ammoweight = 30 * (getmass _veh * 0.001) min 200;//no better formula since you can't pull anything out of the config, values are all over the place, mass seems to be volume and weight is not defined for 99% of all mag classes. todo replace with proper values once BI uses some

	_ammocargo = _ammocargo - _ammoweight;
	_source setVariable ["GOM_fnc_ammoCargo",(_ammocargo max 0),true];

};

GOM_fnc_rearmCheck = {

	params ["_veh"];


	_abort = false;
	_text = "";
_vehs = ((_veh nearEntities ["All",50]) select {speed _x < 1 AND {alive _x} AND {_x getvariable ["GOM_fnc_ammoCargo",0] > 0}});

	if (_vehs isequalto []) then {_abort = true;_text = "You have no valid ammo sources!";};
	_vehs params ["_source"];
	_cargo = _source getVariable ["GOM_fnc_ammoCargo",0];

	if (_cargo <= 0) then {_abort = true;_text = "Your ammo is depleted!"};

	_notBusy = _vehs select {!(_x getVariable ["GOM_fnc_aircraftLoadoutBusyAmmoSource",false])};

		if (_notBusy isEqualTo []) then {_source = objnull;_text =  "All ammo sources are currently busy!";_abort = true;};
		if !(_notBusy isEqualTo []) then {_source = _notBusy select 0;};


if (_abort) then {systemchat _text;playsound "Simulation_Fatal"};

if (!_abort) then {_source setVariable ["GOM_fnc_aircraftLoadoutBusyAmmoSource",false,true];};
	[_abort,_text,_source]

};

GOM_fuelLeak = {

	params ["_veh"];

	_hitparts = getAllHitPointsDamage _veh;
	if (_hitparts isEqualTo []) exitWith {diag_log format ["%1 has no hitpoints defined!",typeof _veh];[false,0]};
	_hitparts params ["_hitpoints","_selections","_damages"];
	_count = -1;

	_output = [];

	_hitpoints apply {
		_count = _count + 1;
		if (toUpper _x find "FUEL" >=0 AND _damages select _count > 0) then {

			_output pushback [_damages select _count,_x];

		}

	};

	_output sort true;
	_leaking = false;
	_leakLevel = 1;

	if (count _output > 0) then {

		_leaking = true;
		_leakLevel = _output select 0 select 0;

	};

	[_leaking,_leaklevel]

};




GOM_fnc_repairCheck = {
	params ["_veh"];

	_abort = false;
	_text = "";
_vehs = ((_veh nearEntities ["All",50]) select {speed _x < 1 AND {alive _x} AND {_x getvariable ["GOM_fnc_repairCargo",0] > 0}});

	if (_vehs isequalto []) then {_abort = true;_text = "You have no more spare parts!";};
	_vehs params ["_source"];
	_cargo = _source getVariable ["GOM_fnc_repairCargo",0];

	if (_cargo <= 0) then {_abort = true;_text = "Your spare parts is depleted!"};

		_notBusy = _vehs select {!(_x getVariable ["GOM_fnc_aircraftLoadoutBusyRepairSource",false])};

		if (_notBusy isEqualTo []) then {_text =  "All repair sources are currently busy!";_abort = true;};
		if !(_notBusy isEqualTo []) then {_source = _notBusy select 0;};

		if (_abort) then {systemchat _text;playsound "Simulation_Fatal"};
	if (!_abort) then {_source setVariable ["GOM_fnc_aircraftLoadoutBusyRepairSource",true,true];};

	[_abort,_text,_source]


};

GOM_fnc_setPylonsRearm = {

	if (lbCursel 1500 < 0) exitWith {systemchat "No aircraft selected!";false};
	params ["_obj",["_rearm",false],["_pylons",[]],["_pylonAmmoCounts",[]]];
	_nul = [_obj,_rearm,_pylons,_pylonAmmoCounts] spawn {

	params ["_obj",["_rearm",false],["_pylons",[]],["_pylonAmmoCounts",[]]];

	_veh = call compile lbData [1500,lbcursel 1500];


	_check = _veh call GOM_fnc_rearmCheck;
	_check params ["_abort","_text","_ammosource"];
	if (_abort) exitWith {true};

	if (!alive _veh) exitWith {systemchat "Aircraft is destroyed!"};
	if (_veh getVariable ["GOM_fnc_aircraftLoadoutRearmingInProgress",false]) exitWith {systemchat "Aircraft is currently being rearmed!"};
	_veh setVariable ["GOM_fnc_aircraftLoadoutRearmingInProgress",true,[2, clientOwner]];
	_activePylonMags = GetPylonMagazines _veh;

	if (_rearm) exitWith {

		[_obj] call GOM_fnc_clearAllPylons;
			_pylonOwners = _veh getVariable ["GOM_fnc_aircraftLoadoutPylonOwners",[]];

		{
			_pylonOwner = if (_pylonOwners isequalto []) then {[]} else {_pylonOwners select (_foreachindex + 1)};

			[_veh,[_foreachindex+1,_x,true,_pylonOwner]] remoteexec ["setPylonLoadOut",0] ;
			[_veh,[_foreachIndex + 1,0]] remoteexec ["SetAmmoOnPylon",0] ;
		} foreach _pylons;

		sleep 0.1;
		_check = _veh call GOM_fnc_rearmCheck;
		_check params ["_abort","_text","_ammosource"];
		if (_abort) exitWith {true};
		
		{
			_mag = _activePylonMags select _forEachIndex;

			_pylonOwners = _veh getVariable ["GOM_fnc_aircraftLoadoutPylonOwners",[]];
			_pylonOwner = if (_pylonOwners isequalto []) then {[]} else {_pylonOwners select (_foreachindex + 1)};
			_maxAmount = (_pylonAmmoCounts select _forEachIndex);

			sleep 0.2;

			[_ammosource,_x,_veh] call GOM_fnc_handleAmmoCost;

			_cargo = _ammosource getVariable ["GOM_fnc_ammoCargo",0];
			if (_cargo <= 0) exitwith {_abort = true; systemchat "Your ammo is depleted!"};

			if (_maxamount < 24) then {

				for "_i" from 0 to _maxamount do {
					sleep 0.01;
					[_veh, [_foreachIndex + 1, _i]] remoteexec ["SetAmmoOnPylon", 0, true];
					if (_i > 0) then {
						_sound = [_veh,_foreachIndex] call GOM_fnc_pylonSound;
					};
				};
			} else {
				[_veh, [_foreachIndex + 1, _maxamount]] remoteexec ["SetAmmoOnPylon",0] ;
				_sound = [_veh,_foreachIndex] call GOM_fnc_pylonSound;
			};
		} forEach _pylons;

		playSound "Click";
		_ammosource setVariable ["GOM_fnc_aircraftLoadoutBusyAmmoSource",false,true];
		_veh setVariable ["GOM_fnc_aircraftLoadoutRearmingInProgress",false,[2, clientOwner]];
		if (_abort) exitWith {true};
		_veh setVehicleAmmo 1;
		systemchat "All pylons, counter measures and board guns rearmed!";

		_rearmTime = switch true do {
			case (_veh isKindOf "Helicopter"): {600};
			case (_veh isKindOf "Plane"): {1200};
			default {600};
		};
		_veh setVariable ["BIS_WL_nextRearm", serverTime + _rearmTime];
		
		true
	};


	sleep 0.1;
	_check = _veh call GOM_fnc_rearmCheck;
	_check params ["_abort","_text","_ammosource"];
	if (_abort) exitWith {true};

	_mounts = [];
	{
		_mount = [_veh,_forEachIndex+1,_x,_ammosource] spawn {
		params ["_veh","_ind","_mag","_ammosource"];

		_maxAmount = getNumber (configfile >> "CfgMagazines" >> _mag >> "count");
			sleep 0.1;
			[_ammosource,_mag,_veh] call GOM_fnc_handleAmmoCost;

			_cargo = _ammosource getVariable ["GOM_fnc_ammoCargo",0];
			if (_cargo <= 0) exitwith {_abort = true;systemchat "Your ammo is depleted!"};

			if (_maxamount < 24) then {

			for "_i" from (_veh AmmoOnPylon _ind) to _maxamount do {
				sleep 0.01;
				[_veh,[_ind,_i]] remoteexec ["SetAmmoOnPylon",0];

				if (_i > 0) then {
					_sound = [_veh,_ind - 1] call GOM_fnc_pylonSound;
				};
			};
			} else {
					[_veh,[_ind,_maxamount]] remoteexec ["SetAmmoOnPylon",0];

			_sound = [_veh, _ind - 1] call GOM_fnc_pylonSound;
			};
		};
		_mounts pushback _mount;

	} forEach _activePylonMags;

	waituntil {!alive _veh OR {scriptdone _x} count _mounts isequalto count _mounts};
	_ammosource setVariable ["GOM_fnc_aircraftLoadoutBusyAmmoSource",false,true];
	playSound "Click";
	_veh setVariable ["GOM_fnc_aircraftLoadoutRearmingInProgress",false,true];

	_rearmTime = switch true do {
		case (_veh isKindOf "Helicopter"): {600};
		case (_veh isKindOf "Plane"): {1200};
		default {600};
	};
	_veh setVariable ["BIS_WL_nextRearm", serverTime + _rearmTime];

	if (_abort) exitWith {true};
		_veh setVehicleAmmo 1;
		systemchat "All pylons, counter measures and board guns rearmed!";

		_rearmTime = switch true do {
			case (_veh isKindOf "Helicopter"): {600};
			case (_veh isKindOf "Plane"): {1200};
			default {600};
		};
		_veh setVariable ["BIS_WL_nextRearm", serverTime + _rearmTime]; 
	};
	true
};

GOM_fnc_setPylonsRepair = {
	if (lbCursel 1500 < 0) exitWith {systemchat "No aircraft selected!";false};
	params ["_obj"];
	_veh = call compile  lbData [1500,lbcursel 1500];
	_check = _veh call GOM_fnc_repairCheck;
	_check params ["_abort","_text","_repairSource"];
	if (_abort) exitWith {true};

	_repair = [_veh,_repairSource,_obj] spawn {
		params ["_veh","_repairSource","_obj"];
		_curDamage = damage _veh;
		_abort = false;
		_timer = 0;

		if (!alive _veh) exitWith {systemchat "Aircraft is destroyed!"};
		if (_curDamage isEqualTo 0) exitWith {systemchat "Aircraft is already at 100% integrity!"};

		_sourceDispname = getText (configfile >> "CfgVehicles" >> typeof _repairSource >> "displayName");
		_vehDispName = getText (configfile >> "CfgVehicles" >> typeof _veh >> "displayName");
		_repairTick = (1 / 60);
		_timeNeeded = ceil (_curDamage / _repairtick);
		_repairCargoPerTick = 30 * (getmass _veh * 0.00015);//30kg base per tick is decent enough, makes repairs more expensive than refuelling/rearming, also repairing heavier aircraft will be way more expensive than light ones
		_damDisp = [((_curDamage * 100) - 100) * -1] call GOM_fnc_roundByDecimals;
		systemchat "Aircraft has to remain stationary during repair procedure!";
		systemchat format ["Repairing %1 from %2%3! Total duration: %4s.",_vehDispName,_damDisp,"%",_timeNeeded];
		_empty = false;
		
		while {damage _veh > 0 && {alive _veh && {!_abort && {!_empty}}}} do {
			if (speed _veh > 3 OR speed _repairSource > 3) exitWith {_abort = true;systemchat "Aborting repair! Vehicle is moving!"};
			_curDamage = damage _veh;
			_timeNeeded = ceil (_curDamage / _repairtick);

			_repairCargo = _repairSource getvariable ["GOM_fnc_repairCargo",0];
			_repairCargo = (_repairCargo - _repairCargoPerTick) max 0;
			_repairSource setvariable ["GOM_fnc_repairCargo",_repairCargo,true];
			if (_repairCargo isEqualTo 0) exitWith {systemchat "You have no more spare parts!";_empty = true};

			[player, "repair", 0, (_curDamage - _repairTick), _veh] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2];
			_sound = [_veh] call GOM_fnc_pylonSound;
			_damDisp = [((_curDamage * 100) - 100) * -1] call GOM_fnc_roundByDecimals;
			if (_timer % 10 isEqualTo 0) then {
				systemchat format ["%1 remaining: %2%3, %4s.",_vehDispName,_damDisp,"%",_timeNeeded];
			};
			_timeout = time + 1;
			waituntil {time > _timeout || {speed _veh > 3 || {speed _repairSource > 3}}};
			_timer = _timer + 1;
		};

		_repairSource setVariable ["GOM_fnc_aircraftLoadoutBusyRepairSource",false,true];
		if (!_abort OR !_empty) then {
			systemchat format ["%1 repaired: %2%3!",_vehDispName,_damDisp,"%"]
		} else {
			systemchat "Repair aborted!"
		};
		playSound "Click";
	};
	playSound "Click";
	true
};

GOM_fnc_setPylonsRefuel = {
	if (lbCursel 1500 < 0) exitWith {systemchat "No aircraft selected!";false};

	params ["_obj"];

	if (lbCursel 1500 < 0) exitWith {false};

	_veh = call compile  lbData [1500,lbcursel 1500];


_check = [false, "", objNull];
_check params ["_abort","_text","_refuelSource"];
if (_abort) exitWith {true};

_fuelLeak = [_veh] call GOM_fuelLeak;
_fuelleak params ["_leaking","_leakingLevel"];
if (_leaking AND _leakingLevel > 0.9) exitWith {systemchat "This aircraft will be heavily leaking fuel when refueling!";systemchat "Repair it first!";playsound "Simulation_Fatal";	_refuelSource setVariable ["GOM_fnc_aircraftLoadoutBusyFuelSource",false,true];
};

if (_leaking AND _leakingLevel < 0.9 AND _leakingLevel > 0.1) then {systemchat format ["This aircraft will leak fuel down to %1%2 when refueling!",round ((1 - _leakinglevel) * 100),"%"];systemchat "Repair it first!";playsound "Simulation_Restart"};

	_refuel = [_veh,_refuelSource,_obj] spawn {
		params ["_veh","_refuelSource","_obj"];
		_curFuel = fuel _veh;
		_abort = false;
		_timer = 0;
		if (!alive _veh) exitWith {systemchat "Aircraft is destroyed!"};
		if (_curFuel isEqualTo 1) exitWith {systemchat "Aircraft is already at 100% fuel capacity!"};
		_maxFuel = getNumber (configfile >> "CfgVehicles" >> typeof _veh >> "fuelCapacity");
		_sourceDispname = getText (configfile >> "CfgVehicles" >> typeof _refuelSource >> "displayName");

		_vehDispName = getText (configfile >> "CfgVehicles" >> typeof _veh >> "displayName");
		_fuel = round(_curFuel * _maxfuel);

		_missingFuel = _maxfuel - _fuel;
		_fillrate = GOM_fnc_aircraftLoadoutRefuelRate;
		_timeNeeded = ((_missingFuel / _fillrate) * 60);

		_fuelTick = ((1 - _curFuel) / _timeNeeded);
		_fuelPerTick = GOM_fnc_aircraftLoadoutRefuelRate / 60;



	systemchat format ["Refuelling %1 from %2. %3l in %4s. Fillrate: 1800l/min.",_vehDispName,_sourceDispname,[_missingfuel,1] call GOM_fnc_roundByDecimals,[_timeNeeded,1] call GOM_fnc_roundByDecimals];
		_empty = false;
		_leaking = false;
		while {fuel _veh < 0.99 AND alive _veh AND !_abort AND !_empty} do {

_fuelLeak = [_veh] call GOM_fuelLeak;
_fuelleak params ["_leaking","_leakingLevel"];
if (_leaking AND fuel _veh > (1 - _leakingLevel)) exitWith {systemchat format ["This aircraft will leak fuel down to %1%2 unless repaired!",round ( (1 - _leakinglevel) * 100),"%"];systemchat "Stopping Refueling procedure due to fuel leak!";playsound "Simulation_Fatal";	_refuelSource setVariable ["GOM_fnc_aircraftLoadoutBusyFuelSource",false,true];
};

			if (speed _veh > 3 OR speed _refuelSource > 3) exitWith {_abort = true;systemchat "Aborting refuelling! Vehicle is moving!"};
		_curFuel = fuel _veh;

		[_veh,(_curFuel + _fuelTick)] remoteExec ["setFuel",_veh];

		_fuel = [(_curFuel * _maxfuel),1] call GOM_fnc_roundByDecimals;

		_missingFuel = _maxfuel - _fuel;

				_timeNeeded = round ((_missingFuel / _fillrate) * 60);

		if (_timer % 10 isEqualTo 0) then {systemchat format ["%1 remaining: %2l, %3s.",_vehDispName,_missingFuel,_timeNeeded];
};
			_timeout = time + 1;
			waituntil {time > _timeout OR speed _veh > 3 OR speed _refuelSource > 3};
			_timer = _timer + 1;
		};
			if (!_abort AND !_empty AND !_leaking) then {	systemchat format ["%1 filled up!",_vehDispName];
				_refuelSource setVariable ["GOM_fnc_aircraftLoadoutBusyFuelSource",false,true];

} else {
	_refuelSource setVariable ["GOM_fnc_aircraftLoadoutBusyFuelSource",false,true];

if (_abort) then {systemchat "Refuelling aborted!"};

};

	_refuelSource setVariable ["GOM_fnc_aircraftLoadoutBusyFuelSource",false,true];
		playSound "Click";
	};
true

};

GOM_fnc_fillPylonsLB = {
	params ["_obj"];
	if (lbCursel 1500 < 0) exitWith {false};

	_veh = call compile  lbData [1500,lbcursel 1500];
	_pylon = lbData [1501,lbcursel 1501];
	_getCompatibles = getArray (configfile >> "CfgVehicles" >> typeof _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons" >> _pylon >> "hardpoints");

	if (_getCompatibles isEqualTo []) then {
		//darn BI for using "Pylons" and "pylons" all over the place as if it doesnt fucking matter ffs honeybadger
		_getCompatibles = getArray (configfile >> "CfgVehicles" >> typeof _veh >> "Components" >> "TransportPylonsComponent" >> "pylons" >> _pylon >> "hardpoints");
	};

	_validPylonMags = GOM_list_allPylonMags select {!((getarray (configfile >> "CfgMagazines" >> _x >> "hardpoints") arrayIntersect _getCompatibles) isEqualTo [])};
	_validDispNames = GOM_list_validDispNames;
	lbClear 1502;

	if (GOM_fnc_allowAllPylons) then {
		_validPylonMags = GOM_list_allPylonMags;
		_validDispNames = _validPylonMags apply {getText (configfile >> "CfgMagazines" >> _x >> "displayName")};
	} else {
		_validPylonMags = GOM_list_allPylonMags select {!((getarray (configfile >> "CfgMagazines" >> _x >> "hardpoints") arrayIntersect _getCompatibles) isEqualTo [])};
		_validDispNames = _validPylonMags apply {getText (configfile >> "CfgMagazines" >> _x >> "displayName")};
	};

	{
		lbAdd [1502, _validDispNames select _foreachIndex];
		lbsetData [1502,_foreachIndex,_x];
	} forEach _validPylonMags;
	true
};

GOM_fnc_aircraftGetSerialNumber = {

	if (lbcursel 1500 < 0) exitwith {false};

	params [["_veh",call compile (lbdata [1500,lbcursel 1500])]];

	_textures = getObjectTextures _veh;
	_numberTextures = _textures select {toUpper _x find "NUMBER" > 0};

	if (_numberTextures isequalto [] AND lbcursel 1501 < 0 AND lbcursel 1502 < 0) exitWith {ctrlSetText [1400,"N/A"];
"N/A"};

	_texture = _numbertextures select 0;
	_index = _textures find _texture;
	_output = "";

	_numbertextures apply {

		_number = _x select [count _x - 8,1];
		_index = _index + 1;
		_output = _output + _number;

	};
	_output

};

GOM_fnc_aircraftSetSerialNumber = {


	params [["_veh",call compile (lbData [1500,lbcursel 1500])],["_number",ctrltext 1400]];


	_selections = getArray (configfile >> "CfgVehicles" >> typeof _veh >> "hiddenSelections");
	_textures = getArray (configfile >> "CfgVehicles" >> typeof _veh >> "hiddenSelectionsTextures");
	_numberTextures = _textures select {toUpper _x find "NUMBER" > 0};



	if (lbcursel 1501 >= 0 OR lbcursel 1502 >= 0) exitWith {false};
	if (_numberTextures isequalto []) exitWith {
		ctrlSetText [1400,"N/A"];
		systemchat "Aircraft does not support tail numbers.";playsound "Simulation_Fatal"; false};
	_index = _textures find (_numberTextures select 0);

	if (count _number > 3) then {_number = _number select [0,3];systemchat "Invalid Number, using first 3 digits instead!";ctrlSetText [1400,_number select [0,3]];
};
	_numberArray = toarray _number;

	_zeroesneeded = 3 - count _numberarray;
	_fill = [];
	_fill resize (3 - count _numberarray);
	_fill = _fill apply {48};

	_numberarray = _fill + _numberarray;
	_numberarray = _numberarray apply {parsenumber tostring [_x]};
	_count = 0;
	_numberarray apply {

		_oldSuffix = (_textures select _index) select [count (_textures select _index) - 7,7];
		_oldPrefix = (_textures select _index) select [0,count (_textures select _index) - 9];
		_newTexture = _oldPrefix + "0" + str _x + _oldsuffix;
		_veh setObjectTextureGlobal [(_index + _count),_newTexture];
		_count = _count + 1;

	};
	_vehDispName = getText (configfile >> "CfgVehicles" >> typeof _veh >> "displayName");
	systemchat format ["Changed %1 tail number to: %2",_vehDispName,str _number];

};


//using BIS_fnc_numberDigits for _yeararray: 0.0742 ms
//replacing BIS_fnc_numberDigits with toarrayapplyparsenumber voodoo: 0.0256 ms
//simplifying return: 0.0224 ms
//further simplifying return: 0.0216 ms
//replacing --toarray str _year apply {parsenumber (tostring [_x])}-- with toarray str _year apply {_x-48}: 0.0204 ms
//tiny improvement but still
GOM_fnc_getWeekday = {

	params [["_date",date]];

	_date params ["_year","_m","_q"];

	_yeararray = toarray str _year apply {_x-48};

	_yeararray params ["_y1","_y2","_y3","_y4"];
	_J = ((_y1) * 10) + (_y2);
	_K = ((_y3) * 10) + (_y4);

	if (_m < 3) then {_m = _m + 12};

	["","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"] select (_q + floor ( ((_m + 1) * 26) / 10 ) + _K + floor (_K / 4) + floor (_J / 4) - (2 * _J)) mod 7

};

//1.24 0.265608
//1.3 added weekday check to only calculate if date changes: 0.216591 ms
//1.3 added position check to only check if player moves: 0.153993 ms, looks fair enough
GOM_fnc_titleText = {

	date params ["_year","_month","_day"];
	_checkdate = [_year,_month,_day];

	_lastCheck = player getVariable ["GOM_fnc_titleTextCheckDate",[[0,0,0],""]];
	_lastCheck params ["_lastDate","_weekDay"];

	if !(_checkDate isequalto _lastDate) then {

	_weekday = [] call GOM_fnc_getWeekday;
	player setvariable ["GOM_fnc_titleTextCheckDate",[_checkdate,_weekday]];

	};
	_date = format ["%1, %2.%3.%4",_weekday,_day,_month,_year];//suck it americans

	_posCheck = player getvariable ["GOM_fnc_titleTextPosChange",[[0,0,0],"",""]];
	_posCheck params ["_checkPos","_nearestloc","_coords"];


	if (player distance2d _checkPos > 50) then {
	_playerpos = getposasl player;
	_coords = mapGridPosition _playerpos;
	_nearLocs = nearestlocations [_playerpos,["NameMarine","NameVillage","NameCity","NameCityCapital"],5000,_playerpos];
	_nearlocs apply {text _x != ""};
	_nearestloc = "";
	if (_nearlocs isequalto []) then {_nearestloc = ""} else {
	_nearestloc = text (_nearlocs select 0) + " - ";
	};
	player setvariable ["GOM_fnc_titleTextPosChange",[_playerpos,_nearestLoc,_coords]];
	};


	_t = toString [71,114,117,109,112,121,32,79,108,100,32,77,97,110,115,32,65,105,114,99,114,97,102,116,32,76,111,97,100,111,117,116];

	_time = [daytime,"HH:MM:SS"] call BIS_fnc_timeToString;
	_text = format ["<t align='left' size='0.75'>%1Grid ""%2""<t align='center'>--- %3 ---<t align='right'>%4<br />%5",_nearestloc,_coords,_t,_date,_time];


	(finddisplay 66 displayctrl 1101) ctrlSetStructuredText parsetext _text;

};


GOM_fnc_pylonSound = {

params ["_veh",["_pylon",-1]];

	_soundpos = getPosASL _veh;
if (_pylon >= 0) then {

_selections = selectionnames _veh;
_presort = _selections select {(toupper _x find "PYLON") >= 0 AND parsenumber (_x select [count _x - 3,3]) > 0};
_presort apply {[parsenumber (_x select [count _x - 3,3]),_x]};
_presort sort true;
_soundPos = agltoasl (_veh modeltoworld (_veh selectionposition (_presort select _pylon)));

};

	_rndSound = selectRandom ['FD_Target_PopDown_Large_F','FD_Target_PopDown_Small_F','FD_Target_PopUp_Small_F'];
	_getPath = getArray (configfile >> "CfgSounds" >> _rndSound >> "sound");
	_path = _getPath select 0;
	playSound3D [_path,_veh,false,_soundpos,random [0.8,1,1.2],random [0.8,1,1.2],180];

true
};

GOM_fnc_CheckComponents = {

	params ["_ctrlParams","_obj"];
	if (lbCursel 1500 < 0) exitWith {false};

	_veh = call compile  lbData [1500,lbcursel 1500];

	_vehDispName = getText (configfile >> "CfgVehicles" >> typeOf _veh >> "displayName");
	_ctrlParams params ["_ctrl","_state"];
	_set = [false,true] select _state;

	if (_set) then {

		if (str _ctrl find "2800" > -1) then {systemchat format ["%1 will now report remote targets!",_vehDispName];_veh setVehicleReportRemoteTargets _set};

		if (str _ctrl find "2801" > -1) then {systemchat format ["%1 will now receive remote targets!",_vehDispName];_veh setVehicleReceiveRemoteTargets _set};

		if (str _ctrl find "2802" > -1) then {systemchat format ["%1 will now report its own position!",_vehDispName];_veh setVehicleReportOwnPosition _set};

		} else {

		if (str _ctrl find "2800" > -1) then {systemchat format ["%1 will no longer report remote targets!",_vehDispName];_veh setVehicleReportRemoteTargets _set};

		if (str _ctrl find "2801" > -1) then {systemchat format ["%1 will no longer receive remote targets!",_vehDispName];_veh setVehicleReceiveRemoteTargets _set};

		if (str _ctrl find "2802" > -1) then {systemchat format ["%1 will no longer report its own position!",_vehDispName];_veh setVehicleReportOwnPosition _set};



	};
	playSound "Click";
true
};

GOM_fnc_setPylonOwner = {

	params ["_obj"];

	if (lbCursel 1500 < 0) exitWith {false};

	_veh = call compile  lbData [1500,lbcursel 1500];

	_pylonOwner = _veh getVariable ["GOM_fnc_aircraftLoadoutPylonOwner",[]];
	_ownerName = "Pilot";
	if (_pylonOwner isEqualTo []) then {_pylonOwner = [0];_ownerName = "Gunner"} else {_pylonOwner = []};

	ctrlSetText [1605,format ["%1 control",_ownerName]];

	_veh setVariable ["GOM_fnc_aircraftLoadoutPylonOwner",_pylonOwner,true];
	//_update = [_obj] call GOM_fnc_updateDialog;
true
};

GOM_fnc_setPylonPriority = {

	params ["_obj"];

	if (lbCursel 1501 < 0) exitWith {false};

	_veh = call compile  lbData [1500,lbcursel 1500];
	_count = 0;
	_priorities = _veh getVariable ["GOM_fnc_pylonPriorities",(GetPylonMagazines _veh) apply {_count = _count + 1;_count}];//I fucking love apply

	_selectedPriority = _priorities select lbcursel 1501;
if ("NOCOUNT" in _this) exitWith {

	ctrlsettext [1610,format ["Priority: %1", _selectedPriority]];
	_veh setVariable ["GOM_fnc_pylonPriorities",_priorities,true];
	[_veh,_priorities] remoteExec ["setPylonsPriority",0,true];
};

_keys = finddisplay 66 getVariable ["GOM_fnc_keyDown",["","",false,false,false]];
_keys params ["","",["_keyshift",false],["_keyctrl",false],["_keyALT",false]];

	if (_keyshift) exitWith {
		_selectedPriority = _selectedPriority - 1;
	if (_selectedPriority < 1) then {_selectedPriority = count _priorities};


		_priorities set [lbcursel 1501,_selectedPriority];

	_veh setVariable ["GOM_fnc_pylonPriorities",_priorities,true];
	[_veh,_priorities] remoteExec ["setPylonsPriority",0,true];
	ctrlsettext [1610,format ["Priority: %1", _selectedPriority]];

		};
	if (_keyALT) exitWith {
		_priorities = _priorities apply {_selectedPriority};
		systemchat format ["All pylons priority set to %1",_selectedPriority];
	_veh setVariable ["GOM_fnc_pylonPriorities",_priorities,true];
	[_veh,_priorities] remoteExec ["setPylonsPriority",0,true];
	ctrlsettext [1610,format ["Priority: %1",_selectedPriority]];

	};

	if (_keyctrl) exitWith {
systemchat format ["All pylons priority set to 1",""];
		_priorities = _priorities apply {1};
	_veh setVariable ["GOM_fnc_pylonPriorities",_priorities,true];
	[_veh,_priorities] remoteExec ["setPylonsPriority",0,true];
	ctrlsettext [1610,format ["Priority: %1", 1]];

	};

_selectedPriority = _selectedPriority + 1;

	if (_selectedPriority > count _priorities) then {_selectedPriority = 1};

		_priorities set [lbcursel 1501,_selectedPriority];

	_veh setVariable ["GOM_fnc_pylonPriorities",_priorities,true];
	[_veh,_priorities] remoteExec ["setPylonsPriority",0,true];
	ctrlsettext [1610,format ["Priority: %1", _selectedPriority]];


};

GOM_fnc_aircraftLoadoutPaintjob = {

	params ["_obj",["_apply",false]];

	if (lbCursel 1500 < 0) exitWith {false};
	lbClear 2100;
	lbAdd [2100,"Livery"];
	_veh = call compile  lbData [1500,lbcursel 1500];
		_colorConfigs = "true" configClasses (configfile >> "CfgVehicles" >> typeof _veh >> "textureSources");
		_vehDispName = getText (configfile >> "CfgVehicles" >> typeof _veh >> "displayName");
		_colorTextures = [""];
		if (count _colorConfigs > 0) then {

			_colorNames = [""];
			{
			_colorNames pushback (getText (configfile >> "CfgVehicles" >> typeof _veh >> "textureSources" >> configName _x >> "displayName"));
			lbAdd [2100,(getText (configfile >> "CfgVehicles" >> typeof _veh >> "textureSources" >> configName _x >> "displayName"))];
			_colorTextures pushback (getArray (configfile >> "CfgVehicles" >> typeof _veh >> "textureSources" >> configName _x >> "textures"));
		} foreach _colorConfigs;

		if (_apply AND lbCurSel 2100 > 0) then {

		{
		_index = (_colorTextures select (lbCurSel 2100)) find _x;
		_veh setObjectTextureGlobal [_index, (_colorTextures select (lbCurSel 2100)) select _index];
	} foreach (_colorTextures select (lbCurSel 2100));
	systemchat format ['%2: Changed color to %1.',(_colorNames select (lbCurSel 2100)),_vehDispName];
};
	playSound "Click";
};

true
};

//lel 0.0218 ms select owns hard
GOM_fnc_aircraftLoadoutResourcesCheck = {
	params ["_obj"];

	_nearbyVehs = (_obj nearEntities ["All", 50]) select {speed _x < 1 AND {alive _x}};
	_rearmVehs = _nearbyVehs select {_x getVariable ["GOM_fnc_ammocargo",-1] >= 0 || getNumber (configfile >> "CfgVehicles" >> typeof _x >> "transportAmmo") > 0};
	_repairVehs = _nearbyVehs select {_x getVariable ["GOM_fnc_repairCargo",-1] >= 0 || getNumber (configfile >> "CfgVehicles" >> typeof _x >> "transportRepair") > 0};

	_flags = [];

	_flags set [0, true];
	_flags set [1, (count _repairVehs > 0)];
	_flags set [2, (count _rearmVehs > 0)];


	_flags params ["_canRefuel","_canRepair","_canRearm"];
	_vehs = [_refuelVehs,_repairVehs,_rearmVehs];
	
	ctrlEnable [1600,_canRearm];
	ctrlEnable [1602,_canRepair];
	ctrlEnable [1603, false];
	ctrlEnable [1604,_canRearm];
	[_flags,_vehs]
};

GOM_fnc_updatePresetLB = {

	params ["_obj"];

	if (lbCursel 1500 < 0) exitWith {false};
	_veh = call compile  lbData [1500,lbcursel 1500];
	_presets = profileNamespace getVariable ["GOM_fnc_aircraftLoadoutPresets",[]];

	_validPresets = _presets select {_x#0 isequalTo typeof _veh AND _x#8 isEqualTo GOM_fnc_allowAllPylons};
	lbClear 2101;
	{

		lbAdd [2101,_x select 1];

	} forEach _validPresets;
true
};

GOM_fnc_showResourceDisplay = {


	GOM_fnc_aircraftResourceDisplayTimeout = time + 20;



	_ID = addMissionEventHandler ["Draw3D", {
		{
			_pos = visiblePositionASL _x;
			_pos params ["_posX", "_posY", "_posZ"];

			_amount = _x getvariable ["GOM_fnc_repairCargo",0];
			_text = format ["%1 spare parts",(_amount call GOM_fnc_kgToTon)];

			_drawicon = "";
			_color = [1, 1, 1, 1];
			drawIcon3D [
				_drawicon,
				[1, 1, 1, log ((GOM_fnc_aircraftResourceDisplayTimeout - time) min 10)],
				[_posX, _posY, 3],
				1,
				1,
				0,
				_text,
				2,
				0.03 * log ((GOM_fnc_aircraftResourceDisplayTimeout - time) min 10),
				"PuristaBold",
				"center",
				true
			];
		} foreach ((player nearEntities ["All",50]) select {speed _x < 15 AND {alive _x} AND {_x getvariable ["GOM_fnc_repaircargo",-1] >= 0}});
	}];

	sleep 20;
	removeMissionEventHandler ["Draw3D",_ID];
	true
};

GOM_fnc_aircraftLoadoutSavePreset = {
	params ["_obj"];

	if (lbCursel 1500 < 0) exitWith {false};
	_veh = call compile  lbData [1500,lbcursel 1500];
	_presets = profileNamespace getVariable ["GOM_fnc_aircraftLoadoutPresets",[]];
	_index = 0;
		_pylonOwners = _veh getVariable ["GOM_fnc_aircraftLoadoutPylonOwners",[]];
	_priorities = _veh getVariable ["GOM_fnc_pylonPriorities",[]];

	_preset = [typeof _veh,ctrlText 1401,GetPylonMagazines _veh,((GetPylonMagazines _veh) apply {_index = _index + 1;_veh AmmoOnPylon _index}),[lbText [2100,lbCursel 2100],getObjectTextures _veh],_pylonOwners,_priorities,[_veh] call GOM_fnc_aircraftGetSerialNumber,GOM_fnc_allowAllPylons];

	if (!(_presets isEqualTo []) AND {count (_presets select {ctrlText 1401 isequalTo (_x select 1)}) > 0}) exitWith {systemchat "Preset exists! Chose another name!";playsound "Simulation_Fatal"};


	if (ctrlText 1401 isEqualTo "") exitWith {systemchat "Invalid name! Choose another one!";playSound "Simulation_Fatal"};
	_presets pushback _preset;
	profileNamespace setVariable ["GOM_fnc_aircraftLoadoutPresets",_presets];
			_vehDispName = getText (configfile >> "CfgVehicles" >> typeof _veh >> "displayName");

	systemchat format ["Saved %1 preset: %2!",_vehDispName,str ctrlText 1401];
	_updateLB = [_obj] call GOM_fnc_updatePresetLB;
	lbsetcursel [2101,((lbsize 2101) -1)];
	true
};

GOM_fnc_aircraftLoadoutDeletePreset = {

	params ["_obj"];

	if (lbCursel 1500 < 0) exitWith {false};
	_veh = call compile  lbData [1500,lbcursel 1500];
	_presets = profileNamespace getVariable ["GOM_fnc_aircraftLoadoutPresets",[]];

	_toDelete = _presets select {(_x select 1) isEqualTo lbText [2101,lbcursel 2101]};
	if (count _toDelete isequalto 0)  exitWith {systemchat "Preset not found!";playsound "Simulation_Fatal"};
	_presets = _presets - [_toDelete select 0];
	profileNamespace setVariable ["GOM_fnc_aircraftLoadoutPresets",_presets];
		_vehDispName = getText (configfile >> "CfgVehicles" >> typeof _veh >> "displayName");

	Systemchat format ["Deleting %1 preset: %2",_vehDispName,str (_todelete select 0 select 1)];
	_updateLB = [_obj] call GOM_fnc_updatePresetLB;
	true
};

GOM_fnc_aircraftLoadoutLoadPreset = {

	params ["_obj"];

	if (lbCursel 1500 < 0) exitWith {false};
	if (lbCursel 2101 < 0) exitWith {systemchat "No preset selected."};
	_veh = call compile  lbData [1500,lbcursel 1500];
	_presets = profileNamespace getVariable ["GOM_fnc_aircraftLoadoutPresets",[]];
	_preset = (_presets select {(_x#0) isEqualTo typeOf _veh AND (_x#1) isEqualTo lbText [2101,lbcursel 2101] AND (_x#8 isEqualTo GOM_fnc_allowAllPylons)}) select 0;
	_preset params ["_vehType","_presetName","_pylons","_pylonAmmoCounts","_textureParams","_pylonOwners","_pylonPriorities",["_serialNumber","N/A"],["_restrictedLoadout",GOM_fnc_allowAllPylons]];

	[_veh,_serialNumber] call GOM_fnc_aircraftSetSerialNumber;
	[_obj,true,_pylons,_pylonAmmoCounts] call	GOM_fnc_setPylonsRearm;
	[_veh,_pylonPriorities] remoteExec ["setPylonsPriority",0,true];
	_textureParams params ["_textureName","_textures"];
	{

		_veh setObjectTextureGlobal [_foreachIndex,_x];

	} forEach _textures;


true
};

GOM_fnc_updateVehiclesLB = {


	params ["_obj"];


	_vehicles = (_obj nearEntities ["Air",50]) select {(speed _x < 5) && {(alive _x) && {(isTouchingGround _x) && {(((_x getVariable ["BIS_WL_ownerAsset", "123"]) call BIS_fnc_getUnitByUID) == player) && {((_x getVariable ["BIS_WL_nextRearm", 0]) < serverTime)}}}}};
	_lastVehs = _obj getVariable ["GOM_fnc_setPylonLoadoutVehicles",[]];
	if (_vehicles isEqualTo []) exitWith {true};
	if (_vehicles isEqualTo _lastVehs AND !(lbsize 1500 isequalto 0)) exitWith {true};//only update this when really needed, called on each frame
	_obj setVariable ["GOM_fnc_setPylonLoadoutVehicles",_vehicles,true];


	(finddisplay 66 displayctrl 1100) ctrlSetStructuredText parsetext "<t align='center'>No aircraft in range (50m)!";
	_resourceCheck = [_obj] call GOM_fnc_aircraftLoadoutResourcesCheck;
	lbclear 1500;


	{

		_dispName = gettext (configfile >> "CfgVehicles" >> typeof _x >> "displayName");
		_form = str _dispName;
		lbAdd [1500,_form];
		lbSetData [1500,_foreachIndex,_x call BIS_fnc_objectVar];
	} forEach _vehicles;

};


GOM_fnc_aircraftLoadout = {

	params ["_obj"];
	createDialog "GOM_dialog_aircraftLoadout";
	playSound "Click";
	(finddisplay 66 displayctrl 1100) ctrlSetStructuredText parsetext "<t align='center'>Select an aircraft!";

	lbclear 1500;
	lbclear 1501;
	lbclear 1502;


	lbadd [2100,"Livery"];
	lbSetCurSel [2100,0];


	_getvar = _obj call BIS_fnc_objectVar;
	finddisplay 66 displayCtrl 1500 ctrlAddEventHandler ["LBSelChanged",format ["lbclear 1502;lbsetcursel [1502,-1];lbclear 1501;lbsetcursel [1501,-1];[%1] call GOM_fnc_setPylonLoadoutLBPylonsUpdate;
;[%1] call GOM_fnc_aircraftLoadoutPaintjob;",_getvar]];//
	finddisplay 66 displayCtrl 1501 ctrlAddEventHandler ["LBSelChanged",format ["lbclear 1502;[%1] call GOM_fnc_fillPylonsLB;[%1,'NOCOUNT'] call GOM_fnc_setPylonPriority
",_getvar]];//
	finddisplay 66 displayCtrl 1502 ctrlAddEventHandler ["LBSelChanged",format ["[%1] call GOM_fnc_updateAmmoCountDisplay;",_getvar]];//

	finddisplay 66 displayCtrl 2100 ctrlAddEventHandler ["LBSelChanged",format ["[%1,true] call GOM_fnc_aircraftLoadoutPaintjob",_getvar]];
	finddisplay 66 displayCtrl 2101 ctrlAddEventHandler ["LBSelChanged",format ["",_getvar]];//
	buttonSetAction [1600, format ["[%1] call GOM_fnc_pylonInstallWeapon;[] call GOM_fnc_aircraftSetSerialNumber",_getvar]];
	buttonSetAction [1601, format ["[%1] call GOM_fnc_clearAllPylons",_getvar]];
	buttonSetAction [1602, format ["[%1] call GOM_fnc_setPylonsRepair",_getvar]];
	buttonSetAction [1603, format ["[%1] call GOM_fnc_setPylonsRefuel",_getvar]];
	buttonSetAction [1604, format ["[%1] call GOM_fnc_setPylonsReArm",_getvar]];
	buttonSetAction [1605, format ["[%1] call GOM_fnc_setPylonOwner",_getvar]];
	buttonSetAction [1606, format ["[%1] call GOM_fnc_aircraftLoadoutSavePreset",_getvar]];
	buttonSetAction [1607, format ["[%1] call GOM_fnc_aircraftLoadoutDeletePreset",_getvar]];
	buttonSetAction [1608, format ["[%1] call GOM_fnc_aircraftLoadoutLoadPreset",_getvar]];

	buttonSetAction [1609, format ["lbclear 1502;lbSetCurSel [1502,-1];lbclear 1501;lbSetCurSel [1501,-1];lbclear 1500;lbSetCurSel [1500,-1]",""]];
	buttonSetAction [1610, format ["[%1] call GOM_fnc_setPylonPriority",_getvar]];

	findDisplay 66 displayAddEventHandler ["KeyDown",{finddisplay 66 setVariable ["GOM_fnc_keyDown",_this];if (_this select 3) then {ctrlEnable [1607,true];
		ctrlSetText [1607,"Delete"];
		ctrlSetText [1610,format ["Set all to 1",""]];
	};
	if (_this select 4) then {
	_veh = call compile lbdata [1500,lbcursel 1500];
	_priorities = _veh getVariable ["GOM_fnc_pylonPriorities",[]];
	if (lbcursel 1501 >= 0) then {

	_selectedPriority = _priorities select lbcursel 1501;
	ctrlSetText [1610,format ["Set all to %1",_selectedPriority]];
	}
	};



	}];
	findDisplay 66 displayAddEventHandler ["KeyUp",{finddisplay 66 setVariable ["GOM_fnc_keyDown",[]];if (_this select 3) then {ctrlEnable [1607,false];ctrlSetText [1607,"CTRL"];

	_veh = call compile lbdata [1500,lbcursel 1500];
	_priorities = _veh getVariable ["GOM_fnc_pylonPriorities",[]];
		if (lbcursel 1501 >= 0) then {

	_selectedPriority = _priorities select lbcursel 1501;
	ctrlSetText [1610,format ["Priority: %1",_selectedPriority]];
};
	;};


if (_this select 4) then {	_veh = call compile lbdata [1500,lbcursel 1500];
	_priorities = _veh getVariable ["GOM_fnc_pylonPriorities",[]];
		if (lbcursel 1501 >= 0) then {

	_selectedPriority = _priorities select lbcursel 1501;
	ctrlSetText [1610,format ["Priority: %1",_selectedPriority]];
};
;}



	}];
	ctrlEnable [1607,false];
	ctrlSetText [1607,"CTRL"];

	findDisplay 66 displayCtrl 2800 ctrlAddEventHandler ["CheckedChanged",format ["[_this,%1] call GOM_fnc_CheckComponents",_getvar]];
	findDisplay 66 displayCtrl 2801 ctrlAddEventHandler ["CheckedChanged",format ["[_this,%1] call GOM_fnc_CheckComponents",_getvar]];
	findDisplay 66 displayCtrl 2802 ctrlAddEventHandler ["CheckedChanged",format ["[_this,%1] call GOM_fnc_CheckComponents",_getvar]];
	_color = [0,0,0,0.6];
	_dark = [1100,1103,1104,1105,1109,1101,1102,1103,1104,1105,1400,1401,1500,1501,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,2100,2101];
	{

		findDisplay 66 displayCtrl _x ctrlSetBackgroundColor _color;


	} forEach _dark;
	GOM_fnc_aircraftLoadoutObject = _obj;
	_ID = addMissionEventHandler ["EachFrame",{



		_vehicles = [GOM_fnc_aircraftLoadoutObject] call GOM_fnc_updateVehiclesLB;

		if (displayNull isEqualTo findDisplay 66) exitWith {

			removeMissionEventHandler ["EachFrame",_thisEventHandler];
			_display = 0 spawn GOM_fnc_showResourceDisplay;
			playSound "Click";

		};

		_check = [_obj] call GOM_fnc_updateDialog;
		[] call GOM_fnc_titleText;

		true

	}];
	GOM_fnc_aircraftLoadoutObject setvariable ["GOM_fnc_aircraftloadoutEH",_ID];

	true
};

//handle global variables and stuff that won't change during mission runtime
GOM_list_allPylonMags = ("count( getArray (_x >> 'hardpoints')) > 0" configClasses (configfile >> "CfgMagazines")) apply {configname _x};
//sort pylon mags for LB
GOM_list_allPylonMags = GOM_list_allPylonMags apply {[gettext (configfile >> "CfgMagazines" >> _x >> "displayName"),_x]};
GOM_list_allPylonMags sort true;
GOM_list_allPylonMags = GOM_list_allPylonMags apply {_x select 1};
GOM_list_validDispNames = GOM_list_allPylonMags apply {getText (configfile >> "CfgMagazines" >> _x >> "displayName")};



true