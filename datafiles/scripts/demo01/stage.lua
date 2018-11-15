local S = {}
local phase

local function background()
	local pid = BossGetPhaseID(boss)
	task.spawn(function()
		local alpha = 0
		local bg = draw_image(bossBackground, 15000, 0, 0, 0)
		while alpha < 1 do
			alpha = alpha + 0.04
			SetDrawAlpha(bg, alpha)
			task.wait(1)
		end
		d3dDraw(false)
		while pid == BossGetPhaseID(boss) do
			task.wait(1)
		end
		draw_clear()
		d3dDraw(true)
	end)
end
--[[
	Dialogue
]]
function S.bossStartDialogue()
	phase = task.spawn(function()
		if GetPlayerID() == 0 then -- if Reimu
			DialogueAdd(player, 'Hello there,\nHow\'re you Flandre?\n', 1)
			while DialogueWait() do task.wait(1) end
			DialogueReset()
			DialogueAdd(boss, 'Great, Raymoo', 3)
			while DialogueWait() do task.wait(1) end
			DialogueReset()
			DialogueAdd(player, 'WHAT DID YOU\nCALL ME?', 1)
			while DialogueWait() do task.wait(1) end
			DialogueReset()
			DialogueAdd(boss, 'Ray...moo?', 10)
			while DialogueWait() do task.wait(1) end
			DialogueReset()
			DialogueAdd(player, 'DIE NOW', 1)
			while DialogueWait() do task.wait(1) end
			DialogueEnd()
		elseif GetPlayerID() == 10 then -- if Marisa
			DialogueAdd(player, 'Hello there,\nHow\'re you Flandre?\n', 1)
			while DialogueWait() do task.wait(1) end
			DialogueReset()
			DialogueAdd(boss, 'Great, Malisa', 3)
			while DialogueWait() do task.wait(1) end
			DialogueReset()
			DialogueAdd(player, 'WHAT DID YOU\nCALL ME?', 1)
			while DialogueWait() do task.wait(1) end
			DialogueReset()
			DialogueAdd(boss, 'Ma..li..sa?', 10)
			while DialogueWait() do task.wait(1) end
			DialogueReset()
			DialogueAdd(player, 'DIE NOW', 1)
			while DialogueWait() do task.wait(1) end
			DialogueEnd()
		end
	end)
	return phase
end
--[[
	Nonspell 1
]]
function S.bossNonspell1()
	phase = task.spawn(function()
		-- making a function for code reuse
		local function shotLoop()
			local r = random(360)
			ShotCreateCircleA(RICE_M_RED, GetX(boss), GetY(boss), 6, r, 40, 15, -0.5, 1.2, 0, SHOOT1)
			ShotCreateCircleA(RICE_M_RED, GetX(boss), GetY(boss), 6, r, 40, 15, -0.5, 1.6)
		end
		while true do
			shotLoop()
			task.wait(45)
			shotLoop()
			task.wait(45)
			MoveRandomTween(boss, 60, 30)
		end
	end)
	return phase
