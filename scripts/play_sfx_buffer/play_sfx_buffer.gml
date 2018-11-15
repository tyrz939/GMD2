/// @function play_sfx(gridPosition, Overlap)
/// @description only used in game for imported wav files
/// @param {real} gridPosition
/// @param {real} overlap

var snd = game.soundGrid[# 1, argument0]
var vol = game.soundGrid[# 2, argument0]

if global.sfx_vol > 0 && global.prevSfx != snd {
    if !argument1 {
        audio_stop_sound(snd);
    }
	var s = audio_play_sound(snd, 1, false);
	audio_sound_gain(s, vol * global.sfx_vol, 0)
}

global.prevSfx = argument0