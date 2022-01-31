private _missions = "'Antistasi_' in configName _x" configClasses (configFile/"CfgMissions"/"MPmissions");

private _proccessMapInfo = {
    private _worldName = (configName _this) select [10, count configName _this];
    private _mapInfo = compile preprocessFileLineNumbers (getText (_this/"directory") + "\mapInfo.sqf");

    private _mapInfoData = [];
    _mapInfoData pushBack (["population"] call _mapInfo);
    _mapInfoData pushBack (["antennas"] call _mapInfo);
    _mapInfoData pushBack (["bank"] call _mapInfo);
    _mapInfoData pushBack (["garrison"] call _mapInfo);
    _mapInfoData pushBack (["fuelStationTypes"] call _mapInfo);
    _mapInfoData pushBack (["climate"] call _mapInfo);

    private _cfgArrayConvert = {
        params [ ["_array", [], [[]]] ];
        private _t = str _array;
        private _o = "";

        for "_i" from 0 to count _t do {
            if ((_t select [_i,1]) isEqualTo "[") then {_o = _o + "{"; continue};
            if ((_t select [_i,1]) isEqualTo "]") then {_o = _o + "}"; continue};
            _o = _o + (_t select [_i,1]);
        };
        _o;
    };

    text ("Class "+ _worldName +" {
population[] = "+([(_mapInfoData#0#0)] call _cfgArrayConvert)+";
disabledTowns[] = "+([(_mapInfoData#0#1)] call _cfgArrayConvert)+";
antennas[] = "+([(_mapInfoData#1#0)] call _cfgArrayConvert)+";
antennasBlacklistIndex[] = "+([(_mapInfoData#1#1)] call _cfgArrayConvert)+";
banks[] = "+([(_mapInfoData#2#0)] call _cfgArrayConvert)+";
garrison[] = "+([(_mapInfoData#3)] call _cfgArrayConvert)+";
fuelStationTypes[] = "+([(_mapInfoData#4#0)] call _cfgArrayConvert)+";
climate = "+str (_mapInfoData#5)+";};");

};

_missions apply { _X call _proccessMapInfo };
