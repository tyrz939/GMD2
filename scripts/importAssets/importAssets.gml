/// @description image_stream_add(group,identifier,fname,subimg,xorig,yorig)
/// @function image_stream_add
/// @param texGroup
/// @param import/set
/*
if argument1 == 0 {
	var dir
	// Import Sprites
	dir = "assets/sprites/"
	// Hitbox
	queueImageAdd(argument0, "_hitbox", dir + "hitbox.png", 1, 32, 32)
	// Reimu
	if global.playerNumber == 0 {
		queueImageAddEtx(argument0, "_reimu", dir + "reimu/reimu.png", 24, 16, 23, 0, 0, 32, 48, 8, 0, 0)
		queueImageAddEtx(argument0, "_reimuOrb", dir + "reimu/reimu.png", 1, 8, 8, 96, 144, 16, 16, 1, 0, 0)
		// Main Shot
		queueImageAddEtx(argument0, "_reimuShot1", dir + "reimu/reimu.png", 2, 32, 8, 192, 144, 64, 16, 1, 0, 0)
		queueImageAddEtx(argument0, "_reimuShot1Impact", dir + "reimu/reimu.png", 4, 8, 8, 128, 160, 16, 16, 4, 0, 0)
		// Alt Shots
		queueImageAddEtx(argument0, "_reimuShot2", dir + "reimu/reimu.png", 1, 32, 8, 64, 176, 64, 16, 1, 0, 0)
		queueImageAddEtx(argument0, "_reimuShot3", dir + "reimu/reimu.png", 1, 8, 8, 0, 144, 16, 16, 1, 0, 0)
		queueImageAddEtx(argument0, "_reimuShot3Impact", dir + "reimu/reimu.png", 4, 8, 8, 0, 160, 16, 16, 4, 0, 0)
		// Bomb
		queueImageAdd(argument0, "_reimuBomb", dir + "reimu/seal.png", 1, 64, 64)
	}
	// Marisa
	if global.playerNumber == 10 {
		queueImageAddEtx(argument0, "_marisa", dir + "marisa/marisa.png", 24, 16, 23, 0, 0, 32, 48, 8, 0, 0)
		queueImageAddEtx(argument0, "_marisaOrb", dir + "marisa/marisa.png", 1, 8, 8, 80, 160, 16, 16, 1, 0, 0)
		// Main Shot
		queueImageAddEtx(argument0, "_marisaShot1", dir + "marisa/marisa.png", 1, 16, 8, 0, 144, 32, 16, 1, 0, 0)
		queueImageAddEtx(argument0, "_marisaShot1Impact", dir + "marisa/marisa.png", 3, 16, 8, 32, 144, 32, 16, 3, 0, 0)
		// Alt Shots
		queueImageAdd3dEtx(argument0, "_marisaLaser", dir + "marisa/marisa.png", 1, 256, 8, 0, 176, 256, 16, 1, 0, 0)
		queueImageAddEtx(argument0, "_marisaLaserStar", dir + "marisa/marisa.png", 1, 16, 16, 0, 192, 32, 32, 1, 0, 0)
		queueImageAddEtx(argument0, "_marisaLaserImpact", dir + "marisa/marisa.png", 1, 16, 4, 32, 160, 32, 8, 1, 0, 0)
		queueImageAddEtx(argument0, "_marisaShot2", dir + "marisa/marisa.png", 2, 16, 8, 128, 190, 32, 16, 2, 0, 0)
		queueImageAddEtx(argument0, "_marisaShot2Impact", dir + "marisa/marisa.png", 8, 16, 16, 0, 224, 32, 32, 8, 0, 0)
		// Bomb
		queueImageAdd(argument0, "_marisaBomb1", dir + "marisa/spark.png", 1, 16, 64)
		queueImageAdd(argument0, "_marisaBomb2", dir + "marisa/ring.png", 1, 48, 128)
	}

	// Import SFX
	dir = "assets/sfx/"
	queueWavAdd(dir + "sfx_hitEnemy.wav", 0.075, "_hitEnemy")
	queueWavAdd(dir + "sfx_masterSpark.wav", 0.2, "_masterSpark")
	queueWavAdd(dir + "sfx_graze.wav", 0.15, "_graze")
	queueWavAdd(dir + "sfx_extend.wav", 0.25, "_extend")
	queueWavAdd(dir + "sfx_playerShot.wav", 0.02, "_playerShot")
	queueWavAdd(dir + "sfx_spellcard.wav", 0.2, "_spellcard")
	queueWavAdd(dir + "sfx_phaseBreak.wav", 0.2, "_phaseBreak")
	queueWavAdd(dir + "sfx_pickup.wav", 0.05, "_pickup")
	queueWavAdd(dir + "sfx_playerDeath.wav", 0.15, "_playerDeath")
} else {
	// SFX
	sfxHitEnemy =		wav_find("_hitEnemy")
	sfxMasterSpark =	wav_find("_masterSpark")
	sfxGraze =			wav_find("_graze")
	sfxExtend =			wav_find("_extend")
	sfxPlayerShot =		wav_find("_playerShot")
	sfxSpellcard =		wav_find("_spellcard")
	sfxPhaseBreak =		wav_find("_phaseBreak")
	sfxPickup =			wav_find("_pickup")
	sfxPlayerDeath =	wav_find("_playerDeath")
	
	// Hitbox
	hitboxSprite =	image_group_find_image(argument0, "_hitbox")
	// Reimu
	if global.playerNumber == 0 {
		playerSprite =		image_group_find_image(argument0, "_reimu")
		reimuOrb =			image_group_find_image(argument0, "_reimuOrb")
		reimuShot1 =		image_group_find_image(argument0, "_reimuShot1")
		reimuShot1Impact =	image_group_find_image(argument0, "_reimuShot1Impact")
		reimuShot2 =		image_group_find_image(argument0, "_reimuShot2")
		reimuShot3 =		image_group_find_image(argument0, "_reimuShot3")
		reimuShot3Impact =	image_group_find_image(argument0, "_reimuShot3Impact")
		reimuBomb =			image_group_find_image(argument0, "_reimuBomb")
	}
	// Marisa
	if global.playerNumber == 10 {
		playerSprite =		image_group_find_image(argument0, "_marisa")
		marisaOrb =			image_group_find_image(argument0, "_marisaOrb")
		marisaShot1 =		image_group_find_image(argument0, "_marisaShot1")
		marisaShot1Impact = image_group_find_image(argument0, "_marisaShot1Impact")
		marisaLaser =		image_group_find_image(argument0, "_marisaLaser")
		println(marisaLaser)
		marisaLaserStar =	image_group_find_image(argument0, "_marisaLaserStar")
		marisaLaserImpact = image_group_find_image(argument0, "_marisaLaserImpact")
		marisaShot2 =		image_group_find_image(argument0, "_marisaShot2")
		marisaShot2Impact =	image_group_find_image(argument0, "_marisaShot2Impact")
		marisaBomb1 =		image_group_find_image(argument0, "_marisaBomb1")
		marisaBomb2 =		image_group_find_image(argument0, "_marisaBomb2")
	}
}