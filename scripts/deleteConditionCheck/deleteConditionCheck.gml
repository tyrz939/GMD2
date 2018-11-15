// Checks all the conditions to decide if the hit will register
var _i = argument0
if (game.bulletRemover[# _i, bulletRemover_t.COLOR] == shotColor || game.bulletRemover[# _i, bulletRemover_t.COLOR] == -1) {
	if (game.bulletRemover[# _i, bulletRemover_t.TYPE] == shotType || game.bulletRemover[# _i, bulletRemover_t.TYPE] == -1) {
		if deleteResist <= game.bulletRemover[# _i, bulletRemover_t.RESIST] {
			if deleteParent == game.bulletRemover[# _i, bulletRemover_t.PARENT_ID] || game.bulletRemover[# _i, bulletRemover_t.PARENT_ID] == -1 {
				return true
			}
		}
	}
}

return false