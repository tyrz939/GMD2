event_inherited()

var inst = instance_nearest(x, y, obj_enemy)
// If enemy is invisible, don't home to it
if instance_exists(inst) {
	if !inst.visible {
		var deactive
		var i = 0
		while true {
			deactive[i] = inst
			i++
			instance_deactivate_object(inst)
			inst = instance_nearest(x, y, obj_enemy)
			if instance_exists(inst) {
				if inst.visible {break}
			} else {
				break
			}
		}
		for(var a = 0; a < i; a++) {
			instance_activate_object(deactive[a])
		}
	}
}

// 3 jumps and you're out
if inst != prevInst {jumps++}
prevInst = inst
if spd < 10 {spd += 0.1}

if inst != noone && jumps <= 3 {
	var dirEnemy = point_direction(x, y, inst.x, inst.y)
	direction = turn_smooth( direction, dirEnemy, turnSpeed * spd )
}

turnSpeed += 3/180

image_angle = direction