if gpu_get_blendmode() != bm_normal {gpu_set_blendmode(bm_normal)}

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(font_pup)
if y > 0 -8 {
	//draw_sprite_ext(spr_pickup, pickupType, round(x), round(y), 1, 1, image_angle, c_white, 1)
	draw_sprite_ext(spr_powerup_bg, 0, round(x), round(y), image_xscale, image_yscale, bgRotation, image_blend, 0.3 * image_alpha)
	draw_sprite_ext(spr_powerup, 0, round(x), round(y), image_xscale, image_yscale, 0, image_blend, 1 * image_alpha)
	draw_text(round(x), round(y), char)
} else {
	//draw_sprite(spr_pickupArrow, pickupType, round(x), 0)
	draw_sprite(spr_Pabove, 0, round(x), 0)
	draw_text(round(x), 5, char)
}