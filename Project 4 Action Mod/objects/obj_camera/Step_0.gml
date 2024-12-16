/// @description Insert description here
// You can write your code in this editor
//var width = camera_get_view_width(view_camera[0])
//var height = camera_get_view_height(view_camera[0])

//x = obj_star.x
//y = obj_star.y


//if keyboard_check(vk_left) {
//	camera_angle -= 1
//} else if keyboard_check(vk_right) {
//	camera_angle += 1
//} 


//if (keyboard_check(ord("L"))) {
    //angle += rotation_speed; 
//}
//if (keyboard_check(ord("J"))) {
//    angle -= rotation_speed; 
//}
//if global.stop == false {
	
//} else {
//	rotation_speed = lerp(rotation_speed, 0, 0.1); 
//    angle = lerp(angle, angle + rotation_speed, 0.1);
//}






//if rotation_speed == 0 {
//    rotation_speed = 0.03;
//}
//angle = lerp(angle, angle + rotation_speed,0.1);
	
//var star_x = obj_star.x; 
//var star_y = obj_star.y; 


//x = star_x + radius * cos(angle); 
//y = star_y + radius * sin(angle); 

//camera_angle = 90 + (angle * (180/pi))

//camera_set_view_pos(view_camera[0], x, y);
//camera_set_view_angle(view_camera[0],camera_angle);




//if (keyboard_check_pressed(vk_space)) {
//	title_active = false;
//	//x = lerp(x,star_x + radius * cos(0),0.01);
//	//y = lerp(y,star_x + radius * cos(0),0.01); 	
//	instance_activate_all();
//}




if (rotation_speed == 0) {
    rotation_speed = 0.03;
}

angle = lerp(angle, angle + rotation_speed,0.1);

if (keyboard_check_pressed(vk_space) && title_active) {
    title_active = false; 
}

if (!title_active) and (!transition_complete){
	angle = lerp(angle, 0, 0.1); 
	instance_activate_all();
	if (abs(angle) < 0.1) {
        angle = lerp(angle,0,0.1); 
        transition_complete = true; 
    }
}

var star_x = obj_star.x; 
var star_y = obj_star.y; 
x = star_x + radius * cos(angle); 
y = star_y + radius * sin(angle); 
camera_angle = 90 + (angle * (180/pi));

camera_set_view_pos(view_camera[0], x, y);
camera_set_view_angle(view_camera[0], camera_angle);