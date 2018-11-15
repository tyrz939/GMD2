with obj_boss {
	if image_exists(backSprite) {
		// Scale
		var _dist = (backSpriteMaxScale - backSpriteMinScale) / 2
		var _scale = backSpriteMinScale + _dist + lengthdir_x(_dist, backSpriteScaleDir)
		// Draw
		draw_image_ext(backSprite, 0, round(x), round(y), _scale, _scale, backSpriteRotationDir, c_white, backSpriteAlpha)
	}
}