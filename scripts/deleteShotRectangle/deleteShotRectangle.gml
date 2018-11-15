/// @function deleteShotRectangle
/// @description Shot Deleter
/// @param {real} x
/// @param {real} y
/// @param {real} width
/// @param {real} height
/// @param {real} [opt]timer
/// @param {real} [opt]deleteType
/// @param {real} [opt]typeOfBullets
/// @param {real} [opt]colorOfBullets
/// @param {real} [opt]parentObjectID
game.brIDnext++
var _p = ds_grid_width(game.bulletRemover)
ds_grid_resize(game.bulletRemover, _p+1, bulletRemover_t.LENGTH)

game.bulletRemover[# _p, bulletRemover_t.HITBOX] = 1
game.bulletRemover[# _p, bulletRemover_t.X] = argument[0]
game.bulletRemover[# _p, bulletRemover_t.Y] = argument[1]
game.bulletRemover[# _p, bulletRemover_t.WIDTH] = argument[2]
game.bulletRemover[# _p, bulletRemover_t.HEIGHT] = argument[3]
game.bulletRemover[# _p, bulletRemover_t.ANGLE] = 0

if argument_count > 4 {game.bulletRemover[# _p, bulletRemover_t.TIMER] = argument[4]}
else {game.bulletRemover[# _p, bulletRemover_t.TIMER] = 1}

if argument_count > 5 {game.bulletRemover[# _p, bulletRemover_t.DELETE_TYPE] = argument[5]}
else {game.bulletRemover[# _p, bulletRemover_t.DELETE_TYPE] = 1}

if argument_count > 6 {game.bulletRemover[# _p, bulletRemover_t.TYPE] = argument[6]}
else {game.bulletRemover[# _p, bulletRemover_t.TYPE] = -1}

if argument_count > 7 {game.bulletRemover[# _p, bulletRemover_t.COLOR] = argument[7]}
else {game.bulletRemover[# _p, bulletRemover_t.COLOR] = -1}

if argument_count > 8 {game.bulletRemover[# _p, bulletRemover_t.PARENT_ID] = argument[8]}
else {game.bulletRemover[# _p, bulletRemover_t.PARENT_ID] = -1}

game.bulletRemover[# _p, bulletRemover_t.ID] = game.brIDnext
game.bulletRemover[# _p, bulletRemover_t.ALIVE] = 1

return game.bulletRemover[# _p, bulletRemover_t.ID]