/// @description Insert description here
// You can write your code in this editor

if title_active == true {
	draw_set_font(fnt_score)
	draw_set_color(c_white)
	draw_text(view_wport[0]/2,(view_hport[0]/3),"Swallowed by the Sun")
	
	draw_set_font(fnt_smalltext)
	draw_text(view_wport[0]/2,view_hport[0]/2,"Press Space to Start")
}

if title_active == false and transition_complete == true{
	draw_set_font(fnt_score)
	draw_set_color(c_red)
	draw_text(20, 20, obj_player_1.player_score)

	draw_set_color(c_blue)
	draw_text(view_wport[0] - 80, 20, obj_player_2.player_score)
}