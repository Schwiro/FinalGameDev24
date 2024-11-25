/// @description Insert description here
// You can write your code in this editor
a_grav = 0
stepped_on = false

spawn_x = x;
spawn_y = y;

respawn_time = 200;
respawn_timer = undefined;

image_alpha = 1
alpha_fade_speed = 0.1

//orbit_radius = random_range(100,450)
//angle = random_range(0,360)

function scatter_flames(num_flames, min_size, max_size, radius) {
    for (var i = 0; i < num_flames; i++) {
        var flames_size = random_range(min_size, max_size);
        
        var angle = random_range(0, 2 * pi);
        
        var distance = random_range(radius * 0.5, radius); 
        
        var flames_x = x + distance * cos(angle);
        var flames_y = y + distance * sin(angle);

        effect_create_depth(depth, ef_explosion, flames_x, flames_y, flames_size, c_red);
    }
}