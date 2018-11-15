/// @function GUIDrawRow
/// @description GUIDrawRow
/// @param {real} x
/// @param {real} y
/// @param {real} number
/// @param {real} max
/// @param {real} imagePerRow
/// @param {real} Separation
/// @param {real} image1
/// @param {real} subimage1
/// @param {real} image2
/// @param {real} subimage2

var xa = argument0, ya = argument1, num = argument2, numMax = argument3, pr = argument4, sep = argument5,
	img1 = argument6, sub1 = argument7, img2 = argument8, sub2 = argument9

if is_string(num) {num = GUIConvertVariable(num)}

for(var i = numMax-1; i >= 0; i--) {
	if i < num	{draw_image(img1, sub1, xa + (i*sep), ya)}
	else		{draw_image(img2, sub2, xa + (i*sep), ya)}
}