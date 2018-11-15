var p = floor(game.shotPower)
if _id > p {
	instance_destroy()
	exit
} else if prevPower != p {
	prevPower = p
}
/* ---- Orb Position ---- */
if !player.focus {
	xp = player.orbX[p-1, _id-1]
	yp = player.orbY[p-1, _id-1]
} else {
	xp = player.forbX[p-1, _id-1]
	yp = player.forbY[p-1, _id-1]
}

/* ---- Orb Lag ---- */
if prevLives == lives {
	var dist = point_distance(x, y, player.x+xp, player.y+yp);
	if dist > 0.5 {
	    var dir = point_direction(x, y, player.x+xp, player.y+yp);
	    x += lengthdir_x(dist, dir) / 4;
	    y += lengthdir_y(dist, dir) / 4;
	} else {
	    round(x);
	    round(y);
	}
} else {
	x = xp + player.x
	y = yp + player.y
}
prevLives = lives