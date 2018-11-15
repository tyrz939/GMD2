local S = {}

function S.loadAssets(group)
	local dir
	-- Queue Sprites
	dir = 'assets/sprites/'
	-- Hitbox
	LoadQueueAddSprite(group, '_hitbox', dir .. 'hitbox.png', 1, 32, 32)
	-- Reimu
	if GetPlayerID() == 0 then
		LoadQueueAddSpriteExt(group, '_reimu', dir .. 'reimu/reimu.png', 24, 16, 23, 0, 0, 32, 48, 8, 0, 0)
		LoadQueueAddSpriteExt(group, '_reimuOrb', dir .. 'reimu/reimu.png', 1, 8, 8, 96, 144, 16, 16, 1, 0, 0)
		-- Main Shot
		LoadQueueAddSpriteExt(group, '_reimuShot1', dir .. 'reimu/reimu.png', 2, 32, 8, 192, 144, 64, 16, 1, 0, 0)
		LoadQueueAddSpriteExt(group, '_reimuShot1Impact', dir .. 'reimu/reimu.png', 4, 8, 8, 128, 160, 16, 16, 4, 0, 0)
		-- Alt Shots
		LoadQueueAddSpriteExt(group, '_reimuShot2', dir .. 'reimu/reimu.png', 1, 32, 8, 64, 176, 64, 16, 1, 0, 0)
		LoadQueueAddSpriteExt(group, '_reimuShot3', dir .. 'reimu/reimu.png', 1, 8, 8, 0, 144, 16, 16, 1, 0, 0)
		LoadQueueAddSpriteExt(group, '_reimuShot3Impact', dir .. 'reimu/reimu.png', 4, 8, 8, 0, 160, 16, 16, 4, 0, 0)
		-- Bomb
		LoadQueueAddSprite(group, '_reimuBomb', dir .. 'reimu/seal.png', 1, 64, 64)
	end
	-- Marisa
	if GetPlayerID() == 10 then
		LoadQueueAddSpriteExt(group, '_marisa', dir .. 'marisa/marisa.png', 24, 16, 23, 0, 0, 32, 48, 8, 0, 0)
		LoadQueueAddSpriteExt(group, '_marisaOrb', dir .. 'marisa/marisa.png', 1, 8, 8, 80, 160, 16, 16, 1, 0, 0)
		-- Main Shot
		LoadQueueAddSpriteExt(group, '_marisaShot1', dir .. 'marisa/marisa.png', 1, 16, 8, 0, 144, 32, 16, 1, 0, 0)
		LoadQueueAddSpriteExt(group, '_marisaShot1Impact', dir .. 'marisa/marisa.png', 3, 16, 8, 32, 144, 32, 16, 3, 0, 0)
		-- Alt Shots
		LoadQueueAddSprite3dExt(group, '_marisaLaser', dir .. 'marisa/marisa.png', 1, 256, 8, 0, 176, 256, 16, 1, 0, 0)
		LoadQueueAddSpriteExt(group, '_marisaLaserStar', dir .. 'marisa/marisa.png', 1, 16, 16, 0, 192, 32, 32, 1, 0, 0)
		LoadQueueAddSpriteExt(group, '_marisaLaserImpact', dir .. 'marisa/marisa.png', 1, 16, 4, 32, 160, 32, 8, 1, 0, 0)
		LoadQueueAddSpriteExt(group, '_marisaShot2', dir .. 'marisa/marisa.png', 2, 16, 8, 128, 190, 32, 16, 2, 0, 0)
		LoadQueueAddSpriteExt(group, '_marisaShot2Impact', dir .. 'marisa/marisa.png', 8, 16, 16, 0, 224, 32, 32, 8, 0, 0)
		-- Bomb
		LoadQueueAddSprite(group, '_marisaBomb1', dir .. 'marisa/spark.png', 1, 16, 64)
		LoadQueueAddSprite(group, '_marisaBomb2', dir .. 'marisa/ring.png', 1, 48, 128)
	end

	
	-- Queue SFX
	dir = 'assets/sfx/'
	LoadQueueAddWav(dir .. 'sfx_hitEnemy.wav', 0.1, '_hitEnemy')
	LoadQueueAddWav(dir .. 'sfx_masterSpark.wav', 1, '_masterSpark')
	LoadQueueAddWav(dir .. 'sfx_graze.wav', 0.6, '_graze')
	LoadQueueAddWav(dir .. 'sfx_extend.wav', 1, '_extend')
	LoadQueueAddWav(dir .. 'sfx_playerShot.wav', 0.08, '_playerShot')
	LoadQueueAddWav(dir .. 'sfx_spellcard.wav', 1, '_spellcard')
	LoadQueueAddWav(dir .. 'sfx_phaseBreak.wav', 0.8, '_phaseBreak')
	LoadQueueAddWav(dir .. 'sfx_pickup.wav', 0.2, '_pickup')
	LoadQueueAddWav(dir .. 'sfx_playerDeath.wav', 0.3, '_playerDeath')
end

function S.setAssets(group)
	-- Find Sprites
	-- Hitbox
	game.hitboxSprite =	FindSprite(group, '_hitbox')
	-- Reimu
	if GetPlayerID() == 0 then
		game.playerSprite =		FindSprite(group, '_reimu')
		game.reimuOrb =			FindSprite(group, '_reimuOrb')
		game.reimuShot1 =		FindSprite(group, '_reimuShot1')
		game.reimuShot1Impact =	FindSprite(group, '_reimuShot1Impact')
		game.reimuShot2 =		FindSprite(group, '_reimuShot2')
		game.reimuShot3 =		FindSprite(group, '_reimuShot3')
		game.reimuShot3Impact =	FindSprite(group, '_reimuShot3Impact')
		game.reimuBomb =		FindSprite(group, '_reimuBomb')
	end
	-- Marisa
	if GetPlayerID() == 10 then
		game.playerSprite =		FindSprite(group, '_marisa')
		game.marisaOrb =		FindSprite(group, '_marisaOrb')
		game.marisaShot1 =		FindSprite(group, '_marisaShot1')
		game.marisaShot1Impact =FindSprite(group, '_marisaShot1Impact')
		game.marisaLaser =		FindSprite(group, '_marisaLaser')
		game.marisaLaserStar =	FindSprite(group, '_marisaLaserStar')
		game.marisaLaserImpact =FindSprite(group, '_marisaLaserImpact')
		game.marisaShot2 =		FindSprite(group, '_marisaShot2')
		game.marisaShot2Impact =FindSprite(group, '_marisaShot2Impact')
		game.marisaBomb1 =		FindSprite(group, '_marisaBomb1')
		game.marisaBomb2 =		FindSprite(group, '_marisaBomb2')
	end
	
	-- Find SFX
	game.sfxHitEnemy =		FindWav('_hitEnemy')
	game.sfxMasterSpark =	FindWav('_masterSpark')
	game.sfxGraze =			FindWav('_graze')
	game.sfxExtend =		FindWav('_extend')
	game.sfxPlayerShot =	FindWav('_playerShot')
	game.sfxSpellcard =		FindWav('_spellcard')
	game.sfxPhaseBreak =	FindWav('_phaseBreak')
	game.sfxPickup =		FindWav('_pickup')
	game.sfxPlayerDeath =	FindWav('_playerDeath')
end

return S