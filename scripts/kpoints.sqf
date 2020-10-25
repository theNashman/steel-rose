params ["_killed", "_killer", "_instigator"];



//Pre-defined Kill Points
//Change only kMultiplier to increase or decrease the score for all kills
//But don't touch others or costs become unbalanced
#define kMultiplier 5
_kpMan = 1 * kMultiplier;
_kpLand = 2 * kMultiplier;
_kpAir = 3 * kMultiplier;









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
		[_killed, _killer, _instigator, _kpMan] spawn ROSE_fnc_killMan;
		};

	case "LandVehicle": {
		[_killed, _killer, _instigator, _kpLand] spawn ROSE_fnc_killLand;
		};

	case "Air": {
		[_killed, _killer, _instigator, _kpAir] spawn ROSE_fnc_killAir;
		};

	default {
		systemChat str format ["%1 has died", name _killed];
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

