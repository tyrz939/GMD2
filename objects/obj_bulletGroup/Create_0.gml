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
accelFinalSpeed = 0
accelTime = 0

timerSpawn = 0
timerStep = 0
delay = global.__shotDelay
delayScale = 2.5
delayAlphaDiff = 0.75

if delay > 0 {
	image_alpha = 1 - delayAlphaDiff
	image_xscale = delayScale
	image_yscale = delayScale
}

// Creating the grid
__xx = 0
__yy = 1
__dir = 2
__spd = 3
__alive = 4
__accelState = 5
__accelStepSpeed = 6
__accelDelay = 7
__accelFinalSpeed = 8
__accelTime = 9

__amount = global.__shotGroupAmount
__amountLeft = __amount

grid = ds_grid_create(10, __amount)
// Init
var d
for(var i = 0; i < __amount; i++) {
	switch global.__shotGroupType{
		case shotGroupType.circle:	d = direction + (360 / __amount) * i;						break;
		case shotGroupType.arc:		d = direction + (global.__shotGroupSpread / __amount) * i;	break;
	}
	grid[# __xx, i] = x + lengthdir_x(global.__shotGroupDistFromCenter, d)
	grid[# __yy, i] = y + lengthdir_y(global.__shotGroupDistFromCenter, d)
	grid[# __dir, i] = d
	grid[# __spd, i] = spd
	grid[# __alive, i] = true
	grid[# __accelState, i] = accelState
	grid[# __accelStepSpeed, i] = accelStepSpeed
	grid[# __accelDelay, i] = accelDelay
	grid[# __accelFinalSpeed, i] = accelFinalSpeed
	grid[# __accelTime, i] = accelTime
}
directionS = 0
directionP = 0