end
--[[
	Spellcard 1
]]
function S.bossSpellcard1()
	background()
	phase = task.spawn(function()
		-- Increase speed over time
		local spawnSpeed = 20
		local function speedIncrease()
			task.wait(15)
			if spawnSpeed > 12 then
				spawnSpeed = spawnSpeed - 2
			end
		end
		-- Shot Movement Speed
		MoveTween(boss, 192, 150, 120)
		while true do
			local speed = 1
			local y1 = 0
			local x1 = 0
			local y2 = 448
			local x2 = 384
			local c = 0
			local img1 = draw_image_ext(spr_hexagram, 100, 0, x1, y1, 0.25, 0.25, 0, c_white, 0.5)
			local img2 = draw_image_ext(spr_hexagram, 100, 0, x2, y2, 0.25, 0.25, 0, c_white, 0.5)
			while y1 < 448 do
				task.wait(1)
				y1 = y1 + 3.5
				y2 = y2 - 3.5
				SetXY(img1, x1, y1)
				SetXY(img2, x2, y2)
				if c % spawnSpeed == 0 then
					ShotCreate(BALL_MO_PURPLE, x1, y1, speed, point_direction(x1, y1, GetCenterX(), GetCenterY()), SHOOT1)
					ShotCreate(BALL_MO_PURPLE, x2, y2, speed, point_direction(x2, y2, GetCenterX(), GetCenterY()))
				end
				c = c + 1
			end
			speedIncrease()
			local x3 = 0
			local y3 = 448
			local x4 = 384
			local y4 = 0
			local img3 = draw_image_ext(spr_hexagram, 100, 0, x3, y3, 0.25, 0.25, 0, c_white, 0.5)
			local img4 = draw_image_ext(spr_hexagram, 100, 0, x4, y4, 0.25, 0.25, 0, c_white, 0.5)
			while y4 < 448 do
				task.wait(1)
				x1 = x1 + 3
				x2 = x2 - 3
				y3 = y3 - 3.5
				y4 = y4 + 3.5
				SetXY(img1, x1, y1)
				SetXY(img2, x2, y2)
				SetXY(img3, x3, y3)
				SetXY(img4, x4, y4)
				if c % spawnSpeed == 0 then
					ShotCreate(BALL_MO_PURPLE, x1, y1, speed, point_direction(x1, y1, GetCenterX(), GetCenterY()), SHOOT1)
					ShotCreate(BALL_MO_PURPLE, x2, y2, speed, point_direction(x2, y2, GetCenterX(), GetCenterY()))
					ShotCreate(BALL_M_BLUE, x3, y3, speed, point_direction(x3, y3, PlayerX(), PlayerY()))
					ShotCreate(BALL_M_BLUE, x4, y4, speed, point_direction(x4, y4, PlayerX(), PlayerY()))
				end
				c = c + 1
			end
			speedIncrease()
			while y2 < 448 do
				task.wait(1)
				y1 = y1 - 3.5
				y2 = y2 + 3.5
				x3 = x3 + 3
				x4 = x4 - 3
				SetXY(img1, x1, y1)
				SetXY(img2, x2, y2)
				SetXY(img3, x3, y3)
				SetXY(img4, x4, y4)
				if c % spawnSpeed == 0 then
					ShotCreate(BALL_MO_PURPLE, x1, y1, speed, point_direction(x1, y1, GetCenterX(), GetCenterY()), SHOOT1)
					ShotCreate(BALL_MO_PURPLE, x2, y2, speed, point_direction(x2, y2, GetCenterX(), GetCenterY()))
					ShotCreate(BALL_M_BLUE, x3, y3, speed, point_direction(x3, y3, PlayerX(), PlayerY()))
					ShotCreate(BALL_M_BLUE, x4, y4, speed, point_direction(x4, y4, PlayerX(), PlayerY()))
				end
				c = c + 1
			end
			speedIncrease()
			local y1 = 448
			local x1 = 0
			local y2 = 448
			local x2 = 0
			local x3 = 384
			local y3 = 0
			local x4 = 384
			local y4 = 0
			while y1 > 0 do
				task.wait(1)
				y1 = y1 - 3.5
				x2 = x2 + 3
				y3 = y3 + 3.5
				x4 = x4 - 3
				SetXY(img1, x1, y1)
				SetXY(img2, x2, y2)
				SetXY(img3, x3, y3)
				SetXY(img4, x4, y4)
				if c % spawnSpeed == 0 then
					ShotCreate(BALL_MO_PURPLE, x1, y1, speed, point_direction(x1, y1, GetCenterX(), GetCenterY()), SHOOT1)
					ShotCreate(BALL_MO_PURPLE, x2, y2, speed, point_direction(x2, y2, GetCenterX(), GetCenterY()))
					ShotCreate(BALL_MO_PURPLE, x3, y3, speed, point_direction(x3, y3, GetCenterX(), GetCenterY()))
					ShotCreate(BALL_MO_PURPLE, x4, y4, speed, point_direction(x4, y4, GetCenterX(), GetCenterY()))
				end
				c = c + 1
			end
			speedIncrease()
			local y1 = 0
			local x1 = 0
			local y2 = 448
			local x2 = 0
			local x3 = 384
			local y3 = 0
			local x4 = 384
			local y4 = 448
			while y1 < 448 do
				task.wait(1)
				y1 = y1 + 3.5
				y2 = y2 - 3.5
				y3 = y3 + 3.5
				y4 = y4 - 3.5
				SetXY(img1, x1, y1)
				SetXY(img2, x2, y2)
				SetXY(img3, x3, y3)
				SetXY(img4, x4, y4)
				if c % spawnSpeed == 0 then
					ShotCreate(BALL_M_BLUE, x1, y1, speed, point_direction(x1, y1, PlayerX(), PlayerY()), SHOOT1)
					ShotCreate(BALL_M_BLUE, x2, y2, speed, point_direction(x2, y2, PlayerX(), PlayerY()))
					ShotCreate(BALL_M_BLUE, x3, y3, speed, point_direction(x3, y3, PlayerX(), PlayerY()))
					ShotCreate(BALL_M_BLUE, x4, y4, speed, point_direction(x4, y4, PlayerX(), PlayerY()))
				end
				c = c + 1
			end
			speedIncrease()
			local y1 = 0
			local x1 = 0
			local y2 = 448
			local x2 = 0
			local x3 = 384
			local y3 = 0
			local x4 = 384
			local y4 = 448
			while y1 < 448 do
				task.wait(1)
				y1 = y1 + 3.5
				y2 = y2 - 3.5
				y3 = y3 + 3.5
				y4 = y4 - 3.5
				SetXY(img1, x1, y1)
				SetXY(img2, x2, y2)
				SetXY(img3, x3, y3)
				SetXY(img4, x4, y4)
				if c % spawnSpeed == 0 then
					ShotCreate(BALL_MO_PURPLE, x1, y1, speed, point_direction(x1, y1, GetCenterX(), GetCenterY()), SHOOT1)
					ShotCreate(BALL_MO_PURPLE, x2, y2, speed, point_direction(x2, y2, GetCenterX(), GetCenterY()))
					ShotCreate(BALL_MO_PURPLE, x3, y3, speed, point_direction(x3, y3, GetCenterX(), GetCenterY()))
					ShotCreate(BALL_MO_PURPLE, x4, y4, speed, point_direction(x4, y4, GetCenterX(), GetCenterY()))
				end
				if (c+3) % spawnSpeed == 0 then
					ShotCreate(BALL_MO_PURPLE, x1, y1, speed, point_direction(x1, y1, GetCenterX(), GetCenterY()))
					ShotCreate(BALL_MO_PURPLE, x4, y4, speed, point_direction(x4, y4, GetCenterX(), GetCenterY()))
				end
				c = c + 1
			end
			instance_destroy(img1)
			instance_destroy(img2)
			instance_destroy(img3)
			instance_destroy(img4)
		end
	end)
	-- Movement, seperate coroutine for this one
	task.spawn(function()
		local pid = BossGetPhaseID(boss)
		while pid == BossGetPhaseID(boss) do
			task.wait(180)
			-- Kill coroutine if phase changes
			if pid == BossGetPhaseID(boss) then
				MoveRandomTween(boss, 60, 100)
			end
		end
	end)
	return phase
