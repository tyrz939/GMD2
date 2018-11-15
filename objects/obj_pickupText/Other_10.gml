y -= 0.5

timer++
if timer > 30 {alpha -= 0.5/15;}
if timer == 45 {instance_destroy()}