/// @function LoadQueueAddSpriteExtFont
/// @description LoadQueueAddSpriteExtFont
/// @param {real} file
/// @param {real} stringMap
/// @param {real} proportional
/// @param {real} spacing
/// @param {real} width
/// @param {real} height
/// @param {real} subImagesPerRow
/// @param {real} numberOfSubImages
/// @param {real} tag

var file = argument0, stringMap = argument1, prop = argument2, space = argument3,
	width = argument4, height = argument5, imgPerRow = argument6, amount = argument7, tag = argument8

var spr = fontSpriteSplit(file, width, height, imgPerRow, amount)

var fnt = font_add_sprite_ext(spr, stringMap, prop, space)

var _i = ds_grid_height(fontGrid)
ds_grid_resize(fontGrid, ds_grid_width(fontGrid), _i+1)
fontGrid[# 0, _i] = fnt
fontGrid[# 1, _i] = tag
fontGrid[# 2, _i] = spr