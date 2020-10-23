
//DEBUG
west setFriend [east, 1]; 
east setFriend [west, 1];



//Points.sqf
missionNamespace setVariable ["kPoints", 0, true];

addMissionEventHandler ["EntityKilled", {
	_this execVM "scripts\points.sqf";
}];
