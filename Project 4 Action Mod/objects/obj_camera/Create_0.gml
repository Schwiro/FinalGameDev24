/// @description Insert description here
// You can write your code in this editor
//camera_angle = 0;
//camera_distance = view_camera[0];

radius = 280; 
angle = 0;   
rotation_speed = 0.03;
camera_angle = 90

title_active = true

//instance_deactivate_all(true);

instance_deactivate_object(obj_asteroid)
instance_deactivate_object(obj_player_parent)

instance_activate_object(obj_manager);
instance_activate_object(obj_camera);
instance_activate_object(obj_star);

global.stop = false
transition_complete = false
transition_start = false