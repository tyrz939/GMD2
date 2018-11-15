var inst, str, s
for(var i = 0; i < ds_grid_height(dialogueGrid); i++) {
	inst = dialogueGrid[# dGrid_t.INSTANCE, i]
	str = dialogueGrid[# dGrid_t.STRING, i]
	s = dialogueGrid[# dGrid_t.TYPE_STRING, i]
	
	if instance_exists(inst) {
		x = gameToGuiX(inst.x) + 32
		y = gameToGuiY(inst.y)
	
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		draw_set_font(font)
	
		var h = string_height("A")
		var hs = string_height(str) + ((string_height(str) / h) - 1) * 2
		var ws = string_width(str)
	
		draw_set_color(col1)
		draw_set_alpha(0.75)
		draw_roundrect(x, y, x + 32 + ws, y + 32 + hs, false)
		draw_set_color(col2)
		draw_set_alpha(1)
		draw_roundrect(x, y, x + 32 + ws, y + 32 + hs, true)
	
		var tx = x + 16, ty = y + 16
		draw_text_ext(tx, ty, s, h + 2, 500)
	}
}