end
--[[
	Nonspell 2
]]
function S.bossNonspell2()
	phase = task.spawn(function()
		MoveTween(boss, 192, 150, 120)
		local function shotLoop()
			local r = random(360)
			ShotCreateCircleA(RICE_M_RED, GetX(boss), GetY(boss), 6, r, 40, 15, -0.5, 1.2, 0, SHOOT1)
			ShotCreateCircleA(RICE_M_RED, GetX(boss), GetY(boss), 6, r, 40, 15, -0.5, 1.6)
		end
		while true do
			shotLoop()
			task.wait(30)
			shotLoop()
			task.wait(30)
			shotLoop()
			task.wait(30)
			MoveRandomTween(boss, 60, 30)
		end
	end)
	return phase
end
--[[
	Spellcard 2
]]
function S.bossSpellcard2()
	background()
	phase = task.spawn(function()
		local function ShotLine(direction, shotDirection, amount, length)
			for i = 0, amount-1 do
				local x1 = GetX(boss) + lengthdir_x(i * (length/amount), direction)
				local y1 = GetY(boss) + lengthdir_y(i * (length/amount), direction)
				ShotCreateA(RICE_M_RED, x1, y1, 0.5, direction + shotDirection, 0.01, 1, 0, SHOOT1)
			end
		end
		MoveTween(boss, 192, 150, 120)
		while true do
			local direction, laser
			direction = 165
			laser = ShotCreateSLaser(SLASER_M_RED, GetX(boss), GetY(boss), direction, 400, 24, 150, LASER1)
			for c = 0, 150 do
				task.wait(1)
				if c % 8 == 0 then
					ShotLine(direction, -90, 8, 384)
				end
				direction = direction - 1.8
				ShotSetDirection(laser, direction)
				SetXY(laser, GetX(boss), GetY(boss))
			end
			
			MoveTween(boss, 5, 32, 120)
			task.wait(120)
			laser = ShotCreateSLaser(SLASER_M_RED, GetX(boss), GetY(boss), 270, 500, 24, 150, LASER1)
			task.wait(15)
			MoveTween(boss, 352, 64, 150, 'EaseOutSine')
			for i = 0, 150 do
				SetXY(laser, GetX(boss), GetY(boss))
				if i % 8 == 0 and i < 150 then
					ShotLine(270, 90, 8, 384)
				end
				task.wait(1)
			end
			
			MoveTween(boss, 379, 32, 15)
			task.wait(15)
			laser = ShotCreateSLaser(SLASER_M_RED, GetX(boss), GetY(boss), 270, 500, 24, 150, LASER1)
			task.wait(15)
			MoveTween(boss, 32, 64, 150, 'EaseOutSine')
			for i = 0, 150 do
				SetXY(laser, GetX(boss), GetY(boss))
				if i % 8 == 0 and i < 150 then
					ShotLine(270, -90, 8, 384)
				end
				task.wait(1)
			end
			
			MoveTween(boss, 192, 150, 120)
			direction = 15
			laser = ShotCreateSLaser(SLASER_M_RED, GetX(boss), GetY(boss), direction, 400, 24, 150, LASER1)
			for c = 0, 150 do
				task.wait(1)
				if c % 8 == 0 then
					ShotLine(direction, 90, 8, 384)
				end
				direction = direction + 1.8
				ShotSetDirection(laser, direction)
				SetXY(laser, GetX(boss), GetY(boss))
			end
			task.wait(30)
		end
	end)
	return phase
end
--[[
	Nonspell 3
]]
function S.bossNonspell3()
	phase = task.spawn(function()
		MoveTween(boss, 192, 150, 120)
		local function shotLoop()
			local r = random(360)
			ShotCreateCircleA(RICE_M_RED, GetX(boss), GetY(boss), 6, r, 30, 15, -0.5, 1, 0, SHOOT1)
			ShotCreateCircleA(RICE_M_RED, GetX(boss), GetY(boss), 6, r, 30, 15, -0.5, 2)
			ShotCreateCircleA(RICE_M_RED, GetX(boss), GetY(boss), 6, r, 30, 15, -0.5, 3)
		end
		while true do
			shotLoop()
			task.wait(45)
			shotLoop()
			task.wait(45)
			MoveRandomTween(boss, 60, 30)
		end
	end)
	return phase
