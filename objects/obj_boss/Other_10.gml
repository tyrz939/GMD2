// Move
x += (spd * cos (direction * pi / 180)) * game.gamespeed
y += (spd * -sin (direction * pi / 180)) * game.gamespeed

// Bounding box for Marisa Lasers
if hitCircle > 0 {
	mask_index = spr_bboxCircle
	image_xscale = (hitCircle /32) *2
	image_yscale = (hitCircle /32) *2
} else if hitWidth > 0 && hitHeight > 0 {
	mask_index = spr_bboxRectangle
	image_xscale = (hitWidth /32) *2
	image_yscale = (hitHeight /32) *2
}

// Using shot collision because... why not. It's good
if visible {
	if pHitCircle > 0 {
		var _c = shotCollisionCircle(x, y, pHitCircle)
		if _c == 0 {
			playerHit()
		}
	} else if pHitWidth > 0 && pHitHeight > 0 {
		var _c = shotCollisionRectangle(x, y, pHitWidth, pHitHeight, direction)
		if _c == 0 {
			playerHit()
		}
	}
}

// Animation
if animationSpeed > 0 && image_exists(sprite) {
		subImage += animationSpeed / 60
	if floor(subImage) >= image_get_number(sprite) {
		subImage = 0
	}
}
for(var _i = trailsCount -1; _i >= 0; _i--) {
	if _i > 0 {
		trailsArray[_i, 0] = trailsArray[_i-1, 0]
		trailsArray[_i, 1] = trailsArray[_i-1, 1]
		trailsArray[_i, 2] = trailsArray[_i-1, 2]
	} else {
		trailsArray[_i, 0] = subImage
		trailsArray[_i, 1] = round(x) + random(2) - 1
		trailsArray[_i, 2] = round(yDraw) + random(3) - 2
	}
}

// Tween Y position drawing
yDir += 2 * game.gamespeed
yDraw = y + lengthdir_y(5, yDir)

// HP Bar fill animation
if hp > 0 && healthBarShow {
	healthBarFill = clamp(healthBarFill + 1/60, 0, 1)
}


timer++

// Nonspell/Spellcard Shared
if bossState == bossState_t.NONSPELL || bossState == bossState_t.SPELLCARD {
	// Take Damage
	if !spellSurvival {hp = clamp(hp - takeDmg, 0, maxhp); scoreAdd(takeDmg * SCORE_DAMAGE_MULTIPLIER);}
	// Phase Counter
	bossPhaseTimer--
	// Bonus Reducer
	if bossPhaseTimerStart > bossPhaseTimer + 300 {
		spellBonus -= (0.75 * spellBonusStart) / (bossPhaseTimerStart - 300)
	}
	// Spell Capture Breaker
	if player.inBomb							{spellCapture = false}
	if player.hit								{spellCapture = false}
	if bossPhaseTimer == 0 && !spellSurvival	{spellCapture = false}
	// Phase Change
	if (hp <= bossSpellBreakHP && bossState == bossState_t.NONSPELL) || hp == 0 || bossPhaseTimer <= 0 {
		// Spellcard Get
		if bossPhaseTimer > 0 && bossState == bossState_t.SPELLCARD {
			bonusAdd(round(spellBonus))
		}
		play_sfx_buffer(game.sfxPhaseBreak, false)
		// Clear Screen
		if spellCapture	{deleteShotAll(DELTYPE_ITEM)}
		else			{deleteShotAll(DELTYPE_ANIMATED)}
		
		if bossState == bossState_t.SPELLCARD {
			healthBarShow = false
			healthBarFill = 0
			bossSpellBreakHP = 0
			hp = 0
			maxhp = 0
		} else if bossState == bossState_t.NONSPELL {
			hp = bossSpellBreakHP
		}
		bossState = bossState_t.IDLE
		spellSurvival = false
		spellCapture = false
		spellName = "SET ME"
		bossPhaseID++
	}
}
// Flash when taking damage
if takeDmg != 0 && !overlayDraw {
	overlayDraw = true
	overlayColor = c_blue
	overlayAlpha = 0.5
} else {
	overlayDraw = false
}
takeDmg = 0

// State Unique
switch bossState {
	case bossState_t.IDLE:
		
		break
	case bossState_t.DIALOG:
		
		break
	case bossState_t.NONSPELL:
		
		break
	case bossState_t.SPELLCARD:
		
		break
}