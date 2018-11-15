if gpu_get_blendmode() != bm_normal {gpu_set_blendmode(bm_normal)}
if instance_exists(player) {
	if player.spriteHitboxSize != 0.5 {
		var dx = round(player.x)
		var dy = round(player.y)
		draw_image_ext(game.hitboxSprite, 0, dx, dy, player.spriteHitboxSize, player.spriteHitboxSize, player.spriteHitboxDir, c_white, player.spriteHitboxSize)
		draw_image_ext(game.hitboxSprite, 0, dx, dy, player.spriteHitboxSize, player.spriteHitboxSize, -player.spriteHitboxDir, c_white, player.spriteHitboxSize)
	}
}