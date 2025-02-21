class TaskFastTravelSeized: WLTaskTutorialFastTravel {
    name = $STR_WLT_taskFastTravelSeizedName;
    description = $STR_WLT_taskFastTravelSeizedDesc;
    descArgs[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {};
    reward = 100;
};

class TaskFastTravelConflict: WLTaskTutorialFastTravel {
    name = $STR_WLT_taskFastTravelConflictName;
    description = $STR_WLT_taskFastTravelConflictDesc;
    descArgs[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskFastTravelSeized"
    };
    reward = 100;
};

class TaskFastTravelFTVehicle: WLTaskTutorialFastTravel {
    name = $STR_WLT_taskFastTravelFTVehicleName;
    description = $STR_WLT_taskFastTravelFTVehicleDesc;
    descArgs[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskFastTravelConflict"
    };
    reward = 100;
};

class TaskFastTravelFTPod: WLTaskTutorialFastTravel {
    name = $STR_WLT_taskFastTravelFTPodName;
    description = $STR_WLT_taskFastTravelFTPodDesc;
    descArgs[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskFastTravelFTVehicle"
    };
    reward = 100;
};

class TaskBuyTent: WLTaskTutorialFastTravel {
    name = $STR_WLT_taskBuyTentName;
    description = $STR_WLT_taskBuyTentDesc;
    descArgs[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskFastTravelFTPod"
    };
    reward = 50;
};

class TaskPlaceTent: WLTaskTutorialFastTravel {
    name = $STR_WLT_taskPlaceTentName;
    description = $STR_WLT_taskPlaceTentDesc;
    prerequisites[] = {
        "TaskBuyTent"
    };
    reward = 50;
};

class TaskFastTravelTent: WLTaskTutorialFastTravel {
    name = $STR_WLT_taskFastTravelTentName;
    description = $STR_WLT_taskFastTravelTentDesc;
    descArgs[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskPlaceTent"
    };
    reward = 100;
};

class TaskAirAssault: WLTaskTutorialFastTravel {
    name = $STR_WLT_taskAirAssaultName;
    description = $STR_WLT_taskAirAssaultDesc;
    descArgs[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskFastTravelTent"
    };
    reward = 200;
};

class TaskVehicleParadrop: WLTaskTutorialFastTravel {
    name = $STR_WLT_taskVehicleParadropName;
    description = $STR_WLT_taskVehicleParadropDesc;
    descArgs[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskAirAssault"
    };
    reward = 500;
};