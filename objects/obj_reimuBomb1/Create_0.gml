player.inBomb = true

sprite = game.reimuBomb

amount = 8
image_alpha = 0
state = 0
maxDuration = 300
screenShake(10, 240)
timer = 0
t2 = 1
damage = 0.5
explosionDamage = 25
radius = 0

X = 0
Y = 1
DIR = 2
SPD = 3
CHANGE = 4
STATE = 5
ALIVE = 6
BD = 7

for( var i = 0; i < amount; i++) {
	bomb[i, X] = x
	bomb[i, Y] = y
	bomb[i, DIR] = (360/amount) * i + direction
	bomb[i, SPD] = 3
	bomb[i, CHANGE] = 90 + irandom(30)
	bomb[i, STATE] = 0
	bomb[i, ALIVE] = true
	bomb[i, BD] = deleteShotCircle(x, y, 48, maxDuration)
}

play_sfx_buffer(game.sfxMasterSpark, false)
play_sfx_buffer(game.sfxSpellcard, false)