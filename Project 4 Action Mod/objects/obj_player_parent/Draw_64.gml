/// @description Insert description here
// You can write your code in this editor

var fuel_p1
fuel_p1 = (obj_player_1.fuel/obj_player_1.max_fuel) * 100
draw_healthbar(20, 80, 80, 100, fuel_p1, c_gray, c_yellow, c_maroon, 0, true, true);

var fuel_p2
fuel_p2 = (obj_player_2.fuel/obj_player_2.max_fuel) * 100
draw_healthbar(view_wport[0] - 80, 80, view_wport[0] - 20, 100, fuel_p2, c_gray, c_yellow, c_maroon, 0, true, true);