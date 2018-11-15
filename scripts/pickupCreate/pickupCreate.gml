/// @function pickupCreate
/// @description pickupCreate
/// @param {real} x
/// @param {real} y
/// @param {real} Type

global.__pickupType = argument2

return instance_create_depth(argument0, argument1, PICKUP_DEPTH, obj_pickup)