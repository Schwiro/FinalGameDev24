//timer = maxtimer

timer -= 1

if timer <= 0 {
	if image_speed = 0 {
		image_speed = 1 
		
	} else if image_index >= sprite_get_number(sprite_index) -1 {
		timer = random_range(60,180)
		image_speed = 0
		image_index = 0
	} 
} 
