var s = argument0;

println("[" + date_time_string(date_current_datetime()) + "] LUA: " + s);
lua_add_code(live_state, s);