<<<<<<< HEAD

//DEBUG
west setFriend [east, 1]; 
east setFriend [west, 1];



//Points.sqf
missionNamespace setVariable ["kPoints", 0, true];

addMissionEventHandler ["EntityKilled", {
	_this execVM "scripts\points.sqf";
}];
=======
west setFriend [east, 1]; 
east setFriend [west, 1];
//missionNamespace setvariable ["bis_fnc_bleedTickets_ticketBleedMax",6]
>>>>>>> 0092286aba4e706d7bb6b454005c8cec336da237
