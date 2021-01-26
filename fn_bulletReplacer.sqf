player addEventHandler ["Fired", {
    private _bullet = param [6, objNull];
    private _dir = vectorDir _bullet;
    private _up = vectorUp _bullet;
    private _vel = velocity _bullet;
    [_bullet,_dir,_up,_vel] spawn {
        params ["_bullet", "_dir", "_up", "_vel"];
        sleep 0.2;
        private _veh = "" createVehicle [0,0,0]; //put classname of what you want to have spawned here
        _veh setVectorDirAndUp [_dir, _up];
        _veh attachTo [_bullet, [0,0,0]];
        deleteVehicle _bullet;
        _veh setVelocity _vel;
    };
}];
