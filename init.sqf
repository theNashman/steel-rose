
//DEBUG
//west setFriend [east, 1]; 
east setFriend [west, 1];



//Points.sqf


addMissionEventHandler ["EntityKilled", {
	_this execVM "scripts\points.sqf";
}];
