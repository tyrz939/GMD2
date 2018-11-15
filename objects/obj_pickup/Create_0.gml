pickupType = global.__pickupType
pickupCollect = false
pickupAutoCollect = false
pickupMaxValue = false
pickupWhiteCollectDelay = 10

bgRotation = 0

image_index = pickupType
image_speed = 0

spd = -1
direction = 270

timer = 0

text = ""
col = 0

switch pickupType {
	case pickup_t.POWER:
		image_blend = c_red
		char = "P"
		scale = 0.6
		break;
	case pickup_t.POWER8:
		image_blend = c_red
		char = "P"
		scale = 1
		break;
	case pickup_t.STAR:
		image_blend = c_white
		char = "S"
		scale = 0.6
		break;
	case pickup_t.LIFE:
		image_blend = c_fuchsia
		char = "L"
		scale = 0.6
		break;
	case pickup_t.BOMB:
		image_blend = c_lime
		char = "B"
		scale = 0.6
		break;
	case pickup_t.FULL:
		image_blend = c_yellow
		char = "F"
		scale = 0.6
		break;
	case pickup_t.SCORE:
		image_blend = c_blue
		char = "S"
		scale = 0.6
		break;
	default:
		image_blend = c_blue
		char = "S"
		scale = 10
}
image_xscale = scale
image_yscale = scale