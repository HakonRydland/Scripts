/*
    Author: [Håkon]
    [Description]
        Renders the selection positions with names for 60 seconds

    Arguments:
    0. <Object> Object you want to render selection position for
    1. <String> LOD type    (Optional - Valid types are: "Memory", "Geometry", "FireGeometry", "LandContact", "HitPoints")
       <Array>  LOD types

    Return Value:
    <Nil>

    Scope: Clients
    Environment: Any
    Public: [Yes]
    Dependencies:

    Example:
        [cursorTarget] call HR_fnc_renderSelection;
        [cursorTarget, "Memory"] call HR_fnc_renderSelection;
        [cursorTarget, ["Memory", "FireGeometry"]] call HR_fnc_renderSelection;

    License: MIT License
*/
params ["_object", "_lod"];
if (isNull _object) exitWith {"ERROR"};

//remove previouse EH (if there were one)
removeMissionEventHandler ["Draw3D", player getVariable ["HR_RS_EH", -1]];

//get points and names
private _selectionNames = if (isNil "_lod") then {
    selectionNames _object;
} else {
    if (_lod isEqualType "") then {
        _object selectionNames _lod;
    } else {
        _r = [];
        { _r append (_object selectionNames _x) } forEach _lod;
        _r;
    };
};
HR_RS_selectionPositions = _selectionNames apply { [_x, _object selectionPosition _x] };
HR_RS_Object = _object;
HR_RS_RenderTime = time + 60;

//add draw eh
private _eh = addMissionEventHandler ["Draw3D", {
    if (!alive HR_RS_Object || HR_RS_RenderTime < time) then { removeMissionEventHandler ["Draw3D", player getVariable ["HR_RS_EH", -1]] }; //self removal
    {
        drawIcon3D ["\a3\ui_f\data\map\markers\military\dot_ca.paa", [1,0,0,1], HR_RS_Object modelToWorldVisual (_x#1), 1, 1, 0, _x#0, 1, 0.03, "TahomaB"];
    } forEach HR_RS_selectionPositions;
}];
player setVariable ["HR_RS_EH", _eh];
