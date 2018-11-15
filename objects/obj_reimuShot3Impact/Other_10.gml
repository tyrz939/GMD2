timer++

// Animate
subImage += aniSpeed

// Move
x += ((spd) * cos (direction * pi / 180)) * game.gamespeed
y += ((spd) * -sin (direction * pi / 180)) * game.gamespeed

// Kill
if timer == duration {instance_destroy()}