/// @function deleteShotCircle
/// @description Shot Deleter
/// @param {real} x
/// @param {real} y
/// @param {real} radius
/// @param {real} [opt]timer
/// @param {real} [opt]deleteType
/// @param {real} [opt]typeOfBullets
/// @param {real} [opt]colorOfBullets
/// @param {real} [opt]parentObjectID
var __ac = argument_count
if !in_range(__ac, 3, 8) return lua_show_error("DeleteShotCircle: Expected 3-8 arguments, got " + string(__ac));

if __ac == 3 {
	return deleteShotCircle(argument[0], argument[1], argument[2]);
} else if __ac == 4 {
	return deleteShotCircle(argument[0], argument[1], argument[2], argument[3]);
} else if __ac == 5 {
	return deleteShotCircle(argument[0], argument[1], argument[2], argument[3], argument[4]);
} else if __ac == 6 {
	return deleteShotCircle(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5]);
} else if __ac == 7 {
	return deleteShotCircle(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6]);
} else if __ac == 8 {
	return deleteShotCircle(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]);
}