if gpu_get_blendmode() != blendType {gpu_set_blendmode(blendType)}
draw_image_ext(sprite, subimage, round(x), round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha)