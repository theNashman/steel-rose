/*
	Small function to add score to player upon killing a unit


	Usage: [object] call ROSE_fnc_killAir;
	returns new killscore

*/


params ["_killed", "_killer", "_instigator", "_worth"];



_kPoints = _instigator getVariable ["kPoints", 0];

_instigator setVariable ["kPoints", _kPoints + _worth, true]; 
systemChat str format ["%1 Killed By %2", name _killed, name _instigator];
_instigator groupChat format ["%1 now has %2 Points", name _instigator, _instigator getVariable "kPoints"];











//Mandatory return
_instigator getVariable "kPoints";