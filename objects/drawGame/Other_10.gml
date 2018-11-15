// Shake
if shakeAmplitude > 0 {
	shakeX = irandom(round(shakeAmplitude * 2)) - shakeAmplitude
	shakeY = irandom(round(shakeAmplitude * 2)) - shakeAmplitude
	shakeAmplitude -= shakeDuration
} else {
	shakeX = 0
	shakeY = 0
}