params ["_i", ["_n", 24]];
private _c = 0;
private _o = [];
{
  _c = _c + count _x;
  if (_c > _n) then {_o pushBack "<br/>"; _c = count _x};
  _o pushBack _x;
} forEach (_i splitString " ");
if ((_o#0) isEqualTo "<br/>") then {_o deleteAt 0};
parseText (_o joinString " ");
