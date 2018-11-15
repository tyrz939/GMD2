draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_color(c_white);
draw_set_font(font_debug);

_dt_add += delta_time
_counter++
if _counter == 60 {
	_fps = ((16666.6666 * _counter) / _dt_add) * _counter
	_counter -= 60
	_dt_add = 0
}
if global.fullscreen	{var fX = global.gui_width - 5}
else					{var fX = global.window_width - 5}
draw_text(fX, global.gui_height - 2, string_format(_fps, 0, 1) + "fps")


if global.showfps == 2 {
	var dbX, dbY
	// Boss Stats
	if instance_exists(obj_boss) {
		draw_set_halign(fa_left);
		draw_set_valign(fa_bottom);
		dbX = global.gui_width - 250
		dbY = global.gui_height - 250
		with obj_boss {
			dbY -= 15;
			draw_text(dbX, dbY,"Spell Capture: " + BoolToString(spellCapture));
			dbY -= 15;
			draw_text(dbX, dbY,"Break HP: " + string(bossSpellBreakHP));
			dbY -= 15;
			draw_text(dbX, dbY,"Max HP: " + string(maxhp));
			dbY -= 15;
			draw_text(dbX, dbY,"HP: " + string(hp));
			dbY -= 15;
		}
		draw_text(dbX, dbY,"Boss Stats:");
		dbY -= 15;
	}
	
	// Performance Stats
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	dbX = global.gui_width - 250
	dbY = global.gui_height - 200
    draw_text(dbX, dbY,"Performance Stats:");
    dbY += 15;
    draw_text(dbX, dbY, "No. of Instances: " + string(instance_count));
    dbY += 15;
	var bulletCount = 0
	with obj_bulletParent {bulletCount += __amountLeft}
    draw_text(dbX, dbY, "No. of Bullets: " + string(bulletCount));
    dbY += 15;
    draw_text(dbX, dbY, "Random Seed: " + string(random_get_seed()));
    dbY += 15;
	
	var _width = 120
#region // Real FPS Graph
    draw_text(dbX, dbY, "Real FPS: " + string(fps_real)); //Max FPS CPU can do without GPU limitations????
	draw_rectangle(dbX, dbY, dbX+_width, dbY+40, true)
	draw_set_color(c_black)
	draw_set_alpha(0.5)
	draw_rectangle(dbX, dbY, dbX+_width, dbY+40, false)
	draw_set_alpha(1)
	rFPS = max(rFPSt, fps_real);
	rFPSm = rFPSb;
	rFPSt = 0;
	rFPSb = 1000000;
	dbY += 39
	var col
	for( var i = 0; i < _width-1; i++ ) {
		
		if i = _width-2 {
			aFPS1[i] = fps_real;
			rFPSm = min(fps_real, rFPSm);
		} else {
			aFPS1[i] = aFPS1[i+1];
		}
		col = make_color_hsv(clamp(aFPS1[i]/8, 0, 96), 255, 255)
		draw_line_color(dbX + i+1, dbY, dbX + i+1, dbY - ((aFPS1[i] - rFPSm) / (rFPS - rFPSm)) * 39, col, col)
		rFPSt = max(rFPSt, aFPS1[i]);
		rFPSb = min(rFPSb, aFPS1[i]);
	}
	draw_set_color(c_white);
	draw_text(dbX + _width + 5, dbY-20, round(rFPSt));
	draw_text(dbX + _width + 5, dbY+5, round(rFPSb));
#endregion
	
	dbY += 25
	
#region // DeltaTime Graph
	draw_set_color(c_white);
    draw_text(dbX, dbY, "Delta Time: " + string(delta_time / 1000) + "ms");
	draw_rectangle(dbX, dbY, dbX+_width, dbY+40, true)
	draw_set_color(c_black)
	draw_set_alpha(0.5)
	draw_rectangle(dbX, dbY, dbX+_width, dbY+40, false)
	draw_set_alpha(1)
	
	sFPS = max(sFPSt, delta_time);
	sFPSm = sFPSb
	sFPSt = 0;
	sFPSb = 1000000;
	dbY += 39
	draw_set_color(c_aqua);
	for( var i = 0; i < _width-1; i++ ) {
		if i = _width-2 {
			aFPS2[i] = delta_time
			sFPSm = min(delta_time, sFPSm);
		} else {
			aFPS2[i] = aFPS2[i+1];
		}
		col = make_color_hsv(159 + clamp(abs((aFPS2[i] / 16666 - 1) * 1000), 0, 96), 255, 255)
		draw_line_color(dbX + i+1, dbY, dbX + i+1, dbY - ((aFPS2[i] - sFPSm) / (sFPS - sFPSm)) * 39, col, col)
		sFPSt = max(sFPSt, aFPS2[i]);
		sFPSb = min(sFPSb, aFPS2[i]);
	}
	draw_set_color(c_white);
	draw_text(dbX + _width + 5, dbY-20, string(sFPSt / 1000) + "ms");
	draw_text(dbX + _width + 5, dbY+5, string(sFPSb / 1000) + "ms");
#endregion
}