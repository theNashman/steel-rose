params ["_killed", "_killer", "_instigator"];
_kPoints = _instigator getVariable ["kPoints", 0];


if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0}; // UAV/UGV _instigator operated road kill
if (isNull _instigator) then {_instigator = _killer}; // _instigator driven vehicle road kill


_unitName = getText (configFile >> "CfgVehicles" >> typeOf _killed >> "displayName");
//systemChat str format ["%1 Killed By %2", _unitName, name _instigator];



_typeKilled = 0;
{
	if (_killed isKindOf _x) then {_typeKilled = _x};

} forEach ["CAManBase", "LandVehicle", "Air"];


switch (_typeKilled) do {

	case "CAManBase": {
		systemChat str format ["Man Killed By %1", name _instigator];
		_instigator setVariable ["kPoints", _kPoints + 5, true]; 
		_instigator groupChat format ["%1 now has %2 Points", name _instigator, _instigator getVariable "kPoints"];
		};

	case "LandVehicle": {
		systemChat str format ["Vehicle Killed By %1", name _instigator];
		_instigator setVariable ["kPoints", _kPoints + 10, true];
		_instigator groupChat format ["%1 now has %2 Points", name _instigator, _instigator getVariable "kPoints"];
		};

	case "Air": {
		systemChat str format ["Vehicle Killed By %1", name _instigator];
		_instigator setVariable ["kPoints", _kPoints + 15, true];
		_instigator groupChat format ["%1 now has %2 Points", name _instigator, _instigator getVariable "kPoints"];
		};

	default {
		systemChat "%1 else has been killed", name _killed;
		};
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
	"CAManBase"
	"Air"

*/

