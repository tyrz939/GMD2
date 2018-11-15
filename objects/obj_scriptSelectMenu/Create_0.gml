surf = noone
w = 800
h = 200

scripts = ""
var scriptFolder = "scripts/"
var _scriptList = list_files_type(scriptFolder, fa_directory)
var _f
var _n = 0
if is_array(_scriptList) {
	for(var _i = 0; _i < array_length_1d(_scriptList); _i++) {
		_f = scriptFolder + _scriptList[_i] + "/init.txt"
		if file_exists_ns(_f) {
			scripts[_n] = scriptFolder + _scriptList[_i]
			_n++
		}
	}
}

if is_array(scripts) {
	gray = array_create(array_length_1d(scripts), false)
	for(var i = 0; i < array_length_1d(scripts); i++) {
		menu[i] = "No Title"
		desc[i] = "No Description"
		auth[i] = "Not Listed"
		sfile[i] = ""
		scr_loadInitMenu(scripts[i], i)
		// TODO: check if script is valid
	}
	space = 300;
	mpos = 0;
	x = 0;
	y = 0;
	y_target = 0
	
	image_system_init()
	image_group_create("main")
	image_stream_start("main", 512, 512, 0)
	var i, file
	img = array_create(array_length_1d(menu), spr_thumbnailMissing)
	is_img = array_create(array_length_1d(menu), false)
	for (i = 0; i < array_length_1d(menu); i++) {
		file = scripts[i] + "/thumbnail.png"
		if file_exists(file) {
			image_stream_add("main", "img", file, 1, 96, 96)
			is_img[i] = true
		}
	}
	image_stream_finish("main")
	for (i = 0; i < array_length_1d(menu); i++) {
		if is_img[i] {
			img[i] = image_group_find_image( "main" , "img")
		}
	}
} else {
	menu[0] = "NO SCRIPTS!!!! TURN BACK NOW WHILE YOU STILL CAN"
	gray[0] = false
}
