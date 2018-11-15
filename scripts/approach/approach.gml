/// @description  approach(value, target, delta)
/// @function  approach
/// @param value
/// @param  target
/// @param  delta
var v = argument0, t = argument1, d = argument2;
if (v < t) {
    v += d; if (v < t) return v; else return t;
} else {
    v -= d; if (v > t) return v; else return t;
}