end
--[[
	Spellcard 3
]]
function S.bossSpellcard3()
	background()
	local flanClone =  {}
	flanClone[1] = EnemyCreate(-50, 150, 1000, spr_flandre)
	flanClone[2] = EnemyCreate(256, -50, 1000, spr_flandre)
	flanClone[3] = EnemyCreate(384 + 50, 150, 1000, spr_flandre)
	MoveTween(flanClone[1], 80, 150, 120)
	MoveTween(boss, 160, 150, 120)
	MoveTween(flanClone[2], 240, 150, 120)
	MoveTween(flanClone[3], 320, 150, 120)
	for i = 1, 3 do
		EnemyShotCollisionRectangle(flanClone[i], 40, 50)
		EnemyPlayerCollisionRectangle(flanClone[i], 20, 25)
		EnemySetAniSpeed(flanClone[i], 12)
	end
	
	local function Shoot(x, y)
		local r = random(360)
		ShotCreateCircleA(RICE_M_RED, x, y, 6, r, 20, 15, -0.5, 1.5, 0, SHOOT1)
	end
	
	phase = task.spawn(function()
		task.wait(120)
		-- Flan 1
		task.spawn(function()
			local timer = irandom(180)
			while instance_exists(flanClone[1]) do
				timer = timer + 1
				if timer % 90 == 0 then Shoot(GetX(flanClone[1]), GetY(flanClone[1])) end
				if timer % 360 == 0 then
					timer = irandom(180)
					local a = 30
					local r = random(360)
					ShotCreateCircle(BALL_L2_BLUE, GetX(flanClone[1]), GetY(flanClone[1]), 3, r, a, 15, SHOOT1)
					ShotCreateCircle(BALL_L2_BLUE, GetX(flanClone[1]), GetY(flanClone[1]), 2.5, r, a, 15)
					ShotCreateCircle(BALL_L2_BLUE, GetX(flanClone[1]), GetY(flanClone[1]), 2, r, a, 15)
				end
				if timer % 240 == 0 then MoveRandomTween(flanClone[1], 60, 30) end
				task.wait(1)
			end
		end)
		-- Flan 2
		task.spawn(function()
			local timer = irandom(180)
			while instance_exists(flanClone[2]) do
				timer = timer + 1
				if timer % 90 == 0 then Shoot(GetX(flanClone[2]), GetY(flanClone[2])) end
				if timer % 360 == 0 then
					timer = irandom(180)
					local a = 8
					local r = random(360)
					for i = 1, 10 do
						ShotCreateCircle(BALL_L2_YELLOW, GetX(flanClone[2]), GetY(flanClone[2]), 4 - (i * 0.3), r, a, 15, SHOOT1)
					end
				end
				if timer % 240 == 0 then MoveRandomTween(flanClone[2], 60, 30) end
				task.wait(1)
			end
		end)
		-- Flan 3
		task.spawn(function()
			local timer = irandom(180)
			while instance_exists(flanClone[3]) do
				timer = timer + 1
				if timer % 90 == 0 then Shoot(GetX(flanClone[3]), GetY(flanClone[3])) end
				if timer % 360 == 0 then
					timer = irandom(180)
					local a = 7
					local r = point_direction(GetX(flanClone[3]), GetY(flanClone[3]), PlayerX(), PlayerY())
					for i = 1, 10 do
						ShotCreateArc(BALL_L2_GREEN, GetX(flanClone[3]), GetY(flanClone[3]), 4 - (i * 0.3), r, a, 135, 15, SHOOT1)
					end
				end
				if timer % 240 == 0 then MoveRandomTween(flanClone[3], 60, 30) end
				task.wait(1)
			end
		end)
		
		local t = 0
		while true do
			t = t + 1
			if t % 90 == 0 then Shoot(GetX(boss), GetY(boss)) end
			if t % 240 == 0 then MoveRandomTween(boss, 60, 30) end
			task.wait(1)
		end
	end)
	
	-- Clean up
	task.spawn(function()
		local pid = BossGetPhaseID(boss)
		while pid == BossGetPhaseID(boss) do task.wait(1) end
		for i = 1, 3 do
			if instance_exists(flanClone[i]) then instance_destroy(flanClone[i]) end
		end
	end)
	return phase
end
--[[
	Nonspell 4
]]
function S.bossNonspell4()
	phase = task.spawn(function()
		MoveTween(boss, 192, 150, 120)
		local function ShotLoop()
			local r = random(360)
			ShotCreateCircleA(RICE_M_BLUE, GetX(boss), GetY(boss), 6, r, 40, 15, -0.5, 1.2, 0, SHOOT1)
			ShotCreateCircleA(RICE_M_BLUE, GetX(boss), GetY(boss), 6, r, 40, 15, -0.5, 1.6)
		end
		while true do
			ShotLoop()
			task.wait(45)
			ShotLoop()
			task.wait(45)
			MoveRandomTween(boss, 60, 30)
		end
	end)
	return phase
end
--[[
	Spellcard 4
]]
function S.bossSpellcard4()
	background()
	MoveTween(boss, 192, 150, 120)
	local pid = BossGetPhaseID(boss)
	-- Well this is awkward. Making green bullets move away from the large yellow one
	local function Shoot(direction)
		task.spawn(function()
			local shot = ShotCreate(BALL_LL_YELLOW, GetX(boss), GetY(boss), 4, direction, SHOOT1)
			ShotSetBlend(shot, bm_add)
			while instance_exists(shot) do
				local x = GetX(shot)
				local y = GetY(shot)
				local working = true
				while working do
					local inst = instance_nearest(x, y, obj_bullet)
					if instance_exists(inst) then
						if ShotGetType(inst) == BALL_MO_DKGREEN and ShotGetSpeed(inst) == 0 then
							local ix = GetX(inst)
							local iy = GetY(inst)
							if point_distance(x, y, ix, iy) < 100 then
								local dir = point_direction(x, y, ix, iy)
								local newInst = ShotCreateA(BALL_MO_GREEN, ix, iy, 0.1, dir, 0.01, 1, 0, false, 0)
								instance_destroy(inst)
								instance_deactivate_object(newInst)
							else
								working = false
							end
						else
							instance_deactivate_object(inst)
						end
					else
						working = false
					end
				end
				instance_activate_all()
				task.wait(1)
			end
		end)
	end
	local function Trail(x, y, direction)
		task.spawn(function()
			while x >= 0 and x <= GetPlayAreaWidth() and y >= 0 and y <= GetPlayAreaHeight() and pid == BossGetPhaseID(boss) do
				x = x + lengthdir_x(15, direction)
				y = y + lengthdir_y(15, direction)
				ShotCreate(BALL_MO_DKGREEN, x, y, 0, 0, SHOOT1, 25)
				task.wait(5)
			end
		end)
	end
	phase = task.spawn(function()
		while true do
			Trail(64, 0, 270)
			Trail(384, 96, 180)
			Trail(0, 128, 0)
			task.wait(30)
			Trail(128, 0, 270)
			Trail(384, 192, 180)
			Trail(0, 256, 0)
			task.wait(60)
			Trail(256, 0, 270)
			Trail(384, 64, 180)
			Trail(0, 320, 0)
			task.wait(30)
			Trail(320, 0, 270)
			Trail(384, 156, 180)
			Trail(0, 224, 0)
			task.wait(30)
			Shoot(point_direction(GetX(boss), GetY(boss), PlayerX(), PlayerY()))
			task.wait(90)
			Shoot(point_direction(GetX(boss), GetY(boss), PlayerX(), PlayerY()))
			task.wait(60)
			Trail(384, 0, 225)
			task.wait(5)
			Trail(384, 128, 225)
			Trail(384, 256, 225)
			task.wait(60)
			Shoot(point_direction(GetX(boss), GetY(boss), PlayerX(), PlayerY()))
			task.wait(90)
			Shoot(point_direction(GetX(boss), GetY(boss), PlayerX(), PlayerY()))
			Shoot(point_direction(GetX(boss), GetY(boss), PlayerX(), PlayerY())+45)
			Shoot(point_direction(GetX(boss), GetY(boss), PlayerX(), PlayerY())-45)
			task.wait(60)
			Trail(0, 0, 315)
			task.wait(5)
			Trail(0, 128, 315)
			Trail(0, 256, 315)
			task.wait(60)
			Shoot(point_direction(GetX(boss), GetY(boss), PlayerX(), PlayerY()))
			task.wait(90)
			Shoot(point_direction(GetX(boss), GetY(boss), PlayerX(), PlayerY()))
			Shoot(point_direction(GetX(boss), GetY(boss), PlayerX(), PlayerY())+45)
			Shoot(point_direction(GetX(boss), GetY(boss), PlayerX(), PlayerY())-45)
			task.wait(60)
		end
	end)
	return phase
