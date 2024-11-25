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


var star_x = obj_star.x; 
var star_y = obj_star.y; 


if (keyboard_check(right_key)) {
	player_angle += move_speed
}
if (keyboard_check(left_key)) {
    player_angle -= move_speed
}


var direction_to_star = point_direction(x, y, star_x, star_y);
image_angle = direction_to_star + 90;


x = lerp(x,star_x + orbit_radius * cos(player_angle),0.15); 
y = lerp(y,star_y + orbit_radius * sin(player_angle),0.15); 



var asteroid = instance_place(x,y, obj_asteroid)
if position_meeting(x,y,obj_star) {
	dead = true;
} else if distance_to_object(asteroid) < 1 {
	colliding = true;
} else {
	colliding = false
}


if dead == false {
	if !colliding {
		grav += 0.1;
		orbit_radius -= grav;
	} else {    
	    orbit_radius += jump_power; 
	    grav = -0.5; 
		with asteroid {
			stepped_on = true
		}
	}
} else {
	orbit_radius = 450;
	grav = 1.6
	dead = false;
}