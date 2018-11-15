	image_system_cleanup()
	live_cleanup()
	surface_free(surface3d)
	part_system_clear(global.partSys);

	ds_grid_destroy(shotCreateGrid)

	ds_grid_destroy(scene3d)
	camera_destroy(camera)

	ds_grid_destroy(bulletRemover)

// Loaded Asset Stuffs
	ds_grid_destroy(importGrid)

// Loaded Sound Cleanup
	for(var i = 0; i < ds_grid_height(soundGrid); i++) {
		audio_free_buffer_sound(soundGrid[# 1, i])
		buffer_delete(soundGrid[# 0, i])
	}
	ds_grid_destroy(soundGrid)

// FMOD Cleanup
	FMODGMS_Chan_StopChannel(channel[0]);
	for(var i = 0; i < ds_grid_height(bgmGrid); i++) {
		FMODGMS_Snd_Unload(bgmGrid[# 0, i]);
	}
	FMODGMS_Chan_RemoveChannel(channel[0]);
	ds_grid_destroy(bgmGrid)

// Font Cleanup
	for(var i = 0; i < ds_grid_height(fontGrid); i++) {
		font_delete(fontGrid[# 0, i])
		if fontGrid[# 2, i] != -1 {
			sprite_delete(fontGrid[# 2, i])
		}
	}
	ds_grid_destroy(fontGrid)