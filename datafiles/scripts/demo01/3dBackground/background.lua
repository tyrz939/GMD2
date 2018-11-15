
local S = {}

function S.loadAssets3d(group)
	local bg = gmDir .. '3dBackground/'
	LoadQueueAddSprite3d(group, 'img3d_floor', bg .. 'floor.png', 1, 0, 0)
end

function S.setAssets3d(group)
	-- Saving pointers to the images
	floor3d = FindSprite(group, 'img3d_floor')
end

function S.init()
	-- Initial values
	local c = c_black
	d3dSetFog(2048, 4096, c, c)
	d3dSetX(64)
	d3dSetY(0)
	d3dSetZ(512)
	d3dSetYaw(270)
	d3dSetPitch(30)
	
	d3dAddSetBlend(bm_add)
	d3dAddSetAlpha(0.5)
	d3dAddSetColor(make_color_rgb(0, 255, 0))
	d3dAddFloor(-4096, 0, -1024, 4096, 1024*8, -1024, floor3d, 32, 32)
	d3dAddSetColor(make_color_rgb(0, 0, 255))
	d3dAddFloor(-4096, 0, -512, 4096, 1024*8, -512, floor3d, 32, 32)
	d3dAddSetColor(make_color_rgb(255, 0, 0))
	d3dAddFloor(-4096, 0, 0, 4096, 1024*8, 0, floor3d, 32, 32)
end

local d = 0
function S.step()
	d3dSetYaw(285 + lengthdir_y(15, d))
	d = d + 0.1
	
	local y = d3dGetY() + 15
	if y > 2048 then y = y - 2048 end
	d3dSetY(y)
end

--[[function S.draw3d()
	d3d_draw_floor(-2048, 0, 0, 2048, 1024*8, 0, floor3d, 16, 32)
end]]

return S