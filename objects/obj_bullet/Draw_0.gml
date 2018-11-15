if gpu_get_blendmode() != blendType {gpu_set_blendmode(blendType)}

var _xd, _yd
if drawRounded	{_xd = round(x); _yd = round(y);}
else			{_xd = x; _yd = y;}

if drawRotated >= 0 {
	draw_image_ext(sprite, subimage, _xd, _yd, image_xscale, image_yscale, direction+drawRotated, image_blend, image_alpha * alphaMultiplier)
} else {
	draw_image_ext(sprite, subimage, _xd, _yd, image_xscale, image_yscale, 0, image_blend, image_alpha * alphaMultiplier)
}