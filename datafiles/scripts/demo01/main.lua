Dir = game.luaScriptDir -- Lua readable script directory
gmDir = game.gmScriptDir -- GameMaker readable script directory

task = require('lua.task') -- Task Scheduler

local shotSheet = require(Dir .. 'ShotSheet.shotsheet')
local backgroundScript = require(Dir .. '3dBackground.background')
local stage = require(Dir .. 'stage')

-- Loading Assets
function importAssets()
	local group = 'mainTexPage'
	-- Shot Sheet
	shotSheet.loadAssets(group)
	-- 3D
	backgroundScript.loadAssets3d(group)
	-- Interface
	LoadQueueAddSprite(group, 'interface', gmDir .. 'gui/interface.png', 1, 0, 0)
	LoadQueueAddSprite(group, 'guiElements', gmDir .. 'gui/e1.png', 4, 0, 0)
	-- Boss
	LoadQueueAddSprite(group, 'flandre', gmDir .. 'flandre.png', 4, 32, 32)
	LoadQueueAddSprite(group, 'bossbg', gmDir .. 'bossbg.png', 1, 0, 0)
	LoadQueueAddSprite(group, 'hexagram', gmDir .. 'hexagram.png', 1, 128, 128)
	
	-- Add MUSIC
	LoadQueueAddBGM(gmDir .. 'th06_01.mid', 1, 'bgm1')
	LoadQueueAddBGM(gmDir .. 'th06_15.mid', 1, 'bgm2')
	
	-- Font
	LoadQueueAddSpriteFontExt(gmDir .. 'unispace.png', 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.,;.?!-_~#\'&()[]|`/@°+=*$<>% ', true, 1, 23, 40, 11, 91, 'font1')
end

-- Runs after loading
function initialize()
	-- Assigning Assets to Variables
	local group = 'mainTexPage'
	-- Shot Sheet
	shotSheet.setAssets(group)
	-- 3D
	backgroundScript.setAssets3d(group)
	-- 3D Variables
	backgroundScript.init()
	-- Background Interface
	GUISetBackground(FindSprite(group, 'interface'))
	spr_guiElements = FindSprite(group, 'guiElements')
	-- Boss Sprite
	spr_flandre = FindSprite(group, 'flandre')
	bossBackground = FindSprite(group, 'bossbg')
	spr_hexagram = FindSprite(group, 'hexagram')
	
	-- Find MUSIC
	bgm1 = FindBGM('bgm1')
	bgm2 = FindBGM('bgm2')
	
	-- Find Font
	font1 = FindFont('font1')
	
	
	-- Play area setup. StartX, StartY, Width, Hight
	PlayFieldSetup(32, 16, 384, 448) -- Default (32, 16, 384, 448)
	-- Bullet Auto Delete (relative to play field)
	ShotAutoDeleteEdges(64, 64, 64, 64) -- Default all 64
	-- Default spawn in animation time for bullets
	ShotSetDefaultDelay(10) -- Default 10
	-- Boundary for player movement. Left, Right, Top, Bottom
	SetPlayerBoundary(10, 10, 20, 15) -- Default (10, 10, 20, 15)
	-- Player Spawn Location. X, Y
	SetPlayerSpawn(192, 448+24, 192, 448-48) -- Default (192, 448+24, 192, 448-48)

	-- Starting Values
	SetLives(2)
	SetBombs(3)
	SetPower(4)
	SetContinues(3)
	
	-- GUI Setup
	HPBarType(HP_BAR)
	
	local refX = 832
	local refY = 0
	GUIAddSetFont(font1)
	GUIAddText(refX + 32, refY + 100, "Score")
	GUIAddSetHAlign(FA_RIGHT)
	GUIAddVariable(refX + 416, refY + 100, "score")
	-- Lives
	GUIAddSetHAlign(FA_LEFT)
	GUIAddSetColor(make_color_rgb(255, 127, 255))
	GUIAddText(refX + 32, refY + 250, "Player")
	GUIAddSpriteRow(refX + 224, refY + 255, "lives", 8, 8, 24, spr_guiElements, 0, spr_guiElements, 1)
	-- Bombs
	GUIAddSetColor(make_color_rgb(127, 255, 127))
	GUIAddText(refX + 32, refY + 300, "Bombs")
	GUIAddSpriteRow(refX + 224, refY + 305, "bombs", 8, 8, 24, spr_guiElements, 2, spr_guiElements, 3)
	-- Power
	GUIAddSetColor(make_color_rgb(255, 127, 64))
	GUIAddText(refX + 32, refY + 350, "Power")
	GUIAddSetHAlign(FA_RIGHT)
	GUIAddVariable(refX + 416, refY + 350, "power/max")
	-- Graze
	GUIAddSetHAlign(FA_LEFT)
	GUIAddSetColor(make_color_rgb(255, 255, 255))
	GUIAddText(refX + 32, refY + 400, "Graze")
	GUIAddSetHAlign(FA_RIGHT)
	GUIAddVariable(refX + 416, refY + 400, "graze")
end

-- Run every game step
function step()
	task.update()
	
	-- 3D Background
	backgroundScript.step()
end

-- Main Coroutine
task.spawn(function()
	PlayBGM(bgm1, true)
	task.wait(120)
	
	-- Boss Creation and Setup
	boss = BossCreate(400, -100, spr_flandre)
	BossSetBackSprite(boss, spr_hexagram, 0.8, 1, 2, 6, 0.5)
	EnemyShotCollisionRectangle(boss, 40, 50)
	EnemyPlayerCollisionRectangle(boss, 20, 25)
	
	BossSetDistortion(boss, true, 1.2, make_color_rgb(50, 0, 50), 0.5)
	BossSetTrail(boss, true, 15, 1.5, c_white, 0.15)
	EnemySetAniSpeed(boss, 12)
	
	MoveSetTween('EaseOutCubic')
	MoveTween(boss, 192, 150, 120)
	
	task.wait(180)
	
	local phase, phaseID
	-- Dialogue
	phaseID = BossDialogueSetup(boss)
	phase = stage.bossStartDialogue()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	
	BGMFadeOut(60)
	task.wait(60)
	PlayBGM(bgm2, true)
	task.wait(150)
	
	-- Nonspell 1
	phaseID = NonspellSetup(boss, 20, 1000, 0.3)
	phase = stage.bossNonspell1()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	task.wait(60)
	
	-- Spellcard 1
	phaseID = SpellcardSetup(boss, 40, 5000, false, 2000, 'Taboo \'Cranberry Trap\'')
	phase = stage.bossSpellcard1()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	task.wait(60)
	
	-- Nonspell 2
	phaseID = NonspellSetup(boss, 20, 1000, 0.3)
	phase = stage.bossNonspell2()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	task.wait(60)
	
	-- Spellcard 2
	phaseID = SpellcardSetup(boss, 40, 5000, false, 2000, 'Taboo \'Lavatein\'')
	phase = stage.bossSpellcard2()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	task.wait(60)
	
	-- Nonspell 3
	phaseID = NonspellSetup(boss, 20, 1000, 0.3)
	phase = stage.bossNonspell3()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	task.wait(60)
	
	-- Spellcard 3
	phaseID = SpellcardSetup(boss, 40, 5000, false, 1500, 'Taboo \'Four of a Kind\'')
	phase = stage.bossSpellcard3()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	task.wait(60)
	
	-- Nonspell 4
	phaseID = NonspellSetup(boss, 20, 1000, 0.3)
	phase = stage.bossNonspell4()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	task.wait(60)
	
	-- Spellcard 4
	phaseID = SpellcardSetup(boss, 40, 5000, false, 2000, 'Taboo \'Kagome, Kagome\'')
	phase = stage.bossSpellcard4()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	instance_destroy(obj_bulletParent) -- Clean up??
	task.wait(60)
	
	-- Nonspell 5
	phaseID = NonspellSetup(boss, 20, 1000, 0.3)
	phase = stage.bossNonspell5()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	task.wait(60)
	
	-- Spellcard 5
	phaseID = SpellcardSetup(boss, 60, 5000, false, 1500, 'Taboo \'Maze of Love\'')
	phase = stage.bossSpellcard5()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	task.wait(60)
	
	-- Nonspell 6
	phaseID = NonspellSetup(boss, 20, 1000, 0.3)
	phase = stage.bossNonspell6()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	task.wait(60)
	
	-- Spellcard 6
	phaseID = SpellcardSetup(boss, 60, 5000, false, 2000, 'Forbidden Barrage \'Starbow Break\'')
	phase = stage.bossSpellcard6()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	task.wait(60)
	
	-- Nonspell 7
	phaseID = NonspellSetup(boss, 20, 1000, 0.3)
	phase = stage.bossNonspell7()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	task.wait(60)
	
	-- Spellcard 7
	phaseID = SpellcardSetup(boss, 60, 5000, false, 2000, 'Forbidden Barrage \'Catadioptric\'')
	phase = stage.bossSpellcard7()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	task.wait(60)
	
	-- Nonspell 8
	phaseID = NonspellSetup(boss, 20, 1000, 0.3)
	phase = stage.bossNonspell8()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	task.wait(60)
	
	-- Spellcard 8
	phaseID = SpellcardSetup(boss, 60, 5000, false, 2000, 'Forbidden Barrage \'Counter Clock\'')
	phase = stage.bossSpellcard8()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	task.wait(60)
	
	-- Spellcard 9
	phaseID = SpellcardSetup(boss, 85, 5000, true, 2000, 'Secret Barrage\n\'And Then Will There Be None?\'')
	phase = stage.bossSpellcard9()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	BossVisible(boss, true)
	task.wait(60)
	
	-- Spellcard 10
	phaseID = SpellcardSetup(boss, 100, 5000, false, 3000, 'Q.E.D. \'Ripples of 495 Years\'')
	phase = stage.bossSpellcard10()
	while phaseID == BossGetPhaseID(boss) do task.wait(1) end
	task.suspend(phase)
	task.wait(60)
	
	task.wait(180)
	GameEnd()
end)