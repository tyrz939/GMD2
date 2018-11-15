vol -= oldVol / duration
var newVol = vol
with game {
	FMODGMS_Chan_Set_Volume(0, newVol * global.music_vol)
}

timer++
if timer >= duration {instance_destroy()}