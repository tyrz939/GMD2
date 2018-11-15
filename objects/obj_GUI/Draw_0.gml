if image_exists(game.backgroundGUI) {
	draw_image_ext(game.backgroundGUI, 0, 0, 0, 1, 1, 0, c_white, 1)
} else {
	// Solid color background draw
	draw_set_color(bgCol1)
	// Left
	draw_rectangle(0, 0, drawGame.GUIPlayAreaStartX, global.gui_height, false)
	// Right
	draw_rectangle(drawGame.GUIPlayAreaEndX, 0, global.gui_width, global.gui_height, false)
	// Top
	draw_rectangle(drawGame.GUIPlayAreaStartX, 0, drawGame.GUIPlayAreaEndX, drawGame.GUIPlayAreaStartY, false)
	// Bottom
	draw_rectangle(drawGame.GUIPlayAreaStartX, drawGame.GUIPlayAreaEndY, drawGame.GUIPlayAreaEndX, global.gui_height, false)
	
	// Rectangle around play area
	draw_set_color(bgCol2)
	draw_rectangle(drawGame.GUIPlayAreaStartX, drawGame.GUIPlayAreaStartY,
				drawGame.GUIPlayAreaEndX, drawGame.GUIPlayAreaEndY, true)
	draw_set_color(c_white)
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(global.font_MainMenu);
// NEW GUI
for(var i = 0; i < ds_grid_height(guiGrid); i++) {
	switch guiGrid[# 0, i] {
		case guiGrid_t.TEXT:		draw_text(guiGrid[# 1, i], guiGrid[# 2, i], guiGrid[# 3, i]); break;
		case guiGrid_t.VARIABLE:	draw_text(guiGrid[# 1, i], guiGrid[# 2, i], GUIConvertVariable(guiGrid[# 3, i])); break;
		case guiGrid_t.IMAGE:		draw_image(guiGrid[# 1, i], guiGrid[# 2, i], guiGrid[# 3, i], guiGrid[# 4, i]); break;
		case guiGrid_t.IMAGE_ROW:	GUIDrawRow(guiGrid[# 1, i], guiGrid[# 2, i], guiGrid[# 3, i], guiGrid[# 4, i], guiGrid[# 5, i], guiGrid[# 6, i], guiGrid[# 7, i], guiGrid[# 8, i], guiGrid[# 9, i], guiGrid[# 10, i]); break;
		case guiGrid_t.SET_FONT:	draw_set_font(game.fontGrid[# 0, guiGrid[# 1, i]]); break;
		case guiGrid_t.SET_HALIGN:	draw_set_halign(guiGrid[# 1, i]); break;
		case guiGrid_t.SET_VALIGN:	draw_set_valign(guiGrid[# 1, i]); break;
		case guiGrid_t.SET_COLOR:	draw_set_color(guiGrid[# 1, i]); break;
		case guiGrid_t.SET_ALPHA:	draw_set_alpha(guiGrid[# 1, i]); break;
	}
}
draw_set_color(c_white)
draw_set_alpha(1)


with obj_boss {
	var _xxs, _xxs, _yys1, _yys0, _yys
	/********* Draw Marker at Bottom of Screen *********/
	if visible {
		_xxs =  (global.playAreaStartX * drawGame.__xyOffset + x * drawGame.__xyOffset) / drawGame.__guiScale
		_yys0 = global.gui_height
		_yys1 = drawGame.GUIPlayAreaEndY
	
		draw_primitive_begin(pr_trianglestrip);
			draw_vertex_color(_xxs-(32 * drawGame.__guiScale), _yys0, c_red, 0);
			draw_vertex_color(_xxs-(32 * drawGame.__guiScale), _yys1, c_red, 0);
		
			draw_vertex_color(_xxs, _yys0, c_red, 0.5);
			draw_vertex_color(_xxs, _yys1, c_red, 0.5);
		
			draw_vertex_color(_xxs+(32 * drawGame.__guiScale), _yys0, c_red, 0);
			draw_vertex_color(_xxs+(32 * drawGame.__guiScale), _yys1, c_red, 0);
		draw_primitive_end();
	}
	
	/********* Draw Spellcard Information *********/
	if bossState == bossState_t.SPELLCARD {
		draw_set_halign(fa_right)
		draw_set_color(c_white)
		draw_set_valign(fa_top);
		draw_set_font(global.font_MainMenu);
		
		_xxs = drawGame.GUIPlayAreaEndX
		if healthBarType == 0	{_yys = global.playAreaStartY}
		else					{_yys = global.playAreaStartY + 24}
		var stringHeight = string_height(spellName)
		
		var col1 = make_color_rgb(255, 127, 127)
		var col2 = make_color_rgb(255, 191, 191)
		draw_primitive_begin(pr_trianglestrip);
			draw_vertex_color(_xxs-15, _yys + 16 + stringHeight, col1, 1);
			draw_vertex_color(_xxs-15, _yys + 20 + stringHeight, col1, 1);
			
			draw_vertex_color(_xxs-500, _yys + 16 + stringHeight, col2, 1);
			draw_vertex_color(_xxs-500, _yys + 20 + stringHeight, col2, 1);
			draw_vertex_color(_xxs-600, _yys + 16 + stringHeight, col2, 0);
			draw_vertex_color(_xxs-600, _yys + 20 + stringHeight, col2, 0);
		draw_primitive_end();
		
		draw_text(_xxs - 15, _yys + 20, spellName)
		
		draw_set_halign(fa_left)
		draw_set_font(font_debug);
		draw_set_color(col1)
		draw_text(_xxs - 160, _yys + 24 + stringHeight, "Bonus")
		draw_set_color(c_white)
		draw_set_halign(fa_right)
		draw_text(_xxs - 16, _yys +  24 + stringHeight, string_insert_comma(round(spellBonus)))
		
	}
	
	/********* Draw Boss Spell Timer *********/
	if bossState == bossState_t.NONSPELL || bossState == bossState_t.SPELLCARD {
		draw_set_color(c_white)
		draw_set_valign(fa_top);
		draw_set_font(global.font_MainMenu);
		
		if healthBarType == 0 {
			draw_set_halign(fa_center)
			// Y Pos
			if bossState == bossState_t.NONSPELL	{_yys = global.playAreaStartY + 16} 
			else									{_yys = global.playAreaStartY + 64}
			// X pos
			_xxs =  (global.playAreaStartX * drawGame.__gameScale + (global.playAreaWidth / 2) * drawGame.__gameScale) / drawGame.__guiScale
		} else {
			draw_set_halign(fa_right)
			// Y Pos
			_yys = global.playAreaStartY + 10
			// X pos
			_xxs = drawGame.GUIPlayAreaEndX - 10
		}
		
		draw_text(_xxs, _yys, floor(bossPhaseTimer / 60))
	}
}