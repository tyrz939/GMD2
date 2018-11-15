/*****
Input
*****/
if !global.replay {
	if input.up == true				{up = true; replayArrayAdd = true;}
	else if input.up == false		{up = false; replayArrayAdd = true;}
    
	if input.down == true			{down = true; replayArrayAdd = true;}
	else if input.down == false		{down = false; replayArrayAdd = true;}
    
	if input.left == true			{left = true; replayArrayAdd = true;}
	else if input.left == false		{left = false; replayArrayAdd = true;}
    
	if input.right == true			{right = true; replayArrayAdd = true;}
	else if input.right == false	{right = false; replayArrayAdd = true;}
    
	if input.b1 == true				{focus = true; replayArrayAdd = true;}
	else if input.b1 == false		{focus = false; replayArrayAdd = true;}
    
	if input.b2 == true				{shoot_press = true; replayArrayAdd = true;}
	else if input.b2 == false		{shoot_press = false; replayArrayAdd = true;}
    
	if input.b3 == true				{bomb_press = true; replayArrayAdd = true;}
	else if input.b3 == false		{bomb_press = false; replayArrayAdd = true;}
    
	if input.b4 == true				{extra = true; replayArrayAdd = true;}
	else if input.b4 == false		{extra = false; replayArrayAdd = true;}
}

//player.x = mouse_x
//player.y = mouse_y