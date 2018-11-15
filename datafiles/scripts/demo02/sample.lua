Dir = game.luaScriptDir -- Lua readable script directory
gmDir = game.gmScriptDir -- GameMaker readable script directory

task = require('lua.task') -- Task Scheduler
local GUI = require('assets.GUI')
local shotSheet = require(Dir .. 'ShotSheet.shotsheet')

local thread

-- Loading Assets
function importAssets()
	local group = 'mainTexPage'
	-- Shot Sheet
	shotSheet.loadAssets(group)
end

-- Runs after loading
function initialize()
	-- Assigning Assets to Variables
	local group = 'mainTexPage'
	-- Shot Sheet
	shotSheet.setAssets(group)
	-- GUI Setup
	HPBarType(HP_BAR)
	GUI.SetupGUI()
end

-- Run every game step
function step()
	task.update(1)
end

-- This is a task. It's a lua coroutine ran in a scheduler.
task.spawn(function()
	-- Using task.wait will make the coroutine yield this many times.
	-- The result of the below code means the game will wait 30 frames before executing anything below this
	task.wait(30)
	
	-- The following code will spawn a bullet every 5 frames, looping around in a circle
	local amount = 12
	for i = 1, amount do
		ShotCreate(BALL_M_RED, GetCenterX(), GetCenterY(), 2, i / amount * 360)
		task.wait(5)
	end
	task.wait(60)
	
	-- This code creates bullets with acceleration and deceleration
	local amount = 24
	for i = 1, amount do
		-- Basically if i is divisable by 2
		if i % 2 == 0 then
			-- Acceleration
			ShotCreateA(BALL_M_ORANGE, GetCenterX(), GetCenterY(), 0.5, i / amount * 360, 0.1, 5)
		else
			-- Deceleration, note the negative number
			ShotCreateA(BALL_M_GREEN, GetCenterX(), GetCenterY(), 6, i / amount * 360, -0.5, 1, 10)
		end
		task.wait(5)
	end
	task.wait(60)
	
	-- Bullet groups can be a convenient way to do simple patterns
	local bulletGroup = ShotCreateCircle(SCALE_PURPLE, GetCenterX(), GetCenterY(), 1, 0, 16, 15)
	-- You can manipulate bullet groups easily, here I'm making them additive blended
	ShotSetBlend(bulletGroup, bm_add)
	-- Setting their direction to change every step
	ShotAddDirectionPersistent(bulletGroup, 0.25)
	task.wait(120)
	
	-- Bullet Deleters are another feature, they are simple to use
	-- Lets create some doom for our player and save them with one of these new fangled bullet deleters
	ShotCreateCircle(BALL_M_BLUE, 64, 100, 2, 0, 64, 15)
	ShotCreateCircle(BALL_M_PINK, 128, 100, 2, 0, 64, 15)
	ShotCreateCircle(BALL_M_GREEN, 256, 100, 2, 0, 64, 15)
	ShotCreateCircle(BALL_M_YELLOW, 320, 100, 2, 0, 64, 15)
	-- And the deleter itself
	DeleteShotCircle(PlayerX(), PlayerY(), 50, 180)
	-- I'll turn on hitbox visualization so you can see this fine bullet deleter!
	ShowHitboxes(true)
	task.wait(240)
	ShowHitboxes(false)
	task.wait(60)
	
	-- Now lets show off some fancy bullets. First up, Curvy Lasers!
	local cLaser = ShotCreateCLaserCircle(CLASER_BLUE, GetCenterX(), 150, 3, 0, 8, 48, 16, 15)
	ShotAddDirectionPersistent(cLaser, 0.5)
	task.wait(30)
	local cLaser = ShotCreateCLaserCircle(CLASER_RED, GetCenterX(), 150, 3, 0, 8, 48, 16, 15)
	ShotAddDirectionPersistent(cLaser, -0.5)
	task.wait(120)
	
	-- Now for Static Lasers
	local amount = 12
	for i = 1, amount do
		ShotCreateSLaser(SLASER_RED, 0, GetPlayAreaHeight() * (i / amount), 15 + irandom(30), 450, 12, 180, -1, 45)
		task.wait(2)
		ShotCreateSLaser(SLASER_BLUE, GetPlayAreaWidth(), GetPlayAreaHeight() * (i / amount), 165 + irandom(30), 450, 12, 180, -1, 45)
		task.wait(2)
	end
	task.wait(240)
	
	-- Lets up the complexity! We'll have 2 things going at a time.
	-- How about the above spawning of static lasers plus some fancy bullets
	-- For this lets create 2 tasks that run by themselves!
	local task1 = task.spawn(function()
		local amount = 8
		while true do
			for i = 1, amount do
				ShotCreateSLaser(SLASER_RED, 0, GetPlayAreaHeight() * (i / amount), 5 + irandom(10), 450, 12, 180, -1, 45)
				task.wait(2)
				ShotCreateSLaser(SLASER_BLUE, GetPlayAreaWidth(), GetPlayAreaHeight() * (i / amount), 175 + irandom(10), 450, 12, 180, -1, 45)
				task.wait(2)
			end
			task.wait(180)
		end
	end)
	local task2 = task.spawn(function()
		local amount = 12
		while true do
			ShotCreate(BALL_LL_BLUE, 0, 0, 2, point_direction(0, 0, PlayerX(), PlayerY()))
			task.wait(20)
			ShotCreate(BALL_LL_RED, GetPlayAreaWidth(), 0, 2, point_direction(GetPlayAreaWidth(), 0, PlayerX(), PlayerY()))
			task.wait(20)
		end
	end)
	-- Lets run them for 15 seconds (900 frames) and then end them.
	task.wait(900)
	task.suspend(task1)
	task.suspend(task2)
end)