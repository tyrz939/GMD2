// Misc
	depth = 0
	random_set_seed(0)

// Initialize Systems
	scr_initParticles()
	scr_initShots()
	instance_create_depth(0, 0, INTERFACE_DEPTH, obj_GUI)
	instance_create_depth(0, 0, BOSS_HP_DEPTH, obj_bossHPBar)
	instance_create_depth(0, 0, BG_DEPTH, draw3DBGandDistortion)
	
	// SFX
	soundGrid = ds_grid_create(4, 0)
	scr_initVariablesForYCC()
	
	// FMOD
	bgmGrid = ds_grid_create(3, 0)
	channel[0] = FMODGMS_Chan_CreateChannel();
	
	// Fonts
	fontGrid = ds_grid_create(3, 0)

// Setting veriables for the game elements.
	
	// Stage
	stageNumber = 0
	stageObject = noone
	stagePosition = 0

	// DEFAULTS
	backgroundGUI = -1
	bossHPBarType = 0
	
	shotSetDefaultDelay(10)
	playFieldSetup(32, 16, 384, 448)
	shotAutoDeleteEdges(64, 64, 64, 64) // Do not run before the one above
	
	boundaryLeft = 10
	boundaryRight = 10
	boundaryTop = 20
	boundaryBottom = 15

	playerSpawnX = 192
	playerSpawnY = 448+24
	playerGoToX = 192
	playerGoToY = 448-48
	
	// Game
	pause = false
	gameOver = false
	stageEnd = false
	continuesUsed = 0
	scoreCalculated = false
	unpauseNextFrame = false
	bulletPickupDrop = pickup_t.STAR
	frame = 0
	replay = 0
	gamespeed = 1
	score = 0
	bonusScore = 0
	grazeCount = 0
	enemyCount = 0
	enemyKillCount = 0
	replayEndFrame = -1 // Replay end frame
	global.tweenMove = EaseOutQuad
	global.tweenSpeed = EaseInOutQuad
	global.tweenTurn = EaseInOutQuad
	
	lives = 2
	bombs = 2
	shotPower = 0
	continues = 2
	pointOfCollect = 130
	
	// Bullet Remover Array / Variables
	scr_initDeleter()
	
	// 3D Variables
	scr_init3d()
	
	// Boss Distortion
	scr_initBossDistortion()
	
// LUA / Loading
	loading = true
	loadingState = 0
	loadDefaultAssets = true
	_li = 0
	game_set_speed(300, gamespeed_fps);
	instance_create_depth(0, 0, LOAD_DEPTH, obj_loading)
	visible = false
	with obj_GUI {visible = false}
	loadingPrint("Initializing Lua")