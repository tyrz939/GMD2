local S = {}

function S.SetupGUI()
	local refX = 832
	local refY = 0
	GUIAddText(refX + 32, refY + 100, "Score")
	GUIAddSetHAlign(FA_RIGHT)
	GUIAddVariable(refX + 416, refY + 100, "score")
	-- Lives
	GUIAddSetHAlign(FA_LEFT)
	GUIAddSetColor(make_color_rgb(255, 127, 255))
	GUIAddText(refX + 32, refY + 250, "Player")
	GUIAddSetHAlign(FA_RIGHT)
	GUIAddVariable(refX + 416, refY + 250, "lives")
	-- Bombs
	GUIAddSetHAlign(FA_LEFT)
	GUIAddSetColor(make_color_rgb(127, 255, 127))
	GUIAddText(refX + 32, refY + 300, "Bombs")
	GUIAddSetHAlign(FA_RIGHT)
	GUIAddVariable(refX + 416, refY + 300, "bombs")
	-- Power
	GUIAddSetHAlign(FA_LEFT)
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

function S.SetupThinGUI()
	local refX = 1152
	local refY = 0
	GUIAddSetHAlign(FA_CENTER)
	GUIAddSetColor(c_white)
	GUIAddText(refX, refY + 100, "Score")
	GUIAddVariable(refX, refY + 140, "score")
	-- Lives
	GUIAddSetColor(c_white)
	GUIAddText(refX, refY + 250, "Player")
	GUIAddSetColor(make_color_rgb(255, 127, 255))
	GUIAddVariable(refX, refY + 290, "lives")
	-- Bombs
	GUIAddSetColor(c_white)
	GUIAddText(refX, refY + 350, "Bombs")
	GUIAddSetColor(make_color_rgb(127, 255, 127))
	GUIAddVariable(refX, refY + 390, "bombs")
	-- Power
	GUIAddSetColor(c_white)
	GUIAddText(refX, refY + 450, "Power")
	GUIAddSetColor(make_color_rgb(255, 127, 64))
	GUIAddVariable(refX, refY + 490, "power/max")
	-- Graze
	GUIAddSetColor(c_white)
	GUIAddText(refX, refY + 550, "Graze")
	GUIAddVariable(refX, refY + 590, "graze")
end

return S