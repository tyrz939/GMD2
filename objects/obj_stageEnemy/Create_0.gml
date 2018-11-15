spd = 0

autoDelete = true

grazeAdd = 0 // Because I'm using shot collision for player hit detection
shotColor = -1
shotType = -1
deleteParent = noone
deleteResist = 0

hitCircle = 0
hitWidth = 32
hitHeight = 32

pHitCircle = 0
pHitWidth = 0
pHitHeight = 0

drops[0] = -1
dropCount = 0

// Bounding box for Marisa Lasers
mask_index = spr_bboxCircle
visible = true

sprite = -1
animationSpeed = 0
subImage = 0

hp = 1000
takeDmg = 0

timer = 0
game.enemyCount++

// Color Overlay
	scr_shader_overlay_init()
	overlayDraw = false
	overlayColor = c_blue
	overlayAlpha = 0
	