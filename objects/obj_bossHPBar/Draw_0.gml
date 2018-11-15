with obj_boss {
	if hp > 0 && healthBarShow {
		switch healthBarType {
			case 0: // HP Circle
				// Colors
				var HealthBarCol1 = merge_color(HealthBarCol, c_white, 0.8)
				
				var Chp = ceil(360/maxhp*(hp * healthBarFill))
				var xD = round(x);
				var yD = round(y);
				var radius = 55; // hp bar radius
				var line = 3; // line thickness
				if point_distance(xD, yD, player.x, player.y) < radius + 20 {
				    var aD = 0.3;
				} else {
				    var aD = 1;
				}
         
				draw_primitive_begin(pr_trianglestrip);
				for (var i=Chp + 90; i >= 90; i--){
				    draw_vertex_color(xD + lengthdir_x(radius,i),yD + lengthdir_y(radius,i),HealthBarCol1,aD);
				    draw_vertex_color(xD + lengthdir_x(radius+line,i),yD + lengthdir_y(radius+line,i),HealthBarCol1,aD);
				}
				draw_primitive_end();
        
				xD -= 1;
				yD -= 1;
				draw_set_circle_precision(64);
				draw_set_alpha(aD * 0.75);
				draw_set_color(HealthBarCol);
				draw_circle(xD,yD,radius,true);
				draw_circle(xD,yD,radius+line,true);
				
				// Spell Break Point
				var Bhp = ((360 / maxhp) * bossSpellBreakHP) + 90
				draw_set_color(c_blue);
				draw_line_width(xD + lengthdir_x(radius, Bhp), yD + lengthdir_y(radius, Bhp), xD + lengthdir_x(radius+line+1, Bhp), yD + lengthdir_y(radius+line+1, Bhp), 2)

				draw_set_alpha(1)
				draw_set_color(c_white)
				break
			case 1: // HP Line
				// Colors
				var HealthBarCol1 = merge_color(HealthBarCol, c_white, 0.8)
				var HealthBarCol2 = HealthBarCol
				var HealthBarCol3 = merge_color(c_gray, c_white, 0.8)
				var HealthBarCol4 = c_gray
				
				var yD = 5, xD = 16, thickness = 4
				var xD1 = ((global.playAreaWidth - (32 + xD))/maxhp*min(bossSpellBreakHP, hp)) + xD
				var xD2 = ((global.playAreaWidth - (32 + xD))/maxhp*hp) + xD
				draw_primitive_begin(pr_trianglestrip);
				draw_vertex_color(xD, yD, HealthBarCol1, 1);
				draw_vertex_color(xD, yD + thickness, HealthBarCol2, 1);
				
				draw_vertex_color(xD1, yD, HealthBarCol1, 1);
				draw_vertex_color(xD1, yD + thickness, HealthBarCol2, 1);
				if hp > bossSpellBreakHP {
					draw_vertex_color(xD1, yD, HealthBarCol3, 1);
					draw_vertex_color(xD1, yD + thickness, HealthBarCol4, 1);
					
					draw_vertex_color(xD2, yD, HealthBarCol3, 1);
					draw_vertex_color(xD2, yD + thickness, HealthBarCol4, 1);
				}
				draw_primitive_end();
		}
	}
}