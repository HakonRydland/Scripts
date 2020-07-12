/*
    params: [Target, Type, Track, Inaccuracy, Drop, Direction]
        (Object/array) Target: Object or Position
        (String) Type: Bomb-Type 					(optional) (Default: HE)
        (Bool) Track: follow target					(optional) (Default: false)
        (int) Drop: How many bombs to drop  		(optional) (Default: 1)            (same target)
        (int) Inaccuracy: Inaccuracy in meters		(optional) (Default: 0)            (if tracking this will not apply)
        (int) Direction: degrees from north         (optional) (Default: random 360)

    Function: Launches a A10 at target and drops LGB's

    return: nil

    Execution: Unscheduled

    Example use: [cursorObject, "HE", true, 1, 0, 270] execVM "precisionAirstrike.sqf"; //sends a airstrike wite a snigle gbu-12 to the cursorTarget from the east
*/

params ["_target", ["_bombType", "HE"], ["_track", false], ["_dropCount", 1], ["_inaccuracy", 0], ["_dir", random 360]];
if (isNil "_target") exitWith {diag_Log "| Precition Airstrike | Nil object/position input"};

//select bomb type
private ["_pylon", "_bomb", "_flyHight", "_engagementDist"];
_engagementDist = 400;
_dropInterval = 1;
switch (_bombType) do {
    Case "HE": {_pylon = "PylonMissile_1Rnd_Bomb_04_F"; _bomb = "Bomb_04_Plane_CAS_01_F"; _flyHight = 150};
    Case "Cluster": {_pylon = "PylonMissile_1Rnd_BombCluster_01_F"; _bomb = "BombCluster_01_F"; _flyHight = 500; _inaccuracy = _inaccuracy*3; ; _engagementDist = 305};
    Case "AT": {_pylon = "PylonRack_1Rnd_LG_scalpel"; _bomb = "missiles_SCALPEL"; _flyHight = 300; ; _engagementDist = 800};
    Case "Dumb": {_pylon = "PylonMissile_1Rnd_Mk82_F"; _bomb = "Mk82BombLauncher"; _flyHight = 150; _engagementDist = 615; _dropInterval =0.35};
    Default {_pylon = "PylonMissile_1Rnd_Bomb_04_F"; _bomb = "Bomb_04_Plane_CAS_01_F"; _flyHight = 150};
};

//geting target position
private ["_pos", "_laseTarget"];
if (_target isEqualType []) then {
    _pos = _target;
    _pos = _pos getPos [random _inaccuracy, random 360];
} else {
    _pos = getpos _target;
    _pos = _pos getPos [random _inaccuracy, random 360];
};
_laseTarget = if (_track) then {_target} else {[_pos select 0, _pos select 1, 0]};

//spawn plane
private _planePos = _pos getPos [4000, _dir + 180];
private _planeType = "O_Plane_CAS_02_dynamicLoadout_F";//"B_Plane_CAS_01_dynamicLoadout_F";
private _planefn = [_planePos, _dir, _planeType, west] call bis_fnc_spawnvehicle;
private _plane = _planefn select 0;
private _planeCrew = _planefn select 1;
{_x disableAI "AUTOTARGET"; _x disableAI "TARGET"}forEach _planeCrew;
private _groupPlane = _planefn select 2;

//orient get it flying and set its loadout
_plane setDir (_plane getRelDir _pos);
_plane setPos (_planePos vectorAdd [0,0,350]);
_plane setVelocityModelSpace (velocityModelSpace _plane vectorAdd [0, 150, 50]);
_plane flyInHeight 150;
_posASL = AGLToASL _pos;
_plane flyInHeightASL [(_posASL select 2) + 150, (_posASL select 2) + 150, (_posASL select 2) + 150];
if !(
    for "_i" from 1 to 10 do {
    _plane setPylonLoadOut [_i, _pylon, true];
    }
) exitWith {diag_Log "| Precition Airstrike | Plane dosnt support pylons"};

//spawn drone for targeting
private _designatorPos = _pos findEmptyPosition [5, 20, "B_UAV_01_F"];
private _designator = "B_UAV_01_F" createVehicle _designatorPos;
private _desGroup = createVehicleCrew _designator;
_designator setPos [_designatorPos select 0, _designatorPos select 1, 500];
_designator setDir (_designator getRelDir _pos);
_designator lockCameraTo [_laseTarget,[0]];
[_designator, "Laserdesignator_mounted"] call BIS_fnc_fire;
hideObjectGlobal _designator;

//get pos of path
private _dp = _pos getPos [10, _dir +180];
_dp = _dp vectorAdd [0,0,150];
private _ep = _pos getPos [100, _dir];
_ep = _ep vectorAdd [0,0,150];
private _fp = _pos getPos [4000, _dir];
_fp = _fp vectorAdd [0,0,150];

//set waypoints
private _wp1 = group _plane addWaypoint [_dp, 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed "LIMITED";
_wp1 setWaypointBehaviour "CARELESS";
_plane setCollisionLight true;
private _wp2 = group _plane addWaypoint [_ep, 0];
_wp2 setWaypointSpeed "LIMITED";
_wp2 setWaypointType "MOVE";
private _wp3 = group _plane addWaypoint [_fp, 0];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed "FULL";

//wait to fire
waitUntil {_plane distance2D _pos < _engagementDist};
private _lasePoint = laserTarget _designator;
for "_i" from 1 to _dropCount do {
    _plane fireAtTarget [_lasePoint,_bomb];
    sleep _dropInterval;
};

//cleanUp
private _timeOut = time + 300;
waitUntil {(currentWaypoint (group _plane) == 4) or (time > _timeOut)};
{deleteVehicle _x} forEach crew _plane;
{deleteVehicle _x} forEach units _desGroup;
deleteVehicle _plane;
deleteVehicle _designator;
