class TaskBuyMBT: WLTaskTankBasics {
    name = $STR_WLT_taskBuyMBTName;
    description = $STR_WLT_taskBuyMBTDesc;
    prerequisites[] = {
        "TaskCombinedArmsArmor"
    };
    reward = 100;
};

class TaskBuyRepair: WLTaskTankBasics {
    name = $STR_WLT_taskBuyRepairName;
    description = $STR_WLT_taskBuyRepairDesc;
    prerequisites[] = {
        "TaskBuyMBT"
    };
    reward = 100;
};

class TaskStaffTank: WLTaskTankBasics {
    name = $STR_WLT_taskStaffTankName;
    description = $STR_WLT_taskStaffTankDesc;
    onStart = "group player addEventHandler ['CommandChanged', { if (_this # 1 == 'GET IN') then {['TaskStaffTank'] call WLT_fnc_taskComplete;}; }];";
    prerequisites[] = {
        "TaskBuyRepair"
    };
    reward = 100;
};

class TaskStaffRepair: WLTaskTankBasics {
    name = $STR_WLT_taskStaffRepairName;
    description = $STR_WLT_taskStaffRepairDesc;
    onStart = "group player addEventHandler ['CommandChanged', { if (_this # 1 == 'REPAIR VEHICLE') then {['TaskStaffRepair'] call WLT_fnc_taskComplete;}; }];";
    prerequisites[] = {
        "TaskStaffTank"
    };
    reward = 100;
};

class TaskTankAce: WLTaskTankBasics {
    name = $STR_WLT_taskTankAceName;
    description = $STR_WLT_taskTankAceDesc;
    prerequisites[] = {
        "TaskStaffRepair"
    };
    reward = 1000;
    class ArmorKillsTracker: WLProgressTracker {
        id = "Heavy Armor Kills";
        threshold = 5;
    };
};