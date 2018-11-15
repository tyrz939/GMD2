timer++

// Animate
image_alpha -= 1 / duration

// Move
x += ((spd) * cos (direction * pi / 180)) * game.gamespeed
y += ((spd) * -sin (direction * pi / 180)) * game.gamespeed

// Kill
if timer == duration {instance_destroy()}