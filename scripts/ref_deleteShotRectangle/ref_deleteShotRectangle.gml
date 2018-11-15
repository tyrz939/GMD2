/// @function deleteShotRectangle
/// @description Shot Deleter
/// @param {real} x
/// @param {real} y
/// @param {real} width
/// @param {real} height
/// @param {real} [opt]timer
/// @param {real} [opt]deleteType
/// @param {real} [opt]typeOfBullets
/// @param {real} [opt]colorOfBullets
/// @param {real} [opt]parentObjectID
var __ac = argument_count
if !in_range(__ac, 4, 9) return lua_show_error("DeleteShotRectangle: Expected 4-9 arguments, got " + string(__ac));

if __ac == 4 {
	return deleteShotRectangle(argument[0], argument[1], argument[2], argument[3]);
} else if __ac == 5 {
	return deleteShotRectangle(argument[0], argument[1], argument[2], argument[3], argument[4]);
} else if __ac == 6 {
	return deleteShotRectangle(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5]);
} else if __ac == 7 {
	return deleteShotRectangle(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6]);
} else if __ac == 8 {
	return deleteShotRectangle(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]);
} else if __ac == 9 {
	return deleteShotRectangle(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]);
}