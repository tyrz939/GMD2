var oRadius
with obj_bullet {
	switch hitType {
		case CIRCLE:
			draw_circle_hitbox(x, y, hitRadius, other.hitboxColor)
			break
		case OVAL:
			oRadius = (max(hitWidth, hitHeight) * 1.5)
			draw_circle_hitbox(x, y, oRadius, other.optimizeColor)
			draw_oval_hitbox(x, y, hitWidth, hitHeight, direction, other.hitboxColor)
			break
		case RECTANGLE:
			oRadius = (max(hitWidth, hitHeight) * 1.5)
			draw_circle_hitbox(x, y, oRadius, other.optimizeColor)
			draw_rectangle_hitbox(x, y, hitWidth, hitHeight, direction, other.hitboxColor)
			break
	}
}

with obj_bulletGroup {
	switch hitType {
		case CIRCLE:
			for(var i = 0; i < __amount; i++) {
				if grid[# __alive, i] {
					draw_circle_hitbox(grid[# __xx, i], grid[# __yy, i], hitRadius, other.hitboxColor)
				}
			}
			break
		case OVAL:
			for(var i = 0; i < __amount; i++) {
				if grid[# __alive, i] {
					oRadius = (max(hitWidth, hitHeight) * 1.5)
					draw_circle_hitbox(grid[# __xx, i], grid[# __yy, i], oRadius, other.optimizeColor)
					draw_oval_hitbox(grid[# __xx, i], grid[# __yy, i], hitWidth, hitHeight, grid[# __dir, i], other.hitboxColor)
				}
			}
			break
		case RECTANGLE:
			// TODO OPTIMIZE
			for(var i = 0; i < __amount; i++) {
				if grid[# __alive, i] {
					oRadius = (max(hitWidth, hitHeight) * 1.5)
					draw_circle_hitbox(grid[# __xx, i], grid[# __yy, i], oRadius, other.optimizeColor)
					draw_rectangle_hitbox(grid[# __xx, i], grid[# __yy, i], hitWidth, hitHeight, grid[# __dir, i], other.hitboxColor)
				}
			}
			break
	}
}

with obj_cLaserGroup {
	var h, j
	for(i = 0; i < __amount; i++) {
		if grid[# __alive, i] {
			var _px1 = grid[# __headerLength, i]
			var _py1 = grid[# __headerLength+__yy, i]
			var _px2 = grid[# __gridWidth-_stepSize, i]
			var _py2 = grid[# __gridWidth-_stepSize+__yy, i]
		
			oRadius = point_distance(_px1, _py1, _px2, _py2) / 2
			var _cx = _px1 + lengthdir_x(oRadius, point_direction(_px1, _py1, _px2, _py2))
			var _cy = _py1 + lengthdir_y(oRadius, point_direction(_px1, _py1, _px2, _py2))
			oRadius += __width * 2
			draw_circle_hitbox(_cx, _cy, oRadius, other.optimizeColor)
		
			h = 0
			for(var u = __headerLength; u < __gridWidth; u += _stepSize) {
				h--
				if grid[# u+__aalive, i] {
					j = _colStart + lengthdir_y(_colMid, (h / __length) * 180)
					draw_circle_hitbox(grid[# u, i], grid[# u+__yy, i], j, other.hitboxColor)
				}
			}
		}
	}
}

with obj_sLaser {
	if timerStep > 0 && _duration > timerStep {
		var _xx = x + lengthdir_x(hitHeight, direction)
		var _yy = y + lengthdir_y(hitHeight, direction)
		draw_rectangle_hitbox(_xx, _yy, hitHeight, hitWidth, direction, other.hitboxColor)
	}
}

// Draw Graze Box
with player {
	draw_circle_hitbox(x, y, game.grazeRadius, other.grazeColor)
}

// Draw Deleters
for(var i = 0; i < ds_grid_width(game.bulletRemover); i++) {
	if game.bulletRemover[# i, bulletRemover_t.HITBOX] == 0 {
		var _cx = game.bulletRemover[# i, bulletRemover_t.X]
		var _cy = game.bulletRemover[# i, bulletRemover_t.Y]
		var _cr = game.bulletRemover[# i, bulletRemover_t.RADIUS]
		draw_circle_hitbox(_cx, _cy, _cr, deleterColor)
	} else if game.bulletRemover[# i, bulletRemover_t.HITBOX] == 1 {
		var _cx = game.bulletRemover[# i, bulletRemover_t.X]
		var _cy = game.bulletRemover[# i, bulletRemover_t.Y]
		var _cw = game.bulletRemover[# i, bulletRemover_t.WIDTH]
		var _ch = game.bulletRemover[# i, bulletRemover_t.HEIGHT]
		var _ca = game.bulletRemover[# i, bulletRemover_t.ANGLE]
		draw_rectangle_hitbox(_cx, _cy, _cw, _ch, _ca, deleterColor)
	}
}

// Draw Enemies
with obj_enemy {
	if hitCircle > 0 {
		draw_circle_hitbox(x, y, hitCircle, other.enemyColor)
	}
	if hitWidth > 0 && hitHeight > 0 {
		draw_rectangle_hitbox(x, y, hitWidth, hitHeight, 0, other.enemyColor)
	}
	
	
	if pHitCircle > 0 {
		draw_circle_hitbox(x, y, pHitCircle, other.hitboxColor)
	}
	if pHitWidth > 0 && pHitHeight > 0 {
		draw_rectangle_hitbox(x, y, pHitWidth, pHitHeight, 0, other.hitboxColor)
	}
}