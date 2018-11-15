/// @function play_bgm(Music)
/// @description Play SFX
/// @param {real} sound_id
/// @param {real} channel_id
/// @param {real} loop

var snd = game.bgmGrid[# 0, argument0]
var vol = game.bgmGrid[# 1, argument0]

if global.music_vol > 0 {
	FMODGMS_Chan_StopChannel(game.channel[argument1]);
	FMODGMS_Snd_Set_LoopMode(snd, argument2, -1);
	FMODGMS_Snd_PlaySound(snd, game.channel[argument1]);
	FMODGMS_Chan_Set_Volume(0, vol * global.music_vol);
	game.music_current = argument0
}

with obj_fadeBGM {instance_destroy()}