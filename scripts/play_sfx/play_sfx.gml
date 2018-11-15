/// @function play_sfx(Sound, Overlap)
/// @description Play SFX
/// @param {real} sound_id
/// @param {real} overlap


if global.sfx_vol > 0 && global.prevSfx != argument0 {
    if !argument1 {
        audio_stop_sound(argument0);
    }
	audio_play_sound(argument0, 1, false);
}

global.prevSfx = argument0