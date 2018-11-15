// Animation
if aniFrames > 1 {
	subimage += aniSpeed / 60
	if subimage >= aniStart + aniFrames {subimage = aniStart}
}

timerStep++

var destroy = true
if timerStep <= aniTime {
	image_xscale	+= aniSpeed * aniFinalScale
}

for(var i = 0; i < ds_grid_height(grid); i++) {
	if grid[# 1, i] > 0 {
		grid[# 1, i]--
		destroy = false
	}
	if grid[# 1, i] == 0 {
		instance_activate_object(grid[# 0, i])
		visibleCount = true
	}
}

if destroy {instance_destroy()}

if visibleCount				{visibleCountdown--}
if visibleCountdown == 0	{visible = false}