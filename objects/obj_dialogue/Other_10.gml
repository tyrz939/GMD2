timer++
skip = false
var skipCounter = 0

var timeout = 300
var ff = max(player.extra, player.bomb_press, player.shoot_press)
if ff {timeout = 15}

var str, s, c, spd
for(var i = 0; i < ds_grid_height(dialogueGrid); i++) {
	if dialogueGrid[# dGrid_t.INSTANCE, i] != noone {
		skipCounter++
		
		str = dialogueGrid[# dGrid_t.STRING, i]
		s =  dialogueGrid[# dGrid_t.TYPE_STRING, i]
		c = dialogueGrid[# dGrid_t.COUNTER, i]
		spd = dialogueGrid[# dGrid_t.SPEED, i]
	
		if ff {
			spd = 1
		}
		if timer % spd == 0 && c < string_length(str) {c++}
		s = string_copy(str, 0, c)
	
		dialogueGrid[# dGrid_t.STRING, i] = str
		dialogueGrid[# dGrid_t.TYPE_STRING, i] = s
		dialogueGrid[# dGrid_t.COUNTER, i] = c
		
		if c == string_length(str) {dialogueGrid[# dGrid_t.TIMER, s]++}
		if dialogueGrid[# dGrid_t.TIMER, s] >= timeout && c == string_length(str) {
			dialogueRemove(i)
		}
	}
}

if skip || skipCounter == 0 {dialogueReset()}