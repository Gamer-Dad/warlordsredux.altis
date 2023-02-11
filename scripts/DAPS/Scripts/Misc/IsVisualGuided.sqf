// Is this projectile visually guided?
private _p=_this;
private _type=typeOf _p;
private _g=getNumber(configFile>>"CfgAmmo">>_type>>"Components">>"SensorsManagerComponent">>"Components">>"VisualSensorComponent">>"AirTarget">>"maxRange");
if(_g>0)exitWith{TRUE};
private _g=getNumber(configFile>>"CfgAmmo">>_type>>"Components">>"SensorsManagerComponent">>"Components">>"VisualSensorComponent">>"GroundTarget">>"maxRange");
if(_g>0)exitWith{TRUE};
FALSE