params ["_killed", "_killer", "_instigator"];

if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0}; // UAV/UGV player operated road kill
if (isNull _instigator) then {_instigator = _killer}; // player driven vehicle road kill


_unitName = getText (configFile >> "CfgVehicles" >> typeOf _killed >> "displayName");
//systemChat str format ["%1 Killed By %2", _unitName, name _instigator];



_typeKilled = 0;
{
	if (_killed isKindOf _x) then {_typeKilled = _x};

} forEach ["Man", "LandVehicle", "Air"];


switch (_typeKilled) do {
	case "Man": {systemChat str format ["Man Killed By %1", name _instigator];};
	case "LandVehicle": {systemChat str format ["Vehicle Killed By %1", name _instigator];};
	case "Air": {systemChat str format ["Vehicle Killed By %1", name _instigator];};
	default {systemChat "Something else has been killed";};
};











//Unit Costs
/*

	"Infantry" = 5
	"Specialists" = 10
	"Leaders" = 15
	"Cars/Trucks" = 10
	"MRAP" = 15
	"APC" = 20
	"IFV" = 30
	"Tanks" = 50
	"Transport Heli" = 25
	"Attack Heli" = 40
	"Plane" = 75
	"Officer" = 50
	Negative for Teamkills
	"Civillian" = -15 

*/

/*
Class names

	"LandVehicle"
	"Man"
	"Air"

*/

