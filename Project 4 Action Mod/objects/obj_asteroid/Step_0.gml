/// @description Insert description here
// You can write your code in this editor
var star_x = obj_star.x;
var star_y = obj_star.y;

if place_meeting(x,y,obj_lava_shoot) {
	stepped_on = true
}

if stepped_on {
    a_grav += 0.00005; 
	scatter_flames(2,0.5,1,5)
    x = lerp(x, star_x, 0.01); 
    y = lerp(y, star_y, 0.01);  

    if (point_distance(x, y, star_x, star_y) < 10) {
        visible = false  
		image_alpha -= alpha_fade_speed;  

        if image_alpha <= 0 {
            image_alpha = 0;  
        }
    }
	
	if respawn_timer == undefined {
		respawn_timer = respawn_time;
	}
	respawn_timer -= 1;
		
	if respawn_timer <= 0  {
		x = spawn_x
		y = spawn_y		
		visible = true
		image_alpha = 0
		stepped_on = false
		respawn_timer = undefined
	}
} else {
	//heat += 0.05
	
	//if heat == heatmax {
	//	burn = true
	//}
	
	//var heat_ratio = heat / heatmax;
	//var red_value = clamp(255 * heat_ratio, 0, 255);

	//image_blend = make_color_rgb(red_value, 0, 0);
}



if !stepped_on && image_alpha < 1 {
    image_alpha += alpha_fade_speed;  

    if image_alpha >= 1 {
        image_alpha = 1;  
    }
	
	heat = 0
}