end
--[[
	Nonspell 5
]]
function S.bossNonspell5()
	phase = task.spawn(function()
		MoveTween(boss, 192, 150, 120)
		local function ShotLoop()
			local r = random(360)
			ShotCreateCircleA(RICE_M_BLUE, GetX(boss), GetY(boss), 6, r, 40, 15, -0.5, 1.2, 0, SHOOT1)
			ShotCreateCircleA(RICE_M_BLUE, GetX(boss), GetY(boss), 6, r, 40, 15, -0.5, 1.6)
		end
		while true do
			ShotLoop()
			task.wait(30)
			ShotLoop()
			task.wait(30)
			ShotLoop()
			task.wait(30)
			MoveRandomTween(boss, 60, 30)
		end
	end)
	return phase
end
--[[
	Spellcard 5
]]
function S.bossSpellcard5()
	background()
	local function angleInRange(check, low, high)
		local diff = math.abs(angle_difference(low, high))
		if math.abs(angle_difference(check, low)) < diff and math.abs(angle_difference(check, high)) < diff then
			return true
		end
		return false
	end
	MoveTween(boss, 192, 224, 120)
	phase = task.spawn(function()
		local timer = 1
		local dir = 0
		local clearDir = 270
		local shot1 = RICE_M_AQUA
		local shot2 = BALL_M_BLUE
		local dirAdd = 7
		local dirClearAdd = 1
		while true do
			-- Set shots, flip pattern
			if timer - 720 % 1440 == 0 then
				shot1 = RICE_M_ORANGE
				shot2 = BALL_M_RED
				dirAdd = -7
				dirClearAdd = -1
				task.wait(30)
			end
			if timer % 1440 == 0 then
				shot1 = RICE_M_AQUA
				shot2 = BALL_M_BLUE
				dirAdd = 7
				dirClearAdd = 1
				task.wait(30)
			end
			-- Pattern
			if angleInRange(dir, clearDir-15, clearDir+15) == false then
				ShotCreateArc(shot1, GetX(boss), GetY(boss), 1.5, dir, 2, 7, 15, SHOOT1)
			end
			if timer % 30 == 0 then
				local s = 180
				ShotCreateArc(shot2, GetX(boss), GetY(boss), 4, clearDir - s, 24, 270, 15)
				ShotCreateArc(shot2, GetX(boss), GetY(boss), 3.5, clearDir - s, 24, 270, 15)
				ShotCreateArc(shot2, GetX(boss), GetY(boss), 3, clearDir - s, 24, 270, 15)
			end
			dir = dir + dirAdd
			clearDir = clearDir + dirClearAdd
			timer = timer + 1
			task.wait(1)
		end
	end)
	return phase
end
--[[
	Nonspell 6
]]
function S.bossNonspell6()
	phase = task.spawn(function()
		MoveTween(boss, 192, 150, 120)
		local function ShotLoop()
			local r = random(360)
			ShotCreateCircleA(RICE_M_BLUE, GetX(boss), GetY(boss), 6, r, 40, 15, -0.5, 1.2, 0, SHOOT1)
			ShotCreateCircleA(RICE_M_BLUE, GetX(boss), GetY(boss), 6, r, 40, 15, -0.5, 1.6)
		end
		while true do
			ShotLoop()
			task.wait(45)
			ShotLoop()
			task.wait(45)
			MoveRandomTween(boss, 60, 30)
		end
	end)
	return phase
