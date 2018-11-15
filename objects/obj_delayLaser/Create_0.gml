image_speed = 0

_length = global.__LaserLength
_width = global.__LaserWidth

shotType = global.__shotType

sprite = global.__shotSpriteIndex
subimage = global.__shotImageIndex
aniFrames = global.__ShotAniFrames
aniSpeed = global.__ShotAniSpeed
aniStart = subimage

timerStep = 0
visibleCountdown = 15
visibleCount = false

blendType = bm_add
alphaMultiplier = 1

spriteHeight = image_get_height(sprite)
spriteWidth = image_get_width(sprite)

// Expanding the laser
aniTime = 5
aniSpeed = 1/aniTime
aniFinalScale = _width / spriteWidth
aniInScaleSteps = aniFinalScale * aniSpeed

__amountLeft = 1

image_alpha = 1
image_xscale = 0
image_yscale = _length / spriteHeight

// Grid
grid = ds_grid_create(2, 1)
lasers = ds_grid_create(3, 1)