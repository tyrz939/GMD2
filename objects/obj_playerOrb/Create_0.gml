prevLives = lives
_id = player.orbCount
var p = floor(game.shotPower)
xp = player.orbX[p-1, _id-1]
yp = player.orbY[p-1, _id-1]
x = xp + player.x
y = yp + player.y
prevPower = p

blendType = bm_normal