end
--[[
	Spellcard 6
]]
function S.bossSpellcard6()
	background()
	MoveTween(boss, 192, 100, 120)
	local function spawnShots(x, y, direction, shotType)
		local speed = 16
		local counter = 0
		task.spawn(function()
			while counter < 500 do
				x = x + lengthdir_x(speed, direction)
				y = y + lengthdir_y(speed, direction)
				ShotCreateA(shotType, x + random(24) - 12, y + random(24) - 12, -3, 270, 0.06, 1 + random(2), 0, SHOOT1)
				counter = counter + speed
				task.wait(2)
			end
		end)
	end
	phase = task.spawn(function()
		while true do
			task.wait(120)						
			spawnShots(GetX(boss), GetY(boss), 0, BALL_M_DKGREEN)
			spawnShots(GetX(boss), GetY(boss), -15, BALL_M_DKAQUA)
			spawnShots(GetX(boss), GetY(boss), -31, BALL_M_PURPLE)
			spawnShots(GetX(boss), GetY(boss), 180, BALL_M_DKYELLOW)
			spawnShots(GetX(boss), GetY(boss), 195, BALL_M_BROWN)
			spawnShots(GetX(boss), GetY(boss), 210, BALL_M_DKRED)
			task.wait(60)
			MoveRandomTween(boss, 60, 30)
			task.wait(60)
			
			spawnShots(0, 250, 15, BALL_M_DKRED)
			task.wait(15)
			spawnShots(0, 225, 15, BALL_M_DKAQUA)
			task.wait(15)
			spawnShots(0, 200, 15, BALL_M_PURPLE)
			task.wait(15)
			spawnShots(0, 175, 15, BALL_M_DKYELLOW)
			task.wait(15)
			spawnShots(0, 150, 15, BALL_M_BLUE)
			task.wait(15)
			spawnShots(0, 125, 15, BALL_M_DKGREEN)
			MoveRandomTween(boss, 60, 30)
			task.wait(120)
			
			spawnShots(384, 250, 165, BALL_M_DKRED)
			task.wait(15)
			spawnShots(384, 225, 165, BALL_M_DKAQUA)
			task.wait(15)
			spawnShots(384, 200, 165, BALL_M_PURPLE)
			task.wait(15)
			spawnShots(384, 175, 165, BALL_M_DKYELLOW)
			task.wait(15)
			spawnShots(384, 150, 165, BALL_M_BLUE)
			task.wait(15)
			spawnShots(384, 125, 165, BALL_M_DKGREEN)
			MoveRandomTween(boss, 60, 30)
			task.wait(120)
			
			spawnShots(0, 250, 15, BALL_M_DKRED)
			spawnShots(384, 250, 165, BALL_M_DKAQUA)
			task.wait(30)
			spawnShots(0, 200, 15, BALL_M_PURPLE)
			spawnShots(384, 200, 165, BALL_M_DKYELLOW)
			task.wait(30)
			spawnShots(0, 150, 15, BALL_M_BLUE)
			spawnShots(384, 150, 165, BALL_M_DKGREEN)
			MoveTween(boss, 192, 100, 60)
			task.wait(120)
		end
	end)
	return phase
end
--[[
	Nonspell 7
]]
function S.bossNonspell7()
	phase = task.spawn(function()
		MoveTween(boss, 192, 150, 120)
		local function ShotLoop()
			local r = random(360)
			ShotCreateCircleA(RICE_M_BLUE, GetX(boss), GetY(boss), 6, r, 30, 15, -0.5, 1.2, 0, SHOOT1)
			ShotCreateCircleA(RICE_M_BLUE, GetX(boss), GetY(boss), 6, r+3, 30, 15, -0.5, 1.6)
			ShotCreateCircleA(RICE_M_BLUE, GetX(boss), GetY(boss), 6, r+6, 30, 15, -0.5, 2)
		end
		while true do
			ShotLoop()
			task.wait(30)
			ShotLoop()
			task.wait(30)
			ShotLoop()
			task.wait(30)
			MoveRandomTween(boss, 60, 30)
		end
	end)
	return phase
end
--[[
	Spellcard 7
]]
function S.bossSpellcard7()
	background()
	local function BounceShot(s, bounces)
		task.spawn(function()
			while instance_exists(s) and bounces > 0 do
				local sx = GetX(s)
				local sy = GetY(s)
				if sx <= 0 then
					local dir = GetDir(s)
					ShotSetDirection(s, angle_difference(180, dir))
					SetXY(s, 1, sy)
					bounces = bounces - 1
				end
				if sx >= 384 then
					local dir = GetDir(s)
					ShotSetDirection(s, angle_difference(180, dir))
					SetXY(s, 383, sy)
					bounces = bounces - 1
				end
				if sy <= 0 then
					local dir = GetDir(s)
					ShotSetDirection(s, angle_difference(0, dir))
					SetXY(s, sx, 1)
					bounces = bounces - 1
				end
				task.wait(1)
			end
		end)
	end
	local function SpawnShots(x, y, direction, bounces)
		local s = ShotCreate(BALL_LL_BLUE, x, y, 4, direction, SHOOT1)
		ShotSetBlend(s, bm_add)
		BounceShot(s, bounces)
		for i = 1, 12 do
			local s = ShotCreate(BALL_L_BLUE, x, y, random(1.5) + 2.5, direction + random(4) - 2)
			BounceShot(s, bounces)
		end
		for i = 1, 12 do
			local s = ShotCreate(BALL_MO_BLUE, x, y, random(2) + 1, direction + random(16) - 8)
			BounceShot(s, bounces)
		end
		return s
	end
	phase = task.spawn(function()
		while true do
			MoveTween(boss, 192, 150, 120)
			task.wait(120)
			SpawnShots(GetX(boss), GetY(boss), 90, 2)
			SpawnShots(GetX(boss), GetY(boss), 90+22.5, 2)
			SpawnShots(GetX(boss), GetY(boss), 90+45, 2)
			SpawnShots(GetX(boss), GetY(boss), 90-22.5, 2)
			SpawnShots(GetX(boss), GetY(boss), 90-45, 2)
			task.wait(60)
			MoveTween(boss, 288, 150, 120)
			task.wait(120)
			SpawnShots(GetX(boss), GetY(boss), 0, 1)
			SpawnShots(GetX(boss), GetY(boss), 0+22.5, 1)
			SpawnShots(GetX(boss), GetY(boss), 0+45, 1)
			SpawnShots(GetX(boss), GetY(boss), 0-22.5, 1)
			SpawnShots(GetX(boss), GetY(boss), 0-45, 1)
			MoveTween(boss, 96, 150, 120)
			task.wait(120)
			SpawnShots(GetX(boss), GetY(boss), 180, 1)
			SpawnShots(GetX(boss), GetY(boss), 180+22.5, 1)
			SpawnShots(GetX(boss), GetY(boss), 180+45, 1)
			SpawnShots(GetX(boss), GetY(boss), 180-22.5, 1)
			SpawnShots(GetX(boss), GetY(boss), 180-45, 1)
			task.wait(60)
			MoveTween(boss, 32, 128, 30)
			task.wait(60)
			MoveTween(boss, 352, 128, 120, 'EaseLinear')
			SpawnShots(GetX(boss), GetY(boss), 90, 1)
			task.wait(20)
			SpawnShots(GetX(boss), GetY(boss), 90, 1)
			task.wait(20)
			SpawnShots(GetX(boss), GetY(boss), 90, 1)
			task.wait(20)
			SpawnShots(GetX(boss), GetY(boss), 90, 1)
			task.wait(20)
			SpawnShots(GetX(boss), GetY(boss), 90, 1)
			task.wait(20)
			SpawnShots(GetX(boss), GetY(boss), 90, 1)
			task.wait(20)
		end
	end)
	return phase
