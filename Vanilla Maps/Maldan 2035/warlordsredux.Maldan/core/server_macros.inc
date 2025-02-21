#define playerFunds ((serverNamespace getVariable "fundsDatabase") getOrDefault [(getPlayerUID _sender), 0])
#define variable (["actualIncomeBlu", "actualIncomeOpf"] select ([west, east] find (side group _x)))
#define getFTVehicle (["B_Truck_01_medical_F", "O_Truck_03_medical_F"] select ([west, east] find (side group _sender)))
#define getFTPod (["B_Slingload_01_Medevac_F", "Land_Pod_Heli_Transport_04_medevac_F"] select ([west, east] find (side group _sender)))