#define playerFunds ((serverNamespace getVariable "fundsDatabase") getOrDefault [(getPlayerUID _sender), 0])
#define canopys (getArray (missionConfigFile >> "garbageConfig" >> "garbage" >> "Canopys"))
#define garbageList (getArray (missionConfigFile >> "garbageConfig" >> "garbage" >> "List"))
#define variable (["actualIncomeBlu", "actualIncomeOpf"] select ([west, east] find (side group _x)))