if gpu_get_blendmode() != blendType {gpu_set_blendmode(blendType)}
draw_image_ext(player.playerOrbs, player.playerOrbSubimage, round(x), round(y), 1.3, 1.3, -image_angle, c_white, 0.5)
draw_image_ext(player.playerOrbs, player.playerOrbSubimage, round(x), round(y), 1, 1, image_angle, c_white, 1)