end
--[[
	Nonspell 8
]]
function S.bossNonspell8()
	phase = task.spawn(function()
		MoveTween(boss, 192, 150, 120)
		local function ShotLoop()
			local dir = point_direction(GetX(boss), GetY(boss), PlayerX(), PlayerY())
			local speed = 5
			for i = 1, 6 do
				ShotCreateCircle(RICE_M_BLUE, GetX(boss), GetY(boss), speed, dir, 5, 15, SHOOT1)
				speed = speed - 0.65
			end
		end
		while true do
			ShotLoop()
			task.wait(20)
			ShotLoop()
			task.wait(20)
			ShotLoop()
			task.wait(20)
			ShotLoop()
			task.wait(20)
			MoveRandomTween(boss, 60, 30)
		end
	end)
	return phase
end
--[[
	Spellcard 8
]]
function S.bossSpellcard8()
	background()
	local pid = BossGetPhaseID(boss)
	local function SpawnCross(x, y, rot, dirMove)
		local length = 225
		local dir1 = 0
		local dir2 = 90
		local dir3 = 180
		local dir4 = 270
		local laser1 = ShotCreateSLaser(SLASER_M_BLUE, x, y, dir1, length, 24, 240, LASER1, 45)
		local laser2 = ShotCreateSLaser(SLASER_M_BLUE, x, y, dir2, length, 24, 240, -1, 45)
		local laser3 = ShotCreateSLaser(SLASER_M_BLUE, x, y, dir3, length, 24, 240, -1, 45)
		local laser4 = ShotCreateSLaser(SLASER_M_BLUE, x, y, dir4, length, 24, 240, -1, 45)
		local img1 = draw_image_ext(spr_hexagram, 700, 0, x, y, 0.25, 0.25, 0, c_white, 0.5)
		task.spawn(function()
			local dirRot = 0
			local timer = 0
			task.wait(15)
			while timer < 240 do
				timer = timer + 1
				dirRot = dirRot + rot
				ShotSetDirection(laser1, dir1 + dirRot)
				ShotSetDirection(laser2, dir2 + dirRot)
				ShotSetDirection(laser3, dir3 + dirRot)
				ShotSetDirection(laser4, dir4 + dirRot)
				x = x + lengthdir_x(1, dirMove)
				y = y + lengthdir_y(1, dirMove)
				SetXY(laser1, x, y)
				SetXY(laser2, x, y)
				SetXY(laser3, x, y)
				SetXY(laser4, x, y)
				SetXY(img1, x, y)
				task.wait(1)
			end
			task.wait(15)
			instance_destroy(img1)
		end)
	end
	local function ArcWaves(deg1, deg2, amount1, amount2, speed1, speed2, wait, duration)
		task.spawn(function()
			local timer = 0
			local dir
			while timer < duration and pid == BossGetPhaseID(boss) do
				timer = timer + wait
				dir = point_direction(GetX(boss), GetY(boss), PlayerX(), PlayerY())
				ShotCreateArc(BALL_M_RED, GetX(boss), GetY(boss), speed1, dir, amount1, deg1, 15, SHOOT1)
				ShotCreateArc(BALL_M_RED, GetX(boss), GetY(boss), speed2, dir+180, amount2, deg2, 15)
				task.wait(wait)
			end
		end)
	end
	phase = task.spawn(function()
		MoveTween(boss, 192, 150, 120)
		task.wait(60)
		while true do
			ArcWaves(135, 225, 17, 33, 1.5, 6, 30, 300)
			SpawnCross(320, 160, 1, 180)
			SpawnCross(64, 280, -1, 0)
			task.wait(420)
			ArcWaves(60, 225, 7, 33, 3, 6, 30, 300)
			SpawnCross(64, 160, -1, 0)
			SpawnCross(320, 280, 1, 180)
			task.wait(420)
			ArcWaves(180, 225, 17, 33, 1.25, 6, 30, 300)
			SpawnCross(128, 150, -1, 315)
			SpawnCross(256, 150, 1, 225)
			task.wait(420)
		end
	end)
	return phase
