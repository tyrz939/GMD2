var xd = 850
var yd = 480
var space = 30

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(font_terminal);

draw_set_color(optimizeColor)
draw_text(xd, yd, "Preceding check")
yd += space

draw_set_color(hitboxColor)
draw_text(xd, yd, "HitBoxes")
yd += space

draw_set_color(grazeColor)
draw_text(xd, yd, "Graze Box")
yd += space

draw_set_color(deleterColor)
draw_text(xd, yd, "Bullet Deleters")
yd += space

draw_set_color(enemyColor)
draw_text(xd, yd, "Enemy Damage Hitbox")
yd += space

draw_set_color(c_white)