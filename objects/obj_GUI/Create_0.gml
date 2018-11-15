/*enum guiGrid_t {
	TYPE,
	X,
	Y,
	COLOR,
	LENGTH
}*/
enum guiGrid_t {
	TEXT,
	VARIABLE,
	IMAGE,
	IMAGE_ROW,
	SET_FONT,
	SET_HALIGN,
	SET_VALIGN,
	SET_COLOR,
	SET_ALPHA,
	LENGTH
}

guiGrid = ds_grid_create(17, 0)
guiGrid[# 0, 0] = -1
gridIterator = -1

anchX = 0
anchY = 0

wide = 0
narrow = 1

guiType = wide

bgCol1 = make_color_rgb(25, 0, 25)
bgCol2 = c_blue
	