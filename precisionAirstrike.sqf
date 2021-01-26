/*
    params: [Target, Type, Track, Inaccuracy, Drop, Direction]
        (Object/array) Target: Object or Position
        (String) Type: Bomb-Type 					(optional) (Default: HE)
        (Bool) Track: follow target					(optional) (Default: false)
        (int) Drop: How many bombs to drop  		(optional) (Default: 1)            (same target) (HE no more than 4)
        (int) Inaccuracy: Inaccuracy in meters		(optional) (Default: 0)            (if tracking this will not apply)
        (int) Direction: degrees from north         (optional) (Default: random 360)
        (string) Plane: className                   (optional) (Default: "B_Plane_CAS_01_dynamicLoadout_F";) <- Vanilla A10

    Function: Launches a plane at target and drops LGB's

    return: nil

    Execution: Unscheduled

    Example use: [cursorObject, "HE", true, 1, 0, 270] execVM "precisionAirstrike.sqf"; //sends a airstrike with a single gbu-12 to the cursorTarget from the east
*/

params ["_target", ["_bombType", "HE"], ["_track", false], ["_dropCount", 1], ["_inaccuracy", 0], ["_dir", random 360], ["_planeType", "B_Plane_CAS_01_dynamicLoadout_F"]];
if (isNil "_target") exitWith {diag_Log "| Precition Airstrike | Nil object/position input"};

//select bomb type
private ["_pylon", "_bomb", "_flyHight", "_engagementDist"];
_engagementDist = 400;
_dropInterval = 1;
switch (_bombType) do {
    Case "HE": {_pylon = "PylonMissile_1Rnd_Bomb_04_F"; _bomb = "Bomb_04_Plane_CAS_01_F"; _flyHight = 150};
    Case "Cluster": {_pylon = "PylonMissile_1Rnd_BombCluster_01_F"; _bomb = "BombCluster_01_F"; _flyHight = 200; _inaccuracy = _inaccuracy*3; ; _engagementDist = 325};
    Case "AT": {_pylon = "PylonRack_1Rnd_LG_scalpel"; _bomb = "missiles_SCALPEL"; _flyHight = 150; ; _engagementDist = 800};
    Case "Dumb": {_pylon = "PylonMissile_1Rnd_Mk82_F"; _bomb = "Mk82BombLauncher"; _flyHight = 150; _engagementDist = 615; _dropInterval =0.35};
    Default {_pylon = "PylonMissile_1Rnd_Bomb_04_F"; _bomb = "Bomb_04_Plane_CAS_01_F"; _flyHight = 150};
};

//geting target position
private _pos = _target getPos [random _inaccuracy, random 360];
private _laseTarget = if (_track) then {_target} else {[_pos select 0, _pos select 1, 0]};

//spawn plane
private _planePos = _pos getPos [4000, _dir + 180];
private _planefn = [_planePos, _dir, _planeType, west] call bis_fnc_spawnvehicle;
private _plane = _planefn select 0;
private _planeCrew = _planefn select 1;
{_x disableAI "AUTOTARGET"; _x disableAI "TARGET"}forEach _planeCrew;
private _groupPlane = _planefn select 2;

//orient get it flying and set its loadout
_plane setDir (_plane getRelDir _pos);
_plane setPos (_planePos vectorAdd [0,0,_flyHight]);
_plane setVelocityModelSpace (velocityModelSpace _plane vectorAdd [0, 150, 50]);
_plane flyInHeight _flyHight;
_posASL = AGLToASL _pos;
_plane flyInHeightASL [(_posASL select 2) + _flyHight, (_posASL select 2) + _flyHight, (_posASL select 2) + _flyHight];

//set pylon loadout
private _pylonsCfg = (configFile >> "CfgVehicles" >> _planeType >> "Components" >> "TransportPylonsComponent");
{
    private _attachement = getArray (_x >> "attachment");
    private _loadoutMags = _attachement apply { getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") };
    {
        _plane removeWeaponTurret [_x, [-1]];
        _plane removeWeaponTurret [_x, [0]];
    } forEach _loadoutMags;
} forEach (configProperties [(_pylonsCfg >> "Presets")]);

_pylons = "true" configClasses (_pylonsCfg >> "Pylons");
{
    if ("pylon" in toLower configName _x) then {
        _plane setPylonLoadout [_forEachIndex +1, _pylon, true];
    };
} forEach _pylons;

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
private _fp = _pos getPos [4000, _dir];
_fp = _fp vectorAdd [0,0,150];

//set waypoints
private _wp1 = group _plane addWaypoint [_dp, 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed "LIMITED";
_wp1 setWaypointBehaviour "CARELESS";
_plane setCollisionLight true;
private _wp3 = group _plane addWaypoint [_fp, 0];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed "FULL";

if (_track) then {
    [_wp1, _laseTarget, _plane, _flyHight] spawn {
        params ["_wp", "_laseTarget", "_plane", "_flyHight"];
        while {sleep 1; (_plane distance2D _laseTarget > 800)} do {
            _pos = if (_laseTarget isEqualType []) then {_laseTarget} else {getPos _laseTarget};
            _pos = [_pos select 0, _pos select 1, _flyHight];
            _wp setWaypointPosition [_pos, 0];
        };
    };
};

//wait to fire
waitUntil {_plane distance2D _laseTarget < _engagementDist};
private _lasePoint = laserTarget _designator;
for "_i" from 1 to _dropCount do {
    _plane fireAtTarget [_lasePoint,_bomb];
    sleep _dropInterval;
};

//cleanUp
private _timeOut = time + 300;
waitUntil {(currentWaypoint (group _plane) == 3) or (time > _timeOut)};
{deleteVehicle _x} forEach crew _plane;
{deleteVehicle _x} forEach units _desGroup;
deleteVehicle _plane;
deleteVehicle _designator;
