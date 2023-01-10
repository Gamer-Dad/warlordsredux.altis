#define WL_RESPAWN_MARKERS_CNT 20
#define WL_ZONE_RESTRICTION_KILL_TIMEOUT_INFANTRY 120
#define WL_ZONE_RESTRICTION_KILL_TIMEOUT_VEHICLES 120
#define WL_ZONE_RESTRICTION_KILL_TIMEOUT_AIRCRAFT 120
#define WL_MAX_SEIZING_HEIGHT 38 //this is AGL, default value 150, actual cap height = this/2-ish. 50 gives a cap height of 35?
#define WL_TIMEOUT_MIN 0.055 //25, 55 = 20 FPS + 3 MS + 2ms(for slop) to safely run scripts at 20 fps.
#define WL_TIMEOUT_SHORT 0.25
#define WL_TIMEOUT_MEDIUM 0.5
#define WL_TIMEOUT_STANDARD 1
#define WL_TIMEOUT_LONG 5
#define WL_TIMEOUT_MAX 30
#define WL_CONNECTING_LINE_AXIS 20
#define WL_CONNECTING_LINE_ALPHA_MIN 0.2
#define WL_CONNECTING_LINE_ALPHA_MAX 0.5
#define WL_MAP_PULSE_FREQ 1
#define WL_MAP_PULSE_ICON_SIZE 1.5
#define WL_BASE_ICON_SIZE 1.5
#define WL_ANNOUNCER_PAUSE 0.5
#define WL_SECTOR_CAPTURE_REWARD_MULTIPLIER 30
#define WL_SECTOR_PAYOFF_PERIOD 75 
#define WL_SPAWN_GRID_SIZE 40
#define WL_PLAYER_ICON_RANGE 75
#define WL_BASE_DANGER_SPAWN_RANGE 200
#define WL_ID_SELECTION_NONE 0
#define WL_ID_SELECTION_VOTING 1
#define WL_ID_SELECTION_VOTED 2
#define WL_ID_SELECTION_FAST_TRAVEL 3
#define WL_ID_SELECTION_ORDERING_NAVAL 4
#define WL_ID_SELECTION_ORDERING_AIRCRAFT 5
#define WL_ID_SELECTION_ORDERING_AIRDROP 6
#define WL_ID_SELECTION_SCAN 7
#define WL_ID_SELECTION_FAST_TRAVEL_CONTESTED 8
#define WL_ID_SELECTION_DEPLOYING_DEFENCE 9
#define WL_SEIZING_TIMEOUT_MIN 15
#define WL_SEIZING_TIMEOUT_MAX 90
#define WL_FAST_TRAVEL_OFFSET 100
#define WL_FAST_TRAVEL_RANGE_AXIS 50
#define WL_FAST_TRAVEL_TEAM_RADIUS 200
#define WL_TARGET_RESET_ZONE_RESTRICTION_TOLERANCE 30
#define WL_SCAN_DURATION 30
#define WL_MAP_FONT_SIZE 0.0375
#define WL_SCENE_FONT_SIZE 0.03
#define WL_ASSET_REMOVAL_SAFEZONE 0 //100
#define WL_RESPAWN_PROTECTION_DURATION 240
#define WL_ASSET_PROTECTION_DURATION 240
#define WL_ASSET_SCENE_ICON_DURATION 90
#define WL_FRIENDLY_FIRE_RECORD_DURATION 1200
#define WL_FRIENDLY_FIRE_THRESHOLD 2
#define WL_FRIENDLY_FIRE_PENALTY 180
#define WL_FRIENDLY_FIRE_PENALTY_MAX 600
#define WL_MAINTENANCE_RADIUS 50
#define WL_MAINTENANCE_COOLDOWN_REPAIR 300
#define WL_MAINTENANCE_COOLDOWN_REARM 300
#define WL_MAINTENANCE_COOLDOWN_REARM_Helicopter 600
#define WL_MAINTENANCE_COOLDOWN_REARM_Jets 1200
#define WL_MAINTENANCE_COOLDOWN_REARM_Mortar 900
#define WL_MAINTENANCE_COOLDOWN_REARM_Preatorian 300
#define WL_MAINTENANCE_COOLDOWN_REARM_Spartan 600
#define WL_MAINTENANCE_COOLDOWN_REARM_DefenderRhea 750
#define WL_MAINTENANCE_COOLDOWN_REARM_Centurion 900
#define WL_MAINTENANCE_COOLDOWN_REARM_Artillery 1800 
#define WL_MAINTENANCE_COOLDOWN_REARM_VLS 2700
#define WL_LOSING_SECTOR_WARN_FREQ 30
#define WL_MUSIC_VOLUME 0.1
#define WL_GARRISON_GROUP_SIZE_MIN 3
#define WL_GARRISON_GROUP_SIZE_MAX 5
#define WL_ASSET_IRRELEVANT_RANGE 1000
#define WL_TARGET_RESET_VOTING_TIME 60
#define RD_KILL_REWARD_MOD 4444  //Original value 10,000
#define RD_GARRISON_SIZE_MOD 2.5  //Original value 2; adjust this to increase total INF spawning in an AI sector. 
#define RD_DISABLE_TEAM_SWITCHING 1  //default 1; 1 = Team switching disabled; 2 = Team switching enabled

#define RD_UAVCOUNT_DELETE_THRESHOLD 30 //Original value 50;  
#define WL_SYNCED_TIME (call BIS_fnc_WL2_syncedTime)
#define WL_TARGET_FRIENDLY (missionNamespace getVariable format ["BIS_WL_currentTarget_%1", BIS_WL_playerSide])
#define WL_TARGET_ENEMY (missionNamespace getVariable format ["BIS_WL_currentTarget_%1", BIS_WL_enemySide])
#define WL_CONTROL_MAP (uiNamespace getVariable ["BIS_WL_mapControl", controlNull])
#define WL_DISPLAY_MAIN (findDisplay 46)
#define WL_PLAYER_FUNDS (player getVariable ["BIS_WL_funds", -1])
#define WL_PLAYER_REQUISITION_LIST (missionNamespace getVariable format ["BIS_WL_purchasable_%1", BIS_WL_playerSide])
#define WL_REQUISITION_CATEGORIES ["Infantry", "Vehicles", "Aircraft", "Naval", "Defences", "Gear", "Strategy"]
#define WL_PLAYER_VEHS (missionNamespace getVariable [format ["BIS_WL_%1_ownedVehicles", getPlayerUID player], []])
#define WL_BASES [BIS_WL_base1, BIS_WL_base2]