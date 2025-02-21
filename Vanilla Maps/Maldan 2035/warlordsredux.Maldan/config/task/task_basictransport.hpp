class TaskBuyQuad: WLTaskTutorialBasicTransport {
    name = $STR_WLT_taskBuyQuadName;
    description = $STR_WLT_taskBuyQuadDesc;
    descArgs[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {};
    reward = 50;
};

class TaskLockPersonal: WLTaskTutorialBasicTransport {
    name = $STR_WLT_taskLockPersonalName;
    description = $STR_WLT_taskLockPersonalDesc;
    prerequisites[] = {
        "TaskBuyQuad"
    };
    reward = 50;
};

class TaskDeleteVehicle: WLTaskTutorialBasicTransport {
    name = $STR_WLT_taskDeleteVehicleName;
    description = $STR_WLT_taskDeleteVehicleDesc;
    prerequisites[] = {
        "TaskLockPersonal"
    };
    reward = 50;
};