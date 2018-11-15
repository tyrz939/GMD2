timer++
direction += 5
x = player.x
y = player.y
if image_alpha < 1 {image_alpha += 0.2}
if timer == maxDuration {instance_destroy(); exit;}
radius = EaseOutQuad(timer, 0, 100, 120)

var x_prev, y_prev, angle, inst
for( var i = 0; i < amount; i++) {
	if bomb[i, ALIVE] && timer == maxDuration-1 {bomb[i, STATE] = 2}
	
	// Damage etc
	if deleteShotExists(bomb[i, BD]) {
		if bomb[i, ALIVE] {
			enemyCollisionCircle(bomb[i, X], bomb[i, Y], 48, damage)
		} else {
			deleteShotDelete(bomb[i, BD])
		}
	}
	
	switch bomb[i, STATE] {
		case 0:
			bomb[i, DIR] = (360/amount) * i + direction
			x_prev = bomb[i, X]
			y_prev = bomb[i, Y]
			bomb[i, X] = x + lengthdir_x(radius, bomb[i, DIR])
			bomb[i, Y] = y + lengthdir_y(radius, bomb[i, DIR])
			
			bomb[i, SPD] = point_distance(x_prev, y_prev, bomb[i, X], bomb[i, Y])
			bomb[i, DIR] = point_direction(x_prev, y_prev, bomb[i, X], bomb[i, Y])
			if timer == bomb[i, CHANGE] {
				bomb[i, CHANGE] = 0
				bomb[i, STATE]++
			}
			deleteShotSetXY(bomb[i, BD], bomb[i, X], bomb[i, Y])
			break
		case 1:
			inst = instance_nearest(bomb[i, X], bomb[i, Y], obj_enemy)
			if inst != noone {
				angle = point_direction(bomb[i, X], bomb[i, Y], inst.x, inst.y)
				bomb[i, SPD] = ((abs(angle_difference(bomb[i, DIR], angle) - 180)) / 180) * 2 + 2
				if enemyCollisionCircle(bomb[i, X], bomb[i, Y], 48, 0) {
					bomb[i, CHANGE]++
					if bomb[i, CHANGE] > 60 {
						bomb[i, STATE]++
					}
				}
			} else {
				angle = (360/amount) * i + direction
			}
			bomb[i, DIR] = turn_smooth(bomb[i, DIR], angle, 4)
			bomb[i, X] += lengthdir_x(bomb[i, SPD], bomb[i, DIR])
			bomb[i, Y] += lengthdir_y(bomb[i, SPD], bomb[i, DIR])
			if timer == maxDuration {
				bomb[i, STATE]++
			}
			deleteShotSetXY(bomb[i, BD], bomb[i, X], bomb[i, Y])
			break
		case 2:
			deleteShotSetRadius(bomb[i, BD], 128)
			enemyCollisionCircle(bomb[i, X], bomb[i, Y], 128, explosionDamage)
			var xx, yy
			var dist = 40, times = 5, draws = 5
			for( var d = 0; d < draws; d++) {
				xx = bomb[i, X] + lengthdir_x(dist, (timer*times) + (360/draws) * d)
				yy = bomb[i, Y] + lengthdir_y(dist, (timer*times) + (360/draws) * d)
				part_particles_create_colour(global.partSys, xx, yy, global.partReimuBomb1, make_color_hsv((360/draws) * d, 255, 255), 1);
			}
			repeat(10) {part_particles_create_colour(global.partSys, bomb[i, X], bomb[i, Y], global.partReimuBomb11, choose(c_red, c_lime, c_blue), 1);}
			screenShake(10, 30)
			bomb[i, ALIVE] = false
			bomb[i, STATE]++
	}
}