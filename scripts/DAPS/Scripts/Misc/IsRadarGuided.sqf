// Is this projectile radar guided?
private _p=_this;
private _type=typeOf _p;
private _g=getNumber(configFile>>"CfgAmmo">>_type>>"Components">>"SensorsManagerComponent">>"Components">>"ActiveRadarSensorComponent">>"AirTarget">>"maxRange");
if(_g>0)exitWith{TRUE};
private _g=getNumber(configFile>>"CfgAmmo">>_type>>"Components">>"SensorsManagerComponent">>"Components">>"ActiveRadarSensorComponent">>"GroundTarget">>"maxRange");
if(_g>0)exitWith{TRUE};
FALSE