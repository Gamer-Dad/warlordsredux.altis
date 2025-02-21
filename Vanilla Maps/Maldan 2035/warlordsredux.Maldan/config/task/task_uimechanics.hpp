class TaskThirdPerson: WLTaskTutorialUiMechanics {
    name = $STR_WLT_taskThirdPersonName;
    description = $STR_WLT_taskThirdPersonDesc;
    descArgs[] = {
        "actionKeysNames 'personView'"
    };
    prerequisites[] = {};
    reward = 50;
};

class TaskQuickBuy: WLTaskTutorialUiMechanics {
    name = $STR_WLT_taskQuickBuyName;
    description = $STR_WLT_taskQuickBuyDesc;
    descArgs[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskThirdPerson"
    };
    reward = 50;
};

class TaskQuickBuyShortcut: WLTaskTutorialUiMechanics {
    name = $STR_WLT_taskQuickBuyShortcutName;
    description = $STR_WLT_taskQuickBuyShortcutDesc;
    prerequisites[] = {
        "TaskQuickBuy"
    };
    reward = 50;
};

class TaskEarplugs: WLTaskTutorialUiMechanics {
    name = $STR_WLT_taskEarplugsName;
    description = $STR_WLT_taskEarplugsDesc;
    prerequisites[] = {
        "TaskQuickBuyShortcut"
    };
    reward = 50;
};

class TaskMapPing: WLTaskTutorialUiMechanics {
    name = $STR_WLT_taskMapPingName;
    description = $STR_WLT_taskMapPingDesc;
    descArgs[] = {
        "actionKeysNames 'TacticalPing'"
    };
    prerequisites[] = {
        "TaskEarplugs"
    };
    reward = 50;
};

class TaskMapAssetControls: WLTaskTutorialUiMechanics {
    name = $STR_WLT_taskMapAssetControlsName;
    description = $STR_WLT_taskMapAssetControlsDesc;
    prerequisites[] = {
        "TaskMapPing",
        "TaskBuyQuad"
    };
    reward = 50;
};

class TaskMapSectorControls: WLTaskTutorialUiMechanics {
    name = $STR_WLT_taskMapSectorControlsName;
    description = $STR_WLT_taskMapSectorControlsDesc;
    prerequisites[] = {
        "TaskMapAssetControls",
        "TaskFastTravelSeized"
    };
    reward = 50;
};

class TaskCustomization: WLTaskTutorialUiMechanics {
    name = $STR_WLT_taskCustomizationName;
    description = $STR_WLT_taskCustomizationDesc;
    descArgs[] = {
        "actionKeysNames 'gear'"
    };
    prerequisites[] = {
        "TaskMapSectorControls"
    };
    reward = 50;
};

class TaskLoadDeployable: WLTaskTutorialUiMechanics {
    name = $STR_WLT_taskLoadDeployableName;
    description = $STR_WLT_taskLoadDeployableDesc;
    prerequisites[] = {
        "TaskCustomization"
    };
    reward = 200;
};

class TaskSlingload: WLTaskTutorialUiMechanics {
    name = $STR_WLT_taskSlingloadName;
    description = $STR_WLT_taskSlingloadDesc;
    prerequisites[] = {
        "TaskLoadDeployable"
    };
    reward = 200;
};