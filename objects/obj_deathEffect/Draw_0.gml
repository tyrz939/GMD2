var dist = 30
var duration = 60
var finalSize = 600
if !game.pause {
	deathEffectRadius += finalSize / duration
	if deathEffectTimer > duration/2 {
		deathEffectRadius2 += finalSize / (duration / 2)
	}
	deathEffectTimer++
}
	
gpu_set_blendmode_ext(bm_inv_dest_color, bm_src_alpha_sat)
draw_circle(deathEffectX + lengthdir_x(dist, 0), deathEffectY + lengthdir_y(dist, 0), deathEffectRadius, false)
draw_circle(deathEffectX + lengthdir_x(dist, 90), deathEffectY + lengthdir_y(dist, 90), deathEffectRadius, false)
draw_circle(deathEffectX + lengthdir_x(dist, 180), deathEffectY + lengthdir_y(dist, 180), deathEffectRadius, false)
draw_circle(deathEffectX + lengthdir_x(dist, 270), deathEffectY + lengthdir_y(dist, 270), deathEffectRadius, false)
	
draw_circle(deathEffectX, deathEffectY, deathEffectRadius * 1.4, false)
if deathEffectRadius2 > 0 {
	draw_circle(deathEffectX, deathEffectY, deathEffectRadius2, false)
}
gpu_set_blendmode(bm_normal);
	
if deathEffectTimer == duration {
	instance_destroy()
}