end
--[[
	Spellcard 9
]]
function S.bossSpellcard9()
	background()
	local pid = BossGetPhaseID(boss)
	local timer = 0
	local function Spawn(x, y, direction)
		task.spawn(function()
			local change = 0
			local speed
			local life = timer + 240
			while timer < life do
				if timer > change then
					change = timer + 60 + irandom(240)
					direction = point_direction(x, y, PlayerX(), PlayerY())
					speed = 1.5
				end
				x = x + lengthdir_x(speed, direction)
				y = y + lengthdir_y(speed, direction)
				if timer % 20 == 0 then
					ShotCreateArc(BALL_M_BLUE, x, y, 0.5, point_direction(x, y, PlayerX(), PlayerY()), 3, 180, 0, SHOOT1)
				end
				task.wait(1)
			end
		end)
	end
	task.spawn(function()
		while pid == BossGetPhaseID(boss) do
			timer = timer + 1
			task.wait(1)
		end
	end)
	phase = task.spawn(function()
		BossVisible(boss, false)
		while timer < 1800 do
			Spawn(0, 0, 285)
			Spawn(384, 448, 105)
			task.wait(180)
			Spawn(384, 0, 285)
			Spawn(0, 448, 105)
			task.wait(300)
			Spawn(192, 0, 285)
			Spawn(192, 448, 105)
			task.wait(180)
			Spawn(0, 224, 285)
			Spawn(384, 224, 105)
			task.wait(300)
		end
		local delay = 300
		while timer < 5095 do
			task.wait(delay)
			for i = 0, 448, 40 do
				ShotCreate(BALL_M_RED, 0, i, 1, point_direction(0, i, 192, 224), SHOOT1)
				ShotCreate(BALL_M_RED, 384, i, 1, point_direction(384, i, 192, 224))
				if i <= 384 then
					ShotCreate(BALL_M_RED, i, 0, 1, point_direction(i, 0, 192, 224))
					ShotCreate(BALL_M_RED, i, 448, 1, point_direction(i, 448, 192, 224))
				end
			end
			task.wait(delay)
			for i = 0, 448, 32 do
				ShotCreate(BALL_M_BLUE, 0, i, 1, 0, SHOOT1)
				ShotCreate(BALL_M_BLUE, 0, i, 1.25, 0)
				ShotCreate(BALL_M_BLUE, 384, i, 1, 180)
				ShotCreate(BALL_M_BLUE, 384, i, 1.25, 180)
				if i <= 384 then
					ShotCreate(BALL_M_BLUE, i, 0, 1, 270)
					ShotCreate(BALL_M_BLUE, i, 0, 1.25, 270)
					ShotCreate(BALL_M_BLUE, i, 448, 1, 90)
					ShotCreate(BALL_M_BLUE, i, 448, 1.25, 90)
				end
			end
			task.wait(delay)
			for i = 0, 448, 40 do
				ShotCreate(BALL_M_DKGREEN, 0, i, 1, 0+15, SHOOT1)
				ShotCreate(BALL_M_DKGREEN, 0, i, 1, 0-15)
				ShotCreate(BALL_M_DKGREEN, 384, i, 1, 180+15)
				ShotCreate(BALL_M_DKGREEN, 384, i, 1, 180-15)
				if i <= 384 then
					ShotCreate(BALL_M_DKGREEN, i, 0, 1, 270+15)
					ShotCreate(BALL_M_DKGREEN, i, 0, 1, 270-15)
					ShotCreate(BALL_M_DKGREEN, i, 448, 1, 90+15)
					ShotCreate(BALL_M_DKGREEN, i, 448, 1, 90-15)
				end
			end
			task.wait(delay)
			for i = 0, 448, 40 do
				local s
				local turn = 0.1
				s = ShotCreate(BALL_M_ORANGE, 0, i, 1, point_direction(0, i, 192, 224), SHOOT1)
				ShotAddDirectionPersistent(s, turn)
				s = ShotCreate(BALL_M_ORANGE, 384, i, 1, point_direction(384, i, 192, 224))
				ShotAddDirectionPersistent(s, turn)
				if i <= 384 then
					s = ShotCreate(BALL_M_ORANGE, i, 0, 1, point_direction(i, 0, 192, 224))
					ShotAddDirectionPersistent(s, turn)
					s = ShotCreate(BALL_M_ORANGE, i, 448, 1, point_direction(i, 448, 192, 224))
					ShotAddDirectionPersistent(s, turn)
				end
			end
			task.wait(delay)
			for i = 0, 448, 40 do
				local s
				local turn = -0.1
				s = ShotCreate(BALL_M_YELLOW, 0, i, 1, point_direction(0, i, 192, 224), SHOOT1)
				ShotAddDirectionPersistent(s, turn)
				s = ShotCreate(BALL_M_YELLOW, 384, i, 1, point_direction(384, i, 192, 224))
				ShotAddDirectionPersistent(s, turn)
				if i <= 384 then
					s = ShotCreate(BALL_M_YELLOW, i, 0, 1, point_direction(i, 0, 192, 224))
					ShotAddDirectionPersistent(s, turn)
					s = ShotCreate(BALL_M_YELLOW, i, 448, 1, point_direction(i, 448, 192, 224))
					ShotAddDirectionPersistent(s, turn)
				end
			end
			
			delay = math.max(delay - 60, 60)
		end
	end)
	return phase
end
--[[
	Spellcard 10
]]
function S.bossSpellcard10()
	background()
		local function BounceShot(s)
		task.spawn(function()
			while instance_exists(s) do
				local sx = GetX(s)
				local sy = GetY(s)
				if sx <= 0 then
					local dir = GetDir(s)
					ShotSetDirection(s, angle_difference(180, dir))
					SetXY(s, 1, sy)
					break
				end
				if sx >= 384 then
					local dir = GetDir(s)
					ShotSetDirection(s, angle_difference(180, dir))
					SetXY(s, 383, sy)
					break
				end
				if sy <= 0 then
					local dir = GetDir(s)
					ShotSetDirection(s, angle_difference(0, dir))
					SetXY(s, sx, 1)
					break
				end
				task.wait(1)
			end
		end)
	end
	local function SpawnShots(x, y)
		local amount = 80
		-- Easier to do detailed control without a bullet group
		for i = 1, amount do
			local s = ShotCreate(RICE_M_BLUE, x, y, 1.5, (i / amount) * 360, SHOOT1)
			BounceShot(s)
		end
		return s
	end
	phase = task.spawn(function()
		task.wait(120)
		SpawnShots(GetX(boss), GetY(boss))
		local delay = 180
		while true do
			task.wait(delay)
			delay = delay - 10
			if delay < 60 then delay = 60 end
			SpawnShots(GetX(boss) + irandom(250) - 125, GetY(boss) + irandom(150) - 75)
		end
	end)
	return phase
end
return S