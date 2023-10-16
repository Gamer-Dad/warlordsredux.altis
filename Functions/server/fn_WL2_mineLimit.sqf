#include "..\warlords_constants.inc"

// Event handler to clean up mines
addMissionEventHandler ["EntityCreated", {
  params ["_entity"];
  if (isClass (configFile >> "CfgAmmo" >> (typeOf _entity))) then {
    if !((typeOf _entity) in ["APERSTripMine_Wire_Mag", "APERSTripMine_Wire_Ammo", "IEDLandSmall_Remote_Mag", "IEDUrbanSmall_Remote_Mag", "IEDLandBig_Remote_Mag", "IEDUrbanBig_Remote_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag", "ClaymoreDirectionalMine_Remote_Ammo", "SLAMDirectionalMine_Wire_Ammo", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Ammo", "APERSBoundingMine_Range_Mag", "APERSMineDispenser_Mine_Ammo", "APERSMine_Range_Ammo", "SatchelCharge_Remote_Ammo", "DemoCharge_Remote_Ammo"]) exitWith {};

    _code = compile (format ["[_entity] spawn BIS_fnc_Handle%1", (typeOf _entity)]);
    call _code;
  };
}];