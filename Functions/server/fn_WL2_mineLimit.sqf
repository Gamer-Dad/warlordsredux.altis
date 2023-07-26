#include "..\warlords_constants.inc"

// Event handler to clean up mines
addMissionEventHandler ["EntityCreated", {
  params ["_entity"];
  if (isClass (configFile >> "CfgAmmo" >> (typeOf _entity))) then {
    switch (typeOf _entity) do
    {
      case "APERSTripMine_Wire_Mag" : {_entity spawn BIS_fnc_WL2_HandleApersTripWireMineMag; };
      case "APERSTripMine_Wire_Ammo" : {_entity spawn BIS_fnc_WL2_HandleApersTripWireAmmo; };
      case "IEDLandSmall_Remote_Mag": {_entity spawn BIS_fnc_HandleSmallIED; };
      case "IEDUrbanSmall_Remote_Mag": {_entity spawn BIS_fnc_WL2_HandleSmallIEDUrban; };
      case "IEDLandBig_Remote_Mag": {_entity spawn BIS_fnc_WL2_HandleLargeIED; };
      case "IEDUrbanBig_Remote_Mag": {_entity spawn BIS_fnc_WL2_HandleUrbanLargeIED; };
      case "DemoCharge_Remote_Mag": {_entity spawn BIS_fnc_WL2_HandleExplosiveCharge; };
      case "SatchelCharge_Remote_Mag": {_entity spawn BIS_fnc_WL2_HandleExplosiveSatchel; };
      case "ClaymoreDirectionalMine_Remote_Ammo": {_entity spawn BIS_fnc_WL2_HandleClaymoreChargeAmmo; };
      case "SLAMDirectionalMine_Wire_Ammo": {_entity spawn BIS_fnc_WL2_HandleM6SlamMineAmmo; };
      case "SLAMDirectionalMine_Wire_Mag": {_entity spawn BIS_fnc_WL2_HandleM6SlamMineMag; };
      case "ATMine_Range_Ammo": {_entity spawn BIS_fnc_WL2_HandleATMineAmmo; };
      case "APERSBoundingMine_Range_Mag": {_entity spawn BIS_fnc_WL2_HandleApersBoundingMineMag; };
      case "APERSMineDispenser_Mine_Ammo": {_entity spawn BIS_fnc_WL2_HandleApersDispenserAmmo; };
      case "APERSMine_Range_Ammo": {_entity spawn BIS_fnc_WL2_handleApersMine; };
      case "SatchelCharge_Remote_Ammo": {_entity spawn BIS_fnc_WL2_handleSatchelCharge; };
      case "DemoCharge_Remote_Ammo": {_entity spawn BIS_fnc_WL2_handleDemoCharge; };
      default {};
    };
  };
}];