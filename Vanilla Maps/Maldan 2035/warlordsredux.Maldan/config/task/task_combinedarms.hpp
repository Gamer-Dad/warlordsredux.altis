class TaskCombinedArmsAPS: WLTaskCombinedArms {
    name = $STR_WLT_taskCombinedArmsAPSName;
    description = $STR_WLT_taskCombinedArmsAPSDesc;
    prerequisites[] = {
        "TaskEngageFive"
    };
    reward = 100;
    class APSTracker: WLProgressTracker {
        id = "Trigger APS";
        threshold = 1;
    };
};

class TaskCombinedArmsArmor: WLTaskCombinedArms {
    name = $STR_WLT_taskCombinedArmsArmorName;
    description = $STR_WLT_taskCombinedArmsArmorDesc;
    prerequisites[] = {
        "TaskCombinedArmsAPS"
    };
    reward = 200;
    class ArmorKillsTracker: WLProgressTracker {
        id = "Armor Kills";
        threshold = 1;
    };
};

class TaskCombinedArmsAir: WLTaskCombinedArms {
    name = $STR_WLT_taskCombinedArmsAirName;
    description = $STR_WLT_taskCombinedArmsAirDesc;
    prerequisites[] = {
        "TaskCombinedArmsArmor"
    };
    reward = 500;
    class AirKillsTracker: WLProgressTracker {
        id = "Air Vehicle Kills";
        threshold = 1;
    };
};

class TaskCombinedArmsOperation: WLTaskCombinedArms {
    name = $STR_WLT_taskCombinedArmsOperationName;
    description = $STR_WLT_taskCombinedArmsOperationDesc;
    prerequisites[] = {
        "TaskCombinedArmsAir"
    };
    reward = 1000;
    class KillsTracker: WLProgressTracker {
        id = "Kills";
        threshold = 10;
    };
    class LightVehicleKillsTracker: WLProgressTracker {
        id = "Light Vehicle Kills";
        threshold = 3;
    };
    class ArmorKillsTracker: WLProgressTracker {
        id = "Armor Kills";
        threshold = 1;
    };
    class AirKillsTracker: WLProgressTracker {
        id = "Air Vehicle Kills";
        threshold = 1;
    };
};

class TaskCombinedArmsCampaign: WLTaskCombinedArms {
    name = $STR_WLT_taskCombinedArmsCampaignName;
    description = $STR_WLT_taskCombinedArmsCampaignDesc;
    prerequisites[] = {
        "TaskCombinedArmsOperation"
    };
    reward = 5000;

    class KillsTracker: WLProgressTracker {
        id = "Kills";
        threshold = 50;
    };
    class LightVehicleKillsTracker: WLProgressTracker {
        id = "Light Vehicle Kills";
        threshold = 5;
    };
    class ArmorKillsTracker: WLProgressTracker {
        id = "Armor Kills";
        threshold = 5;
    };
    class AirKillsTracker: WLProgressTracker {
        id = "Air Vehicle Kills";
        threshold = 3;
    };
};