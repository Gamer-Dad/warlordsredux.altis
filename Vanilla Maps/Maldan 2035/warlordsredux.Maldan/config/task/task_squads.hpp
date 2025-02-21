class TaskCreateSquad: WLTaskTutorialSquads {
    name = $STR_WLT_taskCreateSquadName;
    description = $STR_WLT_taskCreateSquadDesc;
    reward = 100;
};

class TaskLeaveSquad: WLTaskTutorialSquads {
    name = $STR_WLT_taskLeaveSquadName;
    description = $STR_WLT_taskLeaveSquadDesc;
    prerequisites[] = {
        "TaskCreateSquad"
    };
    reward = 100;
};

class TaskJoinSquad: WLTaskTutorialSquads {
    name = $STR_WLT_taskJoinSquadName;
    description = $STR_WLT_taskJoinSquadDesc;
    prerequisites[] = {
        "TaskLeaveSquad"
    };
    reward = 500;
};

class TaskFastTravelSquad: WLTaskTutorialSquads {
    name = $STR_WLT_taskFastTravelSquadName;
    description = $STR_WLT_taskFastTravelSquadDesc;
    descArgs[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskJoinSquad",
        "TaskFastTravelSeized"
    };
    reward = 100;
};