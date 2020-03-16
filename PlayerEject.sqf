parmas [_vehicle];
// kicks players out off vehicle, vehicle needs to be passed - can be scheduled environment - ex: [v1]  execVM "filepath this file"; (would kick all players from vehicle with variableName v1)
private _players = allPlayers - entities "HeadlessClient_F";
{
	if (_x in _vehicle) then {
		_x moveOut;
	};
} forEach _players;