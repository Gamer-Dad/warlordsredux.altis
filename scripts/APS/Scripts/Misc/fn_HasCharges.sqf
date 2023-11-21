private _v = _this;

if (_v getVariable ["apsAmmo", 0] > 0) exitwith {true};
if ((typeOf _v) in ["O_T_Truck_03_device_ghex_F", "O_Truck_03_device_F"]) exitWith {true};

false