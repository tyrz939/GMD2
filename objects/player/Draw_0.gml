var dx = round(x)
var dy = round(y)
var subImg = floor(aniSubimage + 0.01)

if overlayDraw {
	shader_set(sh_color_overlay);
	scr_shader_set_color(overlayColor, overlayAlpha);
	//draw_sprite_ext(playerSprite, subImg, dx, dy, 1, 1, 0, c_white, image_alpha)
	draw_image_ext(game.playerSprite, subImg, dx, dy, 1, 1, 0, c_white, image_alpha)
	shader_reset();
} else {
	//draw_sprite_ext(playerSprite, subImg, dx, dy, 1, 1, 0, c_white, image_alpha)
	draw_image_ext(game.playerSprite, subImg, dx, dy, 1, 1, 0, c_white, image_alpha)
}