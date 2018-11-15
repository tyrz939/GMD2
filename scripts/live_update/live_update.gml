/// @description  live_update()
/// @function  live_update
var last_hash = live_hash;
if (file_exists(live_path)) {
    live_hash = sha1_file(live_path);
} else {
    println("Couldn't find " + live_path + ".");
    live_hash = "";
}
if (live_hash != last_hash) {
    if (live_hash != "") lua_add_file(live_state, live_path);
    var t = date_time_string(date_current_datetime());
    println("[" + t + "] Loaded " + live_path);
} else {
    var t = date_time_string(date_current_datetime());
    println("[" + t + "] No Changes to " + live_path);
}
