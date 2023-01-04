#include "..\warlords_constants.inc"

// use other event handlers for other mines
// give them their own array aswell in init.sqf

//APERS Mine
addMissionEventhandler ["EntityCreated", {
  params ["_entity"];
  if (typeOf _entity != "APERSMine_Range_Ammo") exitwith {};
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
}];

//APERS Dispenser
addMissionEventhandler ["EntityCreated", {
  params ["_entity"];
  if (typeOf _entity != "APERSMineDispenser_Ammo") exitwith {};
  if (count MRTM_spawnedAPERSDispenser >= 5) then {
    private _mines = MRTM_spawnedAPERSDispenser;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedAPERSDispenser >= 5) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };
    if (count MRTM_spawnedAPERSDispenser >= 5) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedAPERSDispenser pushBack _entity;
    };
  } else {
    MRTM_spawnedAPERSDispenser pushBack _entity;
  };
}];

//APERS Dispenser Ammo
addMissionEventhandler ["EntityCreated", {
  params ["_entity"];
  if (typeOf _entity != "APERSMineDispenser_Mine_Ammo") exitwith {};
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
}];


//APERS Bounding Mine
addMissionEventhandler ["EntityCreated", {
  params ["_entity"];
  if (typeOf _entity != "APERSBoundingMine_Range_Mag") exitwith {};
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
}];

//AT Mine
addMissionEventhandler ["EntityCreated", {
  params ["_entity"];
  if (typeOf _entity != "ATMine_Range_Ammo") exitwith {};
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
}];

//M6 SLAM Mine
addMissionEventhandler ["EntityCreated", {
  params ["_entity"];
  if (typeOf _entity != "SLAMDirectionalMine_Wire_Mag") exitwith {};
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
}];

//APERS Tripwire Mine
addMissionEventhandler ["EntityCreated", {
  params ["_entity"];
  if (typeOf _entity != "APERSTripMine_Wire_Mag") exitwith {};
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
}];

//Claymore Charge
addMissionEventhandler ["EntityCreated", {
  params ["_entity"];
  if (typeOf _entity != "ClaymoreDirectionalMine_Remote_Mag") exitwith {};
  if (count MRTM_spawnedClaymores >= 6) then {
    private _mines = MRTM_spawnedClaymores;
    // to get rid of destroyed mines without messing up the order
    if (count MRTM_spawnedClaymores >= 6) then {
      private _t = _mines find objNull;
      if (_t == -1) then {break};
      _mines deleteAt _t;
    };
    if (count MRTM_spawnedClaymores >= 6) then {
      deleteVehicle _entity;
    } else {
      MRTM_spawnedClaymores pushBack _entity;
    };
  } else {
    MRTM_spawnedClaymores pushBack _entity;
  };
}];

//Explosive Satchel
addMissionEventhandler ["EntityCreated", {
  params ["_entity"];
  if (typeOf _entity != "SatchelCharge_Remote_Mag") exitwith {};
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
}];

//Explosive Charge
addMissionEventhandler ["EntityCreated", {
  params ["_entity"];
  if (typeOf _entity != "DemoCharge_Remote_Mag") exitwith {};
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
}];

//Large IED (Urban)
addMissionEventhandler ["EntityCreated", {
  params ["_entity"];
  if (typeOf _entity != "IEDUrbanBig_Remote_Mag") exitwith {};
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
}];

//Large IED (Dug-in)
addMissionEventhandler ["EntityCreated", {
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
}];

//Small IED (Urban)
addMissionEventhandler ["EntityCreated", {
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
}];

//Small IED (Dug-in)
addMissionEventhandler ["EntityCreated", {
  params ["_entity"];
  if (typeOf _entity != "IEDLandSmall_Remote_Mag") exitwith {};
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
}];