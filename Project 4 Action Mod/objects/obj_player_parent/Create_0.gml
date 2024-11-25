/// @description Insert description here
// You can write your code in this editor


orbit_radius = 450; // effectively the "y-axis"
player_angle = 0; // effectively the "x-axis"
move_speed = 0.015;

dead = false;
dying = false;
grav = 2
colliding = false;
jump_power = 200

left_key = ord("A");
right_key = ord("D");

respawn_time = 60;
respawn_timer = undefined;

player_score = 0;

//yippee

function scatter_stars(num_stars, min_size, max_size, radius) {
    for (var i = 0; i < num_stars; i++) {
        var star_size = random_range(min_size, max_size);
        
        var angle = random_range(0, 2 * pi);
        
        var distance = random_range(radius * 0.5, radius); 
        
        var star_x = x + distance * cos(angle);
        var star_y = y + distance * sin(angle);

        effect_create_depth(depth, ef_star, star_x, star_y, star_size, c_yellow);
    }
}

function scatter_smoke(num_smoke, min_size, max_size, radius) {
    for (var i = 0; i < num_smoke; i++) {
        var smoke_size = random_range(min_size, max_size);
        
        var angle = random_range(0, 2 * pi);
        
        var distance = random_range(radius * 0.5, radius); 
        
        var smoke_x = x + distance * cos(angle);
        var smoke_y = y + distance * sin(angle);

        effect_create_depth(depth, ef_smoke, smoke_x, smoke_y, smoke_size, c_gray);
    }
}

function scatter_sparks(num_sparks, min_size, max_size, radius) {
    for (var i = 0; i < num_sparks; i++) {
        var spark_size = random_range(min_size, max_size);
        
        var angle = random_range(0, 2 * pi);
        
        var distance = random_range(radius * 0.5, radius); 
        
        var spark_x = x + distance * cos(angle);
        var spark_y = y + distance * sin(angle);

        effect_create_depth(depth, ef_spark, spark_x, spark_y, spark_size, c_orange);
    }
}

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