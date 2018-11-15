// Master Spark Bomb

player.inBomb = true

image_alpha = 0.1
image_xscale = 0.1
direction = 90

damage = 1

duration = 300
screenShake(20, 300)
timer = 0

dc = deleteShotCircle(x, y-64, 128, duration, DELTYPE_ANIMATED)
dr = deleteShotRectangle(x, y - 364, 300, 128, duration, DELTYPE_ANIMATED)
deleteShotSetAngle(dr, direction)

pulses = array_create(4, 0)
pulseSpd = 15

for(var i = 0; i < 4; i++) {pulses[i] = -216 * i}

play_sfx_buffer(game.sfxMasterSpark, false)
play_sfx_buffer(game.sfxSpellcard, false)