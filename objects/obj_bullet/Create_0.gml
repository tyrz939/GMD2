image_speed = 0
autoDelete = true
deleteType = 0
deleteParent = noone
deleteResist = 0
checkCollision = true

grazeAdd = 0.05

shotType = global.__shotType

spd = global.__shotSpeed
direction = global.__shotDirection

sprite = global.__shotSpriteIndex
subimage = global.__shotImageIndex
shotColor = global.__shotColor
aniFrames = global.__ShotAniFrames
aniSpeed = global.__ShotAniSpeed
aniStart = subimage

hitType = global.__shotHitType
hitRadius = global.__shotHitRadius
hitWidth = global.__shotHitWidth
hitHeight = global.__shotHitHeight

drawRotated = global.__shotDrawRotated
drawRounded = global.__shotDrawRounded
blendType = bm_normal
alphaMultiplier = 1

// 0 = no, 1 = accelerating, 2 = decelerating
accelState = 0
accelStepSpeed = 0
accelDelay = 0

timerSpawn = 0
timerStep = 0
delay = global.__shotDelay
delayScale = 2.5
delayAlphaDiff = 0.75

__amountLeft = 1

if delay > 0 {
	image_alpha = 1 - delayAlphaDiff
	image_xscale = delayScale
	image_yscale = delayScale
}
directionS = 0
directionP = 0