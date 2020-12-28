// calculate new position orbit position based on updated direction data x and y
// note dir y is caped -90 to 90 degres
// calculation can a distance from object modified by boundingBox diamater and rotates it up/down then around the object
// visualizes it with a red line from center to cam pos
Debug_object = cursorObject;
[180, 20] params ["_xDir", "_yDir"];

private _BB = 0 boundingBoxReal Debug_object;
Debug_pos = [(_BB#2) * 1, 0,0];
Debug_pos = [Debug_pos, _yDir, 1] call BIS_fnc_rotateVector3D;
Debug_pos = [Debug_pos, _xDir] call BIS_fnc_rotateVector2D;

if (isNil "Debug_Render") then {
    Debug_Render = addMissionEventHandler ["EachFrame", {
        private _centerPos = Debug_object modelToWorldVisual [0,0,0];
        private _camPos = Debug_object modelToWorldVisual Debug_pos;
        drawLine3D [_centerPos, _camPos, [1,0,0,1]];
    }];
};
