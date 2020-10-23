_configs = "true" configClasses (configFile >> "CfgVehicles");

configfile >> "CfgVehicles" >> "Tank"

"true" configClasses (configfile >> "CfgVehicles" >> "Tank");

O_Soldier_GL_F

getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName");