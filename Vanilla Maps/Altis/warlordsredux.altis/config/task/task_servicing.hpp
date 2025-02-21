class TaskBuyTechnical: WLTaskTutorialServicing {
    name = $STR_WLT_taskBuyTechnicalName;
    description = $STR_WLT_taskBuyTechnicalDesc;
    descArgs[] = {
        "actionKeysNames 'gear'"
    };
    reward = 100;
};

class TaskModifyVehicle: WLTaskTutorialServicing {
    name = $STR_WLT_taskModifyVehicleName;
    description = $STR_WLT_taskModifyVehicleDesc;
    prerequisites[] = {
        "TaskBuyTechnical"
    };
    reward = 100;
};

class TaskRepairVehicle: WLTaskTutorialServicing {
    name = $STR_WLT_taskRepairVehicleName;
    description = $STR_WLT_taskRepairVehicleDesc;
    prerequisites[] = {
        "TaskModifyVehicle"
    };
    reward = 200;
};

class TaskRearmVehicle: WLTaskTutorialServicing {
    name = $STR_WLT_taskRearmVehicleName;
    description = $STR_WLT_taskRearmVehicleDesc;
    prerequisites[] = {
        "TaskRepairVehicle"
    };
    reward = 200;
};

class TaskResetVehicle: WLTaskTutorialServicing {
    name = $STR_WLT_taskResetVehicleName;
    description = $STR_WLT_taskResetVehicleDesc;
    descArgs[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskRearmVehicle"
    };
    reward = 200;
};

class TaskRefuelVehicle: WLTaskTutorialServicing {
    name = $STR_WLT_taskRefuelVehicleName;
    description = $STR_WLT_taskRefuelVehicleDesc;
    onStart = "addMissionEventHandler ['Service', {['TaskRefuelVehicle'] call WLT_fnc_taskComplete;}];";
    prerequisites[] = {
        "TaskResetVehicle"
    };
    reward = 200;
};