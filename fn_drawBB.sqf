/*
    Author: [Håkon]
    [Description]
        Draws BB of object, with key points marked

    Arguments:
    0. <Object> Object to draw bounding box of
    1. <Int>    Type of BB to draw (0-3)        (Optional - Default: 0)
    2. <Bool>   draw BB                         (optional - Default: true)

    Return Value:
    <Array> Positions relative in order: Front, Back, Left, Right, Top, Bottom

    Scope: Clients
    Environment: Any
    Public: [Yes]
    Dependencies:

    Example:
        [cursorTarget, 0, false] call HR_fnc_drawBB; //draws bounding box
        [cursorTarget, 0, true] call HR_fnc_drawBB; //stop drawing bounding box
*/
params [["_object", objnull], ["_type", 0], ["_draw", true]];

//clean up incase of reaplying without removing
removeMissionEventHandler ["Draw3D", player getVariable ["HR_drawBB_EH", -1]];

//set new object
HR_drawBB_Object = _object;
if (isNull HR_drawBB_Object) exitWith {"ERROR"};

//calculate points and define variables for the draw3D EH
private _bb = _type boundingBoxReal _object;
(_bb#0) params ["_x1", "_y1", "_z1"];
(_bb#1) params ["_x2", "_y2", "_z2"];

private _LeftBackBottom = [_x1,_y1,_z1];
private _LeftBackTop = [_x1,_y1,_z2];
private _LeftFrontTop = [_x1,_y2,_z2];
private _LeftFrontBottom = [_x1,_y2,_z1];
private _RightBackBottom = [_x2,_y1,_z1];
private _RightBackTop = [_x2,_y1,_z2];
private _RightFrontTop = [_x2,_y2,_z2];
private _RightFrontBottom = [_x2,_y2,_z1];

HR_drawBB_LinePairs = [
    //Left square
    [_LeftBackBottom, _LeftBackTop],
    [_LeftBackTop, _LeftFrontTop],
    [_LeftFrontTop, _LeftFrontBottom],
    [_LeftFrontBottom, _LeftBackBottom],

    //Right square
    [_RightBackBottom, _RightBackTop],
    [_RightBackTop, _RightFrontTop],
    [_RightFrontTop, _RightFrontBottom],
    [_RightFrontBottom, _RightBackBottom],

    //square connectors
    [_LeftBackBottom, _RightBackBottom],
    [_LeftBackTop, _RightBackTop],
    [_LeftFrontTop, _RightFrontTop],
    [_LeftFrontBottom, _RightFrontBottom],

    //diagonal
    [_LeftBackBottom, _RightFrontTop]
];

private _HR_drawBB_POI = [
    ["Front",   [0, _y2, 0]],
    ["Back",    [0, _y1, 0]],
    ["Left",    [_x1, 0, 0]],
    ["Right",   [_x2, 0, 0]],
    ["Top",    [0, 0, _z2]],
    ["Bottom",  [0, 0, _z1]]
];
HR_drawBB_POI = _HR_drawBB_POI;

if !(_draw) exitWith { HR_drawBB_Object = nil; HR_drawBB_LinePairs = []; HR_drawBB_POI = []; _HR_drawBB_POI};

//start drawing
private _eh = addMissionEventHandler ["Draw3D", {
    //remove EH if object is destroyed or null
    if (!alive HR_drawBB_Object) then { removeMissionEventHandler ["Draw3D", player getVariable ["HR_drawBB_EH", -1]] };

    //draw box
    {
        _x params ["_point1", "_point2"];
        drawLine3D [
            HR_drawBB_Object modelToWorldVisual _point1,
            HR_drawBB_Object modelToWorldVisual _point2,
            [1,0,0,1]
        ];
    } forEach HR_drawBB_LinePairs;

    //draw key points
    {
        drawIcon3D ["\a3\ui_f\data\map\markers\military\dot_ca.paa", [1,0,0,1], HR_drawBB_Object modelToWorldVisual (_x#1), 1, 1, 0, _x#0, 1, 0.05, "TahomaB"];
    } forEach HR_drawBB_POI;
}];
player setVariable ["HR_drawBB_EH", _eh];

//return key points
_HR_drawBB_POI
