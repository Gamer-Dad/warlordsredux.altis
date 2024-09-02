private _p = _this;
private _type = typeOf _p;
private _g = getNumber (configFile>>"CfgAmmo">>_type>>"Components">>"SensorsManagerComponent">>"Components">>"NVSensorComponent">>"AirTarget">>"maxRange");
if (_g > 0) exitWith {true};
private _g = getNumber (configFile>>"CfgAmmo">>_type>>"Components">>"SensorsManagerComponent">>"Components">>"NVSensorComponent">>"GroundTarget">>"maxRange");
if (_g > 0) exitWith {true};
private _g = getNumber (configFile>>"CfgAmmo">>_type>>"Components">>"SensorsManagerComponent">>"Components">>"LaserSensorComponent">>"GroundTarget">>"maxRange");
if (_g > 0) exitWith {true};
false;