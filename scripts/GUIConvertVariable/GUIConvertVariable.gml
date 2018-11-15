switch argument0 {
	case "score": return string_insert_comma(floor(score))
	case "lives": return lives
	case "bombs": return game.bombs
	case "power": return game.shotPower
	case "power/max": return string_format(game.shotPower, 0, 2) + "/" + string_format(player.shotPowerMax, 0, 2)
	case "powerFloor": return floor(game.shotPower)
	case "powerFrac": return stringZerosBefore(floor(frac(game.shotPower) * 100), 2)
	case "powerMax": return player.shotPowerMax
	case "graze": return string_insert_comma(floor(game.grazeCount))
	default: return -1
}