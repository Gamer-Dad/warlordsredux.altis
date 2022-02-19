// FILE			:	Baked_AIS_fnc.sqf
// AUTHOR		:	Bakerman
// LAST EDIT	:	15/09/2013
// Version		:	0.1.3
// DESCRIPTION	:	APS functions for Baked_AIS (Armor Improvement System)
// LICENSE		:	GO CRAZY - USE IT - ABUSE IT - CREDIT IF YOU WISH

// Called on "fired" event
FNC_BAPS_FIRED = 
{
	private ["_unit","_weapon","_projectile"];
	_unit = _this Select 0;
	_weapon = _this Select 1;
	_projectile = _this select 6;
	
	// Check if weapon used is a launcher
	for "_i" from 0 to ((count baps_weapons) - 1) do
	{
		if (_weapon == (baps_weapons select _i)) then 
		{
			[_projectile, _unit] call FNC_BAPS_SCAN;
		};
	};	
};

// Projectile scanning for targets
FNC_BAPS_SCAN =
{
	private ["_projectile","_unit","_vehicleType","_defender","_block","_i","_weaponDir","_weaponDeg","_vehicleDir","_turretDir","_relativeDir","_dir","_fov","_dis"];
	_projectile = _this Select 0;
	_unit = _this Select 1;
	for "_i" from 0 to ((count baps_vehiclelist) - 1) do
	{ 
		_defender = baps_vehiclelist select _i;

		if (!alive _defender) exitWith  {};
		if (count (crew _defender) == 0) exitWith {};
		
		// By default any vehicle with APS may block
		_block = "true";
		// Specific duel APS code for Merkava Mk4
		_vehicleType = typeOf _defender;
		if (_vehicleType == "B_MBT_01_cannon_F") then 
		{
			// Get the direction of the tank's turret
			_weaponDir = _defender weaponDirection "cannon_120mm";
			_weaponDeg = (_weaponDir select 0) atan2 (_weaponDir select 1);
			if (_weaponDeg < 0) then { _weaponDeg = _weaponDeg + 360; };
			_vehicleDir = direction _defender;
			_turretDir = _weaponDeg - _vehicleDir;
			if (_turretDir < 0) then { _turretDir = _turretDir + 360; };
			_relativeDir = [_defender, _projectile] call BIS_fnc_relativeDirTo;
			_relativeDir = _relativeDir - _turretDir;
			if (_relativeDir < 0) then { _relativeDir = _relativeDir + 360; };	
			// Remove the default blocking
			_block = "false";
			// Set blocking direction and angle limitations
			if (_relativeDir > 0 && _relativeDir < 170) then
			{
				_block = "right";
			};
			if (_relativeDir > 190 && _relativeDir < 360) then
			{
				_block = "left";
			};
		};
		
		if (_block != "false") then 
		{
			_count = 0;
			// Set the field of fiew of the projectile scanner
			_fov = 1;
			while {_count < 10} do 
			{
				// Scan for vehicles infront of the projectile
				_dir = [_projectile, _defender] call BIS_fnc_relativeDirTo;
				if (_dir > 330) then 
				{
					_dir = 360 - _dir;
					if (_dir < 0) then { _dir = _dir + 360; };
				};
				_dis = _defender distance _projectile;
				if (_dis < 50) then { _fov = 20 };
				if (_dis < 25) then { _fov = 30 };
				if (_dir > -_fov && _dir < _fov) then 
				{
					[_defender, _projectile, _unit, _block] spawn FNC_BAPS_BLOCK;
					_count = 11;
				} else
				{
					_fov = _fov + 1;
				};
				_count = _count + 1;
				sleep 0.03;
			}
		};
	};
};

