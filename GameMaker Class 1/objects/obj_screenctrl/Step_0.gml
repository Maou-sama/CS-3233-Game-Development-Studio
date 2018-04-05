/// @description Insert description here
// You can write your code in this editor


if(keyboard_check_pressed(vk_enter)){
	if(room == rm_menu){
		room_goto(rm_game);
		draw_set_font(font2);
	}
}

if(keyboard_check_pressed(ord("H"))){
	if(room == rm_menu){
		room_goto(rm_help);
	}
}

if(keyboard_check_pressed(vk_escape)){
	if(room = rm_help){
		room_goto(rm_menu);
	}
	if(room = rm_end){
		room_goto(rm_menu);
		global.playerLives = 3;
	}
}