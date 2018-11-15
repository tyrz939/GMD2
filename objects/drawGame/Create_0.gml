gameSurface = noone
guiSurface = noone

event_user(15)

prevWindowWidth = window_get_width()
prevWindowHeight = window_get_height()

shakeX = 0
shakeY = 0
shakeAmplitude = 0
shakeDuration = 0

depth = 10000

instance_create_depth(0, 0, 0, drawGameMiddle)
instance_create_depth(0, 0, -16000, drawGameEnd)