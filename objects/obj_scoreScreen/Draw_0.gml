draw_set_color(c_black)
draw_set_alpha(0.75)
draw_rectangle(drawGame.GUIPlayAreaStartX, drawGame.GUIPlayAreaStartY, drawGame.GUIPlayAreaEndX, drawGame.GUIPlayAreaEndY, false)
draw_set_alpha(1)

draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(global.font_MainMenu)
var width = 250
x = gameToGuiX(ref_getCenterX())
y = gameToGuiY(ref_getCenterY()) - 100

draw_set_color(make_color_rgb(255, 255, 127))
draw_text(x, y, "Stage Finished")

y += 75
draw_set_halign(fa_left)
draw_set_color(make_color_rgb(255, 127, 127))
draw_text(x-width, y, "Continues Used")
draw_set_halign(fa_right)
if game.continuesUsed == 0 {draw_set_color(make_color_rgb(127, 255, 127))}
draw_text(x+width, y, game.continuesUsed)
draw_set_color(c_white)

y += 50
draw_set_halign(fa_left)
draw_text(x-width, y, "Shoot Down")
draw_set_halign(fa_right)
draw_text(x+width, y, string_format(shootdownDraw, 0, 1) + "%")

y += 50
draw_set_halign(fa_left)
draw_text(x-width, y, "Graze Multiplier")
draw_set_halign(fa_right)
draw_text(x+width, y, string_format(grazeMultiplierDraw, 0, 2) + "x")

y += 50
draw_set_halign(fa_left)
draw_text(x-width, y, "Total Bonus")
draw_set_halign(fa_right)
draw_text(x+width, y, string_insert_comma(floor(bonusDraw)))