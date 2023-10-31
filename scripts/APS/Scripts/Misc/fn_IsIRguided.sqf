// Is this projectile IR guided?
private _p=_this;
private _type=typeOf _p;
private _g=getNumber(configFile>>"CfgAmmo">>_type>>"irLock");
if(_g>0)exitWith{TRUE};
_g=getNumber(configFile>>"CfgAmmo">>_type>>"Components">>"SensorsManagerComponent">>"Components">>"IRSensorComponent">>"AirTarget">>"maxRange");
if(_g>0)exitWith{TRUE};
_g=getNumber(configFile>>"CfgAmmo">>_type>>"Components">>"SensorsManagerComponent">>"Components">>"IRSensorComponent">>"GroundTarget">>"maxRange");
if(_g>0)exitWith{TRUE};
FALSE