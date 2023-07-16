#include "..\warlords_constants.inc"

// use other event handlers for other mines
// give them their own array aswell in init.sqf

// Event handler to clean up mines
addMissionEventHandler ["EntityCreated", {
  params ["_entity"];
  switch (typeOf _entity) do
  {
    case "APERSTripMine_Wire_Mag" : { _entity call HandleApersTripWireMine; };
    case "APERSTripMine_Wire_Ammo" : { _entity call HandleApersTripWire; };
    case "IEDLandSmall_Remote_Mag": { _entity call HandleSmallIED; };
    case "IEDUrbanSmall_Remote_Mag": { _entity call HandleUrbanSmallIED; };
    case "IEDLandBig_Remote_Mag": { _entity call HandleLargeIED; };
    case "IEDUrbanBig_Remote_Mag": { _entity call HandleUrbanLargeIED; };
    case "DemoCharge_Remote_Mag": { _entity call HandleExplosiveCharge; };
    case "SatchelCharge_Remote_Mag": { _entity call HandleExplosiveSatchel; };
    case "ClaymoreDirectionalMine_Remote_Ammo": { _entity call HandleClaymoreCharge; };
    case "SLAMDirectionalMine_Wire_Ammo": { _entity call HandleM6SlamMineAmmo; };
    case "SLAMDirectionalMine_Wire_Mag": { _entity call HandleM6SlamMineMag; };
    case "ATMine_Range_Ammo": { _entity call HandleATMine; };
    case "APERSBoundingMine_Range_Mag": { _entity call HandleApersBoundingMineMag; };
    case "APERSMineDispenser_Mine_Ammo": { _entity call HandleApersDispenserAmmo; };
    case "APERSMine_Range_Ammo": { _entity call HandleApersMine; };
    default { };
  };
}];

//APERS Mine
HandleApersMine = {
  params ["_entity"];
  if (count MRTM_spawnedAPERS >= 20) then {
    private _mines = MRTM_spawnedAPERS;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedAPERS >= 20) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };
    if (count MRTM_spawnedAPERS >= 20) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedAPERS pushBack _entity;
    };
  } else {
    MRTM_spawnedAPERS pushBack _entity;
  };
};

//APERS Dispenser (Ammo)
HandleApersDispenserAmmo = {
  params ["_entity"];
  if (count MRTM_spawnedAPERSDispenserAmmo >= 20) then {
    private _mines = MRTM_spawnedAPERSDispenserAmmo;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedAPERSDispenserAmmo >= 20) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };
    if (count MRTM_spawnedAPERSDispenserAmmo >= 20) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedAPERSDispenserAmmo pushBack _entity;
    };
  } else {
    MRTM_spawnedAPERSDispenserAmmo pushBack _entity;
  };
};

//APERS Bounding Mine (Mag)
HandleApersBoundingMineMag = {
  params ["_entity"];
  if (count MRTM_spawnedAPERSBounding >= 20) then {
    private _mines = MRTM_spawnedAPERSBounding;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedAPERSBounding >= 20) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };
    if (count MRTM_spawnedAPERSBounding >= 20) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedAPERSBounding pushBack _entity;
    };
  } else {
    MRTM_spawnedAPERSBounding pushBack _entity;
  };
};

//AT Mine
HandleATMine = {
  params ["_entity"];
  if (count MRTM_spawnedAT >= 25) then {
    private _mines = MRTM_spawnedAT;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedAT >= 25) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };
    if (count MRTM_spawnedAT >= 25) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedAT pushBack _entity;
    };
  } else {
    MRTM_spawnedAT pushBack _entity;
  };
};

//M6 SLAM Mine (Mag)
HandleM6SlamMineMag = {
  params ["_entity"];
  if (count MRTM_spawnedSLAMs >= 10) then {
    private _mines = MRTM_spawnedSLAMs;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedSLAMs >= 10) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };
    if (count MRTM_spawnedSLAMs >= 10) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedSLAMs pushBack _entity;
    };
  } else {
    MRTM_spawnedSLAMs pushBack _entity;
  };
};

//M6 SLAM Mine (Ammo)
HandleM6SlamMineAmmo = {
  params ["_entity"];
  if (count MRTM_spawnedSLAMs_Ammo >= 10) then {
    private _mines = MRTM_spawnedSLAMs_Ammo;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedSLAMs_Ammo >= 10) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };
    if (count MRTM_spawnedSLAMs_Ammo >= 10) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedSLAMs_Ammo pushBack _entity;
    };
  } else {
    MRTM_spawnedSLAMs_Ammo pushBack _entity;
  };
};

