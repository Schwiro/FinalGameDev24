// star coords
var star_x = obj_star.x; 
var star_y = obj_star.y; 
// player movement
x = lerp(x,star_x + orbit_radius * cos(player_angle),0.15); 
y = lerp(y,star_y + orbit_radius * sin(player_angle),0.15); 

if keyboard_check(vk_space) {
	screenshake(30, 1000, 0.2)
}

if dead == false {
	var asteroid = instance_place(x,y, obj_asteroid)
	var collideplay = instance_place(x,y, obj_player_parent)
	var direction_to_star = point_direction(x, y, star_x, star_y);
	image_angle = direction_to_star + 90;
	
	if colliding == false {
		if is_flying = false {
			orbit_radius -= grav;
			grav += 0.2;
		} else {
			grav = 0
		}
		
		image_yscale = 1
		
		// control movement
		if (keyboard_check(right_key)) {
			player_angle += move_speed
		}
	
		if (keyboard_check(left_key)) {
		    player_angle -= move_speed
		} 
	
		if (keyboard_check(up_key)) { // fly up for a short period of time
			if fuel > 0 and is_flying == false {
				is_flying = true
				grav = 0
			}
		
			if is_flying {
				orbit_radius += fly_amount
				fuel -= fuel_depletion_rate
				
				scatter_sparks(1, 0.5, 1, 5)
				if fuel <= 0 {
					fuel = 0
					is_flying = false
				}
			} 		
		} else {
			is_flying = false
			fuel += fuel_regen_rate
			if fuel > max_fuel {
				fuel = max_fuel
			}
		}
	
	
		if (keyboard_check_pressed(down_key)) {
			orbit_radius -= dash_amount			
		} 
	} else {    // colliding
	    
		orbit_radius += grav * 18;
	    grav = -0.2; 
		image_yscale = 2
		
		with asteroid {
			stepped_on = true
		}
	}
	

	
	if position_meeting(x,y,obj_star) or position_meeting(x,y,obj_lava_shoot){
		dead = true;
		player_score -= 1;
		audio_play_sound(sfx_death,2,false)
		scatter_flames(3,0.5,1,5)
	} 
	
	
	//if dead == false {
		if distance_to_object(asteroid) < 1 {
			if asteroid.burn == false {
				colliding = true;
				
				
				scatter_smoke(3, 0.5, 1, 20)
				audio_play_sound(sfx_asteroid_jump,2,false)
			} else {
				colliding = true;
				dead = true;
				
				scatter_smoke(3, 0.5, 1, 20)
				audio_play_sound(sfx_asteroid_jump,2,false)
			}
			
			
		} else if (distance_to_object(collideplay) < 1) {
			colliding = true;
			player_score += 1;
			
			
			audio_play_sound(sfx_player_collide,2,false)
			scatter_stars(5, 0.5, 2, 30)
			
			with (collideplay) {
				//dying = true
				colliding = false
				x = lerp(x, star_x, 0.2); 
				y = lerp(y, star_y, 0.2);	
			}
		} else {
			colliding = false
		}
	//}
	
	//if dying {
	//	image_yscale = -1.5
	//	image_xscale = 0.8
	//}
	
	
} else { // if dead 

	if respawn_timer == undefined {
		respawn_timer = respawn_time;
	}
	respawn_timer -= 1;
	
	if respawn_timer <= 0  {
		orbit_radius = 450
		grav = 1.6
		player_angle = random_range(obj_camera.angle - 0.5, obj_camera.angle + 0.5) 
		
		//global.stop = false
		visible = true
		dead = false;
		//dying = false;
		respawn_timer = undefined
		
		audio_play_sound(sfx_player_spawn,2,false)
		
		image_yscale = 1
		image_xscale = 1
	} else {
		visible = false
		orbit_radius = 800
		//global.stop = true
	}
}

