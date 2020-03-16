parmas [[_t, 120], [_west, allPlayers - entities "headlessClient_F"], [_east, allGroups select (side == east)]];
/*
-	checks if ei groups have detected players and if waits some time then checks again, if still true then sets missionNamespace variable "Alarm" to 1, for this to do anything you need to get that variable and use that to activate a trigger or script that will do something.
-	need unscheduled environment all params optional [time to wait befor alarm, who is trying not to be detected, whos defending - default:120s, all players minus headless clients, all groups east]
*/
missionNamespace setVariable ["Alarm", 0];
while {(_east knowsAbout _west) > 1.5} do {
	sleep _t;
	if {(_east knowsAbout _west) > 1.5} then {missionNamespace setVariable ["Alarm", 1]};
};