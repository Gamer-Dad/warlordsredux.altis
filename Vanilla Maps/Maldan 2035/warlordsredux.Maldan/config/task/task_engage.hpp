class TaskEngageOne: WLTaskEngage {
    name = $STR_WLT_taskEngageOneName;
    description = $STR_WLT_taskEngageOneDesc;
    prerequisites[] = {
        "TaskBuyQuad"
    };
    reward = 100;

    class KillsTracker: WLProgressTracker {
        id = "Kills";
        threshold = 1;
    };
};

class TaskEngageFive: WLTaskEngage {
    name = $STR_WLT_taskEngageFiveName;
    description = $STR_WLT_taskEngageFiveDesc;
    prerequisites[] = {
        "TaskEngageOne"
    };
    reward = 200;

    class KillsTracker: WLProgressTracker {
        id = "Kills";
        threshold = 5;
    };
};

class TaskEngageThirty: WLTaskEngage {
    name = $STR_WLT_taskEngageThirtyName;
    description = $STR_WLT_taskEngageThirtyDesc;
    prerequisites[] = {
        "TaskEngageFive"
    };
    reward = 1000;

    class KillsTracker: WLProgressTracker {
        id = "Kills";
        threshold = 30;
    };
};

class TaskEngageOfficer: WLTaskEngage {
    name = $STR_WLT_taskEngageOfficerName;
    description = $STR_WLT_taskEngageOfficerDesc;
    prerequisites[] = {
        "TaskEngageThirty"
    };
    reward = 500;

    class DestroyTracker: WLProgressTracker {
        id = "Kill: Officer";
        threshold = 1;
    };
};

class TaskEngageSniper: WLTaskEngage {
    name = $STR_WLT_taskEngageSniperName;
    description = $STR_WLT_taskEngageSniperDesc;
    prerequisites[] = {
        "TaskEngageOfficer"
    };
    reward = 500;

    class DestroyTracker: WLProgressTracker {
        id = "Kill: Sniper";
        threshold = 3;
    };
};

class TaskEngageAT: WLTaskEngage {
    name = $STR_WLT_taskEngageATName;
    description = $STR_WLT_taskEngageATDesc;
    prerequisites[] = {
        "TaskEngageSniper"
    };
    reward = 500;

    class DestroyTracker: WLProgressTracker {
        id = "Kill: Missile Specialist (AT)";
        threshold = 3;
    };
};

class TaskEngageAA: WLTaskEngage {
    name = $STR_WLT_taskEngageAAName;
    description = $STR_WLT_taskEngageAADesc;
    prerequisites[] = {
        "TaskEngageSniper"
    };
    reward = 1000;

    class DestroyTracker: WLProgressTracker {
        id = "Kill: Missile Specialist (AA)";
        threshold = 3;
    };
};