menuLength = 25
var file
enum replyMenu_t {
	DATE,
	TIME,
	SCORE,
	DIFF,
	CHAR,
	SDIR,
	SFIL,
	NAME,
	DESC,
	AUTH
}

menuGrid = ds_grid_create(10, menuLength)
menu = array_create(menuLength, "")
var spacing = "  ", _file
for(var i = 0; i < menuLength; i++) {
	menuGrid[# 0, i] = string(i+1) + ":"
	_file = replayNameGen(i)
	if file_exists_ns(_file) {
		replayLoad(i, 1)
	} else {
		var a1 = 0
		menuGrid[# replyMenu_t.DATE, i] = "__/__/____" // Date
		menuGrid[# replyMenu_t.TIME, i] = "__:__" // Time
		menuGrid[# replyMenu_t.DIFF, i] = -1 // Difficulty
		menuGrid[# replyMenu_t.CHAR, i] = -1 // Character
		menuGrid[# replyMenu_t.SDIR, i] = a1 // Script Directory
		menuGrid[# replyMenu_t.SFIL, i] = a1 // Script File
		menuGrid[# replyMenu_t.NAME, i] = "____________________" // Name
		menuGrid[# replyMenu_t.DESC, i] = a1 // Desc
		menuGrid[# replyMenu_t.AUTH, i] = "____________________" // Auth
		menuGrid[# replyMenu_t.SCORE, i]= -1
	}
	// Create the string that is drawn on the screen for each menu line
	menu[i] += menuGrid[# replyMenu_t.DATE, i] + spacing
	menu[i] += menuGrid[# replyMenu_t.TIME, i] + spacing
	switch menuGrid[# replyMenu_t.DIFF, i] {
		case 0: menu[i] += stringSpacesAfter("Easy", 7);	break
		case 1: menu[i] += stringSpacesAfter("Normal", 7);	break
		case 2: menu[i] += stringSpacesAfter("Hard", 7);	break
		case 3: menu[i] += stringSpacesAfter("Lunatic", 7);	break
		case 4: menu[i] += stringSpacesAfter("Extra", 7);	break
		default: menu[i] += stringSpacesAfter("_______", 7);
	}
	menu[i] += spacing
	switch menuGrid[# replyMenu_t.CHAR, i] {
		case 0: menu[i] += stringSpacesAfter("Reimu Hakurei", 20); break
		case 10: menu[i] += stringSpacesAfter("Marisa Kirisame", 20); break
		default: menu[i] += "____________________";
	}
	menu[i] += spacing
	menu[i] += spacing
	menu[i] += "Script: " + stringSpacesAfter(menuGrid[# replyMenu_t.NAME, i], 20)
	menu[i] += spacing
	menu[i] += "Score: "
	switch menuGrid[# replyMenu_t.SCORE, i] {
		case -1: menu[i] += "____________________"; break
		default: menu[i] += stringSpacesAfter(string_insert_comma(menuGrid[# replyMenu_t.SCORE, i]), 20);
	}
	
}

// For flashy selection
alpha = 1;
alpha_dir = 0;

push = 0;
space = 30;
mpos = 0;
gray = array_create(menuLength, false)

if room = rm_game {
	depth = -11000
}