//Claymore Charge
HandleClaymoreCharge = {
  params ["_entity"];
  if (count MRTM_spawnedClaymoresAmmo >= 6) then {
    private _mines = MRTM_spawnedClaymoresAmmo;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedClaymoresAmmo >= 6) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };
    if (count MRTM_spawnedClaymoresAmmo >= 6) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedClaymoresAmmo pushBack _entity;
    };
  } else {
    MRTM_spawnedClaymoresAmmo pushBack _entity;
  };
};

//Explosive Satchel
HandleExplosiveSatchel = {
  params ["_entity"];
  if (count MRTM_spawnedSatchels >= 7) then {
    private _mines = MRTM_spawnedSatchels;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedSatchels >= 7) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };
    if (count MRTM_spawnedSatchels >= 7) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedSatchels pushBack _entity;
    };
  } else {
    MRTM_spawnedSatchels pushBack _entity;
  };
};

//Explosive Charge
HandleExplosiveCharge = {
  params ["_entity"];
  if (count MRTM_spawnedCharges >= 7) then {
    private _mines = MRTM_spawnedCharges;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedCharges >= 7) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };
    if (count MRTM_spawnedCharges >= 7) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedCharges pushBack _entity;
    };
  } else {
    MRTM_spawnedCharges pushBack _entity;
  };
};

//Large IED (Urban)
HandleUrbanLargeIED = {
  params ["_entity"];
  if (count MRTM_spawnedLIEDU >= 5) then {
    private _mines = MRTM_spawnedLIEDU;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedLIEDU >= 5) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };
    if (count MRTM_spawnedLIEDU >= 5) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedLIEDU pushBack _entity;
    };
  } else {
    MRTM_spawnedLIEDU pushBack _entity;
  };
};

//Large IED (Dug-in)
HandleLargeIED = {
  params ["_entity"];
  if (typeOf _entity != "IEDLandBig_Remote_Mag") exitwith {};
  if (count MRTM_spawnedLIEDDI >= 5) then {
    private _mines = MRTM_spawnedLIEDDI;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedLIEDDI >= 5) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };
    if (count MRTM_spawnedLIEDDI >= 5) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedLIEDDI pushBack _entity;
    };
  } else {
    MRTM_spawnedLIEDDI pushBack _entity;
  };
};

//Small IED (Urban)
HandleUrbanSmallIED = {
  params ["_entity"];
  if (typeOf _entity != "IEDUrbanSmall_Remote_Mag") exitwith {};
  if (count MRTM_spawnedSIEDU >= 5) then {
    private _mines = MRTM_spawnedSIEDU;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedSIEDU >= 5) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };
    if (count MRTM_spawnedSIEDU >= 5) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedSIEDU pushBack _entity;
    };
  } else {
    MRTM_spawnedSIEDU pushBack _entity;
  };
};

//Small IED (Dug-in)
HandleSmallIED = {
  params ["_entity"];
  if (count MRTM_spawnedSIEDDI >= 5) then {
    private _mines = MRTM_spawnedSIEDDI;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedSIEDDI >= 5) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };
    if (count MRTM_spawnedSIEDDI >= 5) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedSIEDDI pushBack _entity;
    };
  } else {
    MRTM_spawnedSIEDDI pushBack _entity;
  };
};

// Apers Trip Wire
HandleApersTripWire =
{
  params ["_entity"];
	if (count MRTM_spawnedTripWires >= 5) then {
    private _mines = MRTM_spawnedTripWires;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedTripWires >= 5) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };
    if (count MRTM_spawnedTripWires >= 5) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedTripWires pushBack _entity;
    };
  } else {
    MRTM_spawnedTripWires pushBack _entity;
  };
};

//APERS Tripwire Mine
HandleApersTripWireMine =
{
  params ["_entity"];
  if (count MRTM_spawnedTripwires >= 10) then {
    private _mines = MRTM_spawnedTripwires;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedTripwires >= 10) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };
    if (count MRTM_spawnedTripwires >= 10) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedTripwires pushBack _entity;
    };
  } else {
    MRTM_spawnedTripwires pushBack _entity;
  };
};