/// @description Game Init
scr_load();

window_set_cursor(cr_none);
room_width = global.res_x
room_height = global.res_y
surface_resize(application_surface, global.res_x, global.res_y)
window_set_size(global.window_width, global.window_height)
display_reset(0, global.vsync);
window_set_fullscreen(global.fullscreen);

random_set_seed(current_time);
show_debug_overlay(global.debug);

global.term = false;

global.replay = false
global.replayToLoad = -1

global.font_MainMenu = font_add_sprite_ext( spr_fontMenu, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.,;:?!-_~#'&()[]|`/@°+=*$<>% ", true, 1 );

audio_group_load(SFX);

if !(FMODGMS_Util_Handshake() == "FMODGMS is working.") {
    show_message_async("Error! FMODGMS was not loaded prorperly.");
}
FMODGMS_Sys_Create();
FMODGMS_Sys_Initialize(32);