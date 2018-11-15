/// @description list_files( path )
/// @function list_files
/// @param path
/// @param type

var _path = working_directory + argument0 + "/"

if directory_exists_ns(_path) {
	var _o = 0
	var _array = ""
	file_find_first_ns(_path + "*.*")
	file_find_next_ns()
	var _folder
	var _e = true
	while _e {
		_folder = file_find_next_ns()
		if _folder != "" {
			if (file_find_attributes_ns() & argument1) {
				_array[_o] = _folder
				_o++
			}
		} else {
			_e = false
		}
	}
	if is_array(_array) {
		return(_array)
	} else {
		return(false)
	}
} else {
	show_message("Path '" + _path + "' doesn't exist.")
	return(false)
}