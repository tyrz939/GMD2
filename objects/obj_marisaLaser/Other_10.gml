if !instance_exists(lockPositionTo) {instance_destroy(); exit}

// Set position and direction
x = lockPositionTo.x;
y = lockPositionTo.y;
//println(lockPositionTo._id)
direction = player.dirL[floor(game.shotPower) -1, lockPositionTo._id -1]

var dir1 = 90;
var turn0 = angle_difference(direction, dir1);
var turn_speed = 5;
	
turn0 = turn0/turn_speed;
direction -= turn0;
direction = turn_smooth( direction, dir1, turn_speed );

// Is Firing?
var firing = false
if player.shoot_press && !player.focus {firing = true}
    
// Collision/Length checker
if !firing && t > 0				{t -= 1;}
else if firing && t < FadeIn	{t += 1;}

if t == 0{
    max_length = 0;
    d = 0;
	cycleImage = 0;
	timer = 0
	particleTimer = 0
}else{
    if max_length < 600 {max_length += 20;}
}
alpha = t / FadeIn;
        
if alpha > 0.1 {
	timer++
    draw = true;
    hit_enemy = false;
    if direction > 270 || direction < 90	{end_x = global.playAreaWidth;}
	else									{end_x = 0;}
	
    if direction > 180	{end_y = global.playAreaHeight;}
	else				{end_y = 200;}
	
    var xJump, yJump
	var x1 = x
	var y1 = y
    var i = false;
		
	var eDist = 0
	var nearestDist = 10000
	var inst, prevND, loopCounter = 0, loopBreak, prevDist, tmp
	var hit = false
    while !i {
        if collision_line(x, y, x + lengthdir_x(max_length, direction), y + lengthdir_y(max_length, direction), obj_enemy, true, true) {
			with obj_enemy {
				prevND = nearestDist
				nearestDist = min(nearestDist, distance_to_point(x1, y1))
				if prevND != nearestDist {inst = id}
			}
			eDist += nearestDist
				
			xJump = lengthdir_x(eDist, direction)
			yJump = lengthdir_y(eDist, direction)
			x1 = x + xJump
			y1 = y + yJump
			
			loopCounter ++
			loopBreak = false
			prevDist = 1000
			if collision_line(x1, y1, x1 + lengthdir_x(inst.hitCircle, direction), y1 + lengthdir_y(inst.hitCircle, direction), inst, true, true) {
				while !position_meeting(x1, y1, inst) && !loopBreak {
					xJump += lengthdir_x(2, direction)
					yJump += lengthdir_y(2, direction)
					x1 = x + xJump
					y1 = y + yJump
					tmp = point_distance(x1, y1, inst.x, inst.y)
					if tmp > prevDist {loopBreak = true;}
					prevDist = tmp
				}
			}
			
			if (nearestDist == 0 && eDist < max_length) || loopCounter > 20 {
	            inst.takeDmg += damage
	            hit_enemy = true
	            i = true
	            max_length = point_distance(x, y, x1, y1);
				if particleTimer % 4 == 0 {
					//part_type_direction(global.partMarisaLaserImpact,direction,direction,0,0);
					//part_particles_create_colour(global.partSys, round(x1), round(y1), global.partMarisaLaserImpact, make_color_rgb(50, 50, 255), 1);
					var part = instance_create_depth(round(x1), round(y1), depth, obj_marisaLaserImpact)
					part.image_angle = direction;
					part.direction = direction
				}
				particleTimer++
	        }
        }
		// Exit Loop
		if eDist >= max_length  || eDist == 0{
			i = true
			xJump = lengthdir_x(max_length, direction);
			yJump = lengthdir_y(max_length, direction);
		}
//		i = true
    }
	end_x = x + xJump
	end_y = y + yJump
}else{
    draw = false;
}
cycleImage += 15