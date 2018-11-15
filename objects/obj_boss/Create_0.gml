spd = 0

grazeAdd = 0 // Because I'm using shot collision for player hit detection
shotColor = -1
shotType = -1
deleteParent = noone
deleteResist = 0

hitCircle = 0
hitWidth = 0
hitHeight = 0

pHitCircle = 0
pHitWidth = 32
pHitHeight = 32

// Bounding box for Marisa Lasers
mask_index = spr_bboxCircle
visible = true

sprite = -1
animationSpeed = 0
subImage = 0
backSprite = -1

maxhp = 1000
hp = maxhp

takeDmg = 0

timer = 0
image_speed = 0

// Health Bar
	healthBarType = game.bossHPBarType // 0 = Circle, 1 = Bar
	healthBarShow = false
	HealthBarCol = make_color_rgb(255,0,0)
	healthBarFill = 0

// Background Effects
	// Distortion
	distortion = false
	distortionScale = 1.2
	distortionBGColor = c_white
	distortionBGAlpha = 1
	
	// Background Color
	// TODO
	
	// Trails
	trails = false
	/*trailsCount = 2
	trailsAlpha = 0.25
	trailsScale = 1.5
	trailsCol = c_white
	// Array init for the trails
	for(var _i = trailsCount-1; _i >= 0; _i--) {
		trailsArray[_i, 2] = 0
		trailsArray[_i, 1] = 0
		trailsArray[_i, 0] = 0
	}*/

// Color Overlay
	scr_shader_overlay_init()
	overlayDraw = false
	overlayColor = c_blue
	overlayAlpha = 0
	
// Tween Y position drawing
	yDraw = 0
	yDir = 0
	
// Boss State
	enum bossState_t {
		IDLE,
		DIALOG,
		NONSPELL,
		SPELLCARD
	}

	bossState = bossState_t.IDLE
	bossPhaseID = 0
	bossSpellBreakHP = 0
	bossPhaseTimer = 0
	bossPhaseTimerStart = 0
	
// Spellcard Unique Variables
	spellBonus = 0
	spellBonusStart = 1000
	spellName = "SET ME"
	spellSurvival = false
	spellCapture = false