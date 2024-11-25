/// @description Insert description here
// You can write your code in this editor
//var star_x = obj_star.x;
//var star_y = obj_star.y;

//var direction_to_star = point_direction(x, y, star_x, star_y);
//image_angle = direction_to_star + 90;
//var distance_to_star = point_distance(x, y, star_x, star_y);
//var gravity_strength = 0.001; 

//if (distance_to_star > 1) { 
//    hspeed = lengthdir_x(gravity_strength * distance_to_star, direction_to_star);
//    vspeed = lengthdir_y(gravity_strength * distance_to_star, direction_to_star);
//} else {
//    hspeed = 0;
//    vspeed = 0;
//}


//if keyboard_check(vk_right) {
//	x += 2
//} else if keyboard_check(vk_left) {
//	x -= 2
//}



// version 2
//var star_x = obj_star.x; 
//var star_y = obj_star.y; 


//if (keyboard_check(right_key)) {
//	player_angle += move_speed
//}
//if (keyboard_check(left_key)) {
//    player_angle -= move_speed
//}


//if dead == false {
//	orbit_radius -= 0.5;
//} else {
//	orbit_radius = 350;
//	dead = false;
//}

//if position_meeting(x,y,obj_star) {
//	dead = true;
//}


//var direction_to_star = point_direction(x, y, star_x, star_y);
//image_angle = direction_to_star + 90;


//x = lerp(x,star_x + orbit_radius * cos(player_angle),0.15); 
//y = lerp(y,star_y + orbit_radius * sin(player_angle),0.15); 
var star_x = obj_star.x; 
var star_y = obj_star.y; 
	x = lerp(x,star_x + orbit_radius * cos(player_angle),0.15); 
	y = lerp(y,star_y + orbit_radius * sin(player_angle),0.15); 

if dead == false {
	if (keyboard_check(right_key)) {
		player_angle += move_speed
	}
	if (keyboard_check(left_key)) {
	    player_angle -= move_speed
	}


	var direction_to_star = point_direction(x, y, star_x, star_y);
	image_angle = direction_to_star + 90;




//star_x + orbit_radius * cos(player_angle),(star_x + orbit_radius * sin(player_angle)) - 5
	var asteroid = instance_place(x,y, obj_asteroid)
	var collideplay = instance_place(x,y, obj_player_parent)
	
	if position_meeting(x,y,obj_star) {
		dead = true;
		player_score -= 1;
		audio_play_sound(sfx_death,2,false)
		scatter_flames(3,0.5,1,5)
	} 
	if dying == false {
		if distance_to_object(asteroid) < 1 {
			colliding = true;
			scatter_smoke(3, 0.5, 1, 20)
			
			audio_play_sound(sfx_asteroid_jump,2,false)
		} else if distance_to_object(collideplay) < 1 {
			colliding = true;
			player_score += 1;
			
			audio_play_sound(sfx_player_collide,2,false)
			
			scatter_stars(5, 0.5, 2, 30)
			
			with (collideplay) {
				dying = true
				x = lerp(x, star_x, 0.2); 
				y = lerp(y, star_y, 0.2);	
				

			}
		} else {
			colliding = false
		}
	}
	
	if dying {
		image_yscale = -1.5
		image_xscale = 0.8
	}
	

	//global.stop = false
	
	if !colliding {
		grav += 0.2;
		orbit_radius -= grav;
		scatter_sparks(1, 0.5, 1, 5)
		image_yscale = 1
	} else {    
	    orbit_radius += grav * 19;
	    grav = -0.2; 
		image_yscale = 2
		with asteroid {
			stepped_on = true
		}
	}
} else {

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
		dying = false;
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