// Threat elimination functions for vehicles
FNC_BAPS_BLOCK =
{
	private ["_defender","_projectile","_unit","_block","_canBlock","_canBlockLeft","_canBlockRight","_speed","_time","_defendDistance","_wait","_sleep","_reloading","_listed","_ammo","_ammoLeft","_ammoRight", "_reloadLeft", "_reloadRight"];
	_defender = _this Select 0;
	_projectile = _this Select 1;
	_unit = _this Select 2;
	_block = _this Select 3;
	
	// By default the vehicle can block from all directions
	_canBlock = true;
	_canBlockLeft = true;
	_canBlockRight = true;
	
	// Get defender damage
	_damage = getDammage _defender + 1;
		
	_do = 1;
	while {_do == 1} do
	{
		_speed = speed _projectile;
		if (_speed != 0 && alive _projectile) then
		{
			// Calculate the flight time of the projectile
			_dis = _defender distance _projectile;
			_time = _dis / 1000 / _speed * 60 * 60;
			// Ajust defend distance based on speed
			_speedAdjustment = _speed / 110;
			// Constant minimum distance to defend
			_defendConstant = 10;
			// Degrade performance for damage
			_degradeDamage = _damage * _damage;
			if (_degradeDamage > 1) then { _degradeDamage = _degradeDamage * 0.6 };
			// Calculate defence distance
			_defendDistance = (_speedAdjustment + _defendConstant) / _degradeDamage;
			// Calculate time to wait to reach _defendDistance
			_wait = _defendDistance / 1000 / _speed * 60 * 60; 
			// Set sleep time
			_sleep = _time - _wait;
			
			
			
			// Only activate once the flight time is longer than the wait time
			if (_wait > _sleep) then 
			{
				// Get ammo count
				_ammoLeft = _defender getVariable "ammo_left";
				_ammoRight = _defender getVariable "ammo_right";
				
				// Get reloading timers
				_reloadLeft = _defender getVariable "reloading_left";
				_reloadRight = _defender getVariable "reloading_right";
				
				// Check if the vehicle's APS is reloading on default/left side
				if ((_block == "left" || _block == "true") && _reloadLeft == 1) then 
				{
					_canBlock = false;
				};	
				// Check if the vehicle's APS is reloading on right side
				if (_block == "right" && _reloadRight == 1) then 
				{
					_canBlock = false;
				};	
				// Check if the vehicles's default/left APS has ammo left
				if (_canBlock && (_block == "left" || _block == "true")) then 
				{
					if (_ammoLeft < 1) then
					{
						_canBlock = false;
					};
					if (_ammoLeft > 0) then 
					{
						_defender setVariable ["ammo_left", (_ammoLeft-1), true];
						// Degrade performance for every use
						if (_ammoLeft < 4) then 
						{
							_dDis = (5 / _ammoLeft);
							_degradeUses = (_dDis * _dDis) / 1000 / _speed * 60 * 60;
							_sleep = _sleep + _degradeUses;
						};
					};
				};	
				// Check if the vehicles's right APS has ammo left
				if (_canBlock &&  _block == "right" ) then 
				{
					if (_ammoRight < 1) then
					{
						_canBlock = false;
					};
					if (_ammoRight > 0) then 
					{
						_defender setVariable ["ammo_right", (_ammoRight-1), true];
						// Degrade performance for every use
						if (_ammoRight < 4) then 
						{
							_dDis = (5 / _ammoRight);
							_degradeUses = (_dDis * _dDis) / 1000 / _speed * 60 * 60;
							_sleep = _sleep + _degradeUses;
						};
					};
				};
				
				// Check that threat is not more than 10m from top
				_defenderAlt = getPosASL _defender select 2;
				_projectileAlt = getPosASL _projectile select 2;
				if ((_projectileAlt - _defenderAlt) > 14) then 
				{
					_canBlock = false;
				};
				
				// Destroy the threat
				if (alive _projectile && _canBlock) then 
				{
					// Wait until threat is in range
					sleep _sleep;
					// Remove the threat and create FX
					deleteVehicle _projectile;
					_sfx = createVehicle ["SmallSecondary", position _projectile, [], 0, "CAN_COLLIDE"];
					// Do reload and ammo functions
					if (_block == "true" || _block == "left") then 
					{
						[_defender] spawn 
						{ 
							_defender = _this Select 0;
							_defender setVariable ["reloading_left", 1, true]; 
							sleep 1.2; 
							_defender setVariable ["reloading_left", 0, true]; 
						};
					};
					if (_block == "right") then
					{
						[_defender] spawn 
						{ 
							_defender = _this Select 0;
							_defender setVariable ["reloading_right", 1, true]; 
							sleep 1.2; 
							_defender setVariable ["reloading_right", 0, true]; 
						};
					};
					// AI behavior
					_defender setBehaviour "DANGER";
					if (_defender != player) then
					{
						[_defender, _unit] spawn { sleep 0.5 ; (_this Select 0) doWatch (_this Select 1); };
					};
				};
				_do = 0;
			};
		};
		sleep 0.01;
	};
};