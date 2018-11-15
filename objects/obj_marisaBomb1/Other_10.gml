timer++

if timer % 15 == 0 {
	player.overlayAlpha = 0.5
	player.overlayColor = c_blue
	player.overlayDraw = true
}
if (timer + 3) % 15 == 0 {
	player.overlayDraw = false
}

if timer < duration {
	if image_xscale < 1 {image_xscale += 0.1}
	if image_alpha < 1 {image_alpha += 0.01}
	
	if image_alpha == 1 {
		
	}
} else {
	if image_alpha > 0 {image_xscale -= 0.1; image_alpha -= 0.1;}
	else {instance_destroy()}
}
x = player.x
y = player.y

if deleteShotExists(dc) {
	deleteShotSetXY(dc, x + lengthdir_x(64, direction), y + lengthdir_y(64, direction))
}
if deleteShotExists(dr) {
	deleteShotSetXY(dr, x + lengthdir_x(364, direction), y + lengthdir_y(364, direction))
	deleteShotSetAngle(dr, direction)
}


for(var i = 0; i < 4; i++) {
	pulses[i] += pulseSpd
	if pulses[i] > 864 {
		pulses[i] -= 864
	}
}

image_angle = direction

// Collision
enemyCollisionCircle(x, y, 128, damage)
enemyCollisionRectangle(x + lengthdir_x(364, direction), y + lengthdir_y(364, direction), 256, 128, direction, damage)

// Direction
direction = -point_direction(x, 0, xstart, -500) + 180