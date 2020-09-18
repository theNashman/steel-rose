if (!isServer) exitWith {};

[west, 250] call BIS_fnc_respawnTickets;
[east, 250] call BIS_fnc_respawnTickets;

h = [] spawn {
	waitUntil{ !isNil "bis_fnc_bleedTickets_loop" };
	[[west,east], 0.8, 1, 10] call BIS_fnc_bleedTickets;
};