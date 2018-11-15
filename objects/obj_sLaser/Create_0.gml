image_speed = 0
autoDelete = true
deleteType = 0
deleteParent = noone
deleteResist = 1
checkCollision = true

grazeAdd = 0.05
spd = 0

_length = global.__LaserLength
_width = global.__LaserWidth
_duration = global.__LaserDuration

direction = global.__shotDirection

sprite = global.__shotSpriteIndex
subimage = global.__shotImageIndex
shotColor = global.__shotColor
shotType = global.__shotType
aniFrames = global.__ShotAniFrames
aniSpeed = global.__ShotAniSpeed
aniStart = subimage

hitType = global.__shotHitType
hitRadius = global.__shotHitRadius
hitHeight = (_length * global.__shotHitHeight) / 2
timerSpawn = 0
timerStep = 0
blendType = bm_add
alphaMultiplier = 1

spriteHeight = image_get_height(sprite)
spriteWidth = image_get_width(sprite)

delay = global.__shotDelay

// Expanding the laser
aniSpeed = 0.05
aniFinalScale = _width / spriteWidth
aniInScaleSteps = aniFinalScale * aniSpeed
// Expanding the hitbox
hitWidth = 0
hitWidthSteps = ((global.__shotHitWidth * _width) * aniSpeed) / 2

// Spawn point sprite
_spawnSprite = global.__LaserSpawnSprite
_spawnSubimage = global.__LaserSpawnSubimage
_spawnAngle = 0

_spawnScale = 48 / image_get_height(_spawnSprite)
_spawnAlpha = 0
if delay > 0 {
	_spawnAlphaStep = 1/delay
} else {
	_spawnAlphaStep = 1
}


__amountLeft = 1

if delay > 0 {
	image_alpha = 1
	image_xscale = 0
	image_yscale = _length / spriteHeight
}