/// @description  in_range
/// @function  in_range
/// @param  Check
/// @param  Min
/// @param  Max
gml_pragma("forceinline")

if argument0 >= argument1 && argument0 <= argument2 {return true}
return false