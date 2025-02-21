/*
Repository for all WL Task related configurations.

class CfgTaskId {
    name = string;                  // Name of the task.
    nameArgs[] = string[];          // Arguments for the task name.
    description = string;           // Description of the task.
    descArgs[] = string[];          // [Code] Arguments for the task description.
    onStart = string;               // [Code] Code to execute when the task is started.
    prerequisites[] = string[];     // Prerequisite class ids for the task.
    parentTask = string;            // Parent task class id for the task.
    reward = number;                // Reward XP for the task.
    class ProgressTrackerId: WLProgressTracker {} // Progress tracker class for the task.
};
*/

class WLTask {};
class WLProgressTracker {
    id = "";                // Unique identifier for the progress tracker.
    threshold = 0;          // Threshold for the progress tracker.
};

class WLTaskTutorialBasicTransport: WLTask {
    parentTask = $STR_WLT_categoryBasicTransport;
};

class WLTaskTutorialFastTravel: WLTask {
    parentTask = $STR_WLT_categoryFastTravel;
};

class WLTaskTutorialServicing: WLTask {
    parentTask = $STR_WLT_categoryServicing;
};

class WLTaskTutorialSquads: WLTask {
    parentTask = $STR_WLT_categorySquad;
};

class WLTaskTutorialUiMechanics: WLTask {
    parentTask = $STR_WLT_categoryUIandMechanics;
};

class WLTaskEngage: WLTask {
    parentTask = $STR_WLT_categoryEngageEnemy;
};

class WLTaskCombinedArms: WLTask {
    parentTask = $STR_WLT_categoryCombinedArmsWarfare;
};

class WLTaskTankBasics: WLTaskCombinedArms {
    parentTask = $STR_WLT_categoryTankBasics;
};

class WLTaskSearchAndDestroy: WLTask {
    name = $STR_WLT_taskSearchAndDestroyName;
    description = $STR_WLT_taskSearchAndDestroyDesc;
    parentTask = $STR_WLT_categorySearchDestroy;
    prerequisites[] = {
        "TaskCombinedArmsArmor"
    };
};

class CfgWLTaskConfig {
    #include "task\task_basictransport.hpp"
    #include "task\task_fasttravel.hpp"
    #include "task\task_servicing.hpp"
    #include "task\task_squads.hpp"
    #include "task\task_uimechanics.hpp"
    #include "task\task_engage.hpp"
    #include "task\task_combinedarms.hpp"
    #include "task\task_tankbasics.hpp"
    #include "task\task_searchanddestroy.hpp"
};