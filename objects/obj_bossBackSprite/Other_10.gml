with obj_boss {
	if image_exists(backSprite) {
		// Scale
		backSpriteScaleDir += backSpriteScaleSpeed
		// Rotation
		backSpriteRotationDir += backSpriteRotationSpeed
	}
	other.visible = visible
}