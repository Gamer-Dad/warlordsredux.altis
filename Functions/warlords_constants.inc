#define WL_RESPAWN_MARKERS_CNT 20
#define WL_TIMEOUT_MIN 0.055 //25, 55 = 20 FPS + 3 MS + 2ms(for slop) to safely run scripts at 20 fps.
#define WL_TIMEOUT_SHORT 0.25
#define WL_TIMEOUT_MEDIUM 0.5
#define WL_TIMEOUT_STANDARD 1
#define WL_TIMEOUT_LONG 5
#define WL_CONNECTING_LINE_AXIS 20
#define WL_CONNECTING_LINE_ALPHA_MIN 0.2
#define WL_CONNECTING_LINE_ALPHA_MAX 0.5
#define WL_MAP_PULSE_FREQ 1
#define WL_MAP_PULSE_ICON_SIZE 1.5
#define WL_BASE_ICON_SIZE 1.5
#define WL_BASE_DANGER_SPAWN_RANGE 200
#define WL_ID_SELECTION_NONE 0
#define WL_ID_SELECTION_VOTING 1
#define WL_ID_SELECTION_VOTED 2
#define WL_ID_SELECTION_FAST_TRAVEL 3
#define WL_ID_SELECTION_ORDERING_NAVAL 4
#define WL_ID_SELECTION_ORDERING_AIRCRAFT 5
#define WL_ID_SELECTION_SCAN 7
#define WL_ID_SELECTION_FAST_TRAVEL_CONTESTED 8
#define WL_ID_SELECTION_DEPLOYING_DEFENCE 9
#define WL_FAST_TRAVEL_OFFSET 100
#define WL_FAST_TRAVEL_RANGE_AXIS 50
#define WL_TARGET_RESET_ZONE_RESTRICTION_TOLERANCE 30
#define WL_MAINTENANCE_RADIUS 30
#define WL_MAINTENANCE_COOLDOWN_REPAIR 600
#define WL_MAINTENANCE_COOLDOWN_REARM 600
#define WL_MAINTENANCE_COOLDOWN_REARM_Helicopter 600
#define WL_MAINTENANCE_COOLDOWN_REARM_Jets 1200
#define WL_MAINTENANCE_COOLDOWN_REARM_Mortar 900
#define WL_MAINTENANCE_COOLDOWN_REARM_Preatorian 300
#define WL_MAINTENANCE_COOLDOWN_REARM_Spartan 600
#define WL_MAINTENANCE_COOLDOWN_REARM_DefenderRhea 750
#define WL_MAINTENANCE_COOLDOWN_REARM_Centurion 900
#define WL_MAINTENANCE_COOLDOWN_REARM_Artillery 1800 
#define WL_MAINTENANCE_COOLDOWN_REARM_VLS 2700
#define WL_TARGET_RESET_VOTING_TIME 60
#define WL_TARGET_FRIENDLY (missionNamespace getVariable format ["BIS_WL_currentTarget_%1", playerSide])
#define WL_TARGET_ENEMY (missionNamespace getVariable format ["BIS_WL_currentTarget_%1", BIS_WL_enemySide])
#define WL_CONTROL_MAP (uiNamespace getVariable ["BIS_WL_mapControl", controlNull])
#define WL_PLAYER_REQUISITION_LIST (missionNamespace getVariable format ["BIS_WL_purchasable_%1", playerSide])
#define WL_REQUISITION_CATEGORIES ["Infantry", "Vehicles", "Aircraft", "Naval", "Defences", "Gear", "Strategy"]
#define WL_PLAYER_VEHS (missionNamespace getVariable [format ["BIS_WL_%1_ownedVehicles", getPlayerUID player], []])
#define WL_BASES [BIS_WL_base1, BIS_WL_base2]