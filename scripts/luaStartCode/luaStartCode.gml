return @"
-- GM lengthdir_x equivalent
function lengthdir_x(__l, __d)
	return __l * math.cos (__d * math.pi / 180)
end

-- GM lengthdir_y equivalent
function lengthdir_y(__l, __d)
	return __l * -math.sin (__d * math.pi / 180)
end

-- GM point_distance equivalent
function point_distance(__x1, __y1, __x2, __y2)
	return math.sqrt((__x1 - __x2)^2 + (__y1 - __y2)^2)
end

-- Text Alignment
	FA_LEFT = 0
	FA_CENTER = 1
	FA_RIGHT = 2
	FA_TOP = 0
	FA_MIDDLE = 1
	FA_BOTTOM = 2

-- Boss HP Bar types
	HP_CIRCLE = 0
	HP_BAR = 1

-- Shot Type Macros

	-- Delete Type
	DELTYPE_INSTANT = 0
	DELTYPE_ANIMATED = 1
	DELTYPE_ITEM = 2
	
	-- Pickup Items
	ITEM_POWER = 0
	ITEM_POWER8 = 1
	ITEM_STAR = 2
	ITEM_LIFE = 3
	ITEM_BOMB = 4
	ITEM_FULL = 5
	ITEM_SCORE = 6

	-- Color
	CIRCLE = 0
	OVAL = 1
	RECTANGLE = 2
	CLASER = 3
	SLASER = 4
	
	-- Blend Modes
	bm_normal = 0
	bm_add = 1
	bm_max = 2
	bm_subtract = 3
"