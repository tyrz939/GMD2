repeat collisionChecks {
// Move
x += ((spd / collisionChecks) * cos (direction * pi / 180)) * game.gamespeed
y += ((spd / collisionChecks) * -sin (direction * pi / 180)) * game.gamespeed

// Collision

	var inst = enemyCollisionRectangle(x, y, width, height, 0, damage)
	if inst != noone {
		instance_destroy()
		var _d = point_direction(inst.x, inst.y, x, y)
		
		var rx, ry
		
		repeat partAmount {
			if partPos == 0 {
				rx = x
				ry = min(y, inst.y +max(lengthdir_y(inst.hitCircle, _d), inst.hitHeight))
			} else if partPos == 1 {
				rx = inst.x
				ry = inst.y
			} else if partPos == 2 {
				rx = x
				ry = y
			}
			if partRandX > 0 {rx += random(partRandX) - partRandX / 2}
			if partRandY > 0 {ry += random(partRandY) - partRandY / 2}
			//if partAngle != 0 {part_type_direction(particle,direction,direction,0,0)}
			//part_particles_create_colour(global.partSys, round(rx), round(ry), particle, c_white, 1);
			var part = instance_create_depth(round(rx), round(ry), depth, particle)
			if partAngle != 0 {part.image_angle = image_angle; part.direction = direction}
		}
		play_sfx_buffer(sfx, true)
		exit
	}
}

//Clean up once out of play field
if x<-32 || x>global.playAreaWidth +32 || y<-32 || y>global.playAreaHeight +32 {
    instance_destroy()
}

timer++