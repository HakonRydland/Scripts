/*
    Author: [Håkon]
    [Description]
        Retrieves model relative position of bounding box real points of interest(POI).

        Valid POI are: "Left", "Right", "Front", "Back", "Top", "Bottom"

    Arguments:
    0. <Object> Object you want the POI off
    1. <String> Point of interest
    2. <Int>    Bonding box clipping type (0-3) (Optional - Default: 0)

    Return Value:
    <Array> Model relative position of POI

    Scope: Any
    Environment: unscheduled
    Public: [Yes]
    Dependencies:

    Example: [cursorTarget, "Left"] call HR_fnc_getBBPOI;

    License: MIT License
*/
params [["_object", objNull, [objNull]], ["_POI", "", [""]], ["_type",0, [0]]];
if (isNull _object) exitWith {"ERROR: null object"};
if (_POI isEqualTo "") exitWith {"ERROR: No POI input"};

private _BB = _type boundingBoxReal _object;

switch _POI do {
    case "Left":   {_BB#0#0};
    case "Back":   {_BB#0#1};
    case "Bottom": {_BB#0#2};
    case "Right":  {_BB#1#0};
    case "Front":  {_BB#1#1};
    case "Top":    {_BB#1#2};
    Default {"ERROR: Invalid POI"};
};
