/// @description Insert description here
// You can write your code in this editor


if(room == rm_main){
	if(global.playerLives == 0 && global.gameScore < highscore_value(10)){
		if(keyboard_check_pressed(vk_enter)){
			room_restart();
		}
	}
	else if(global.playerLives == 0 && global.gameScore > highscore_value(10)){
		room_goto(rm_entername);
	}
}

if(room == rm_menu){
	if(keyboard_check_pressed(vk_enter)){
		global.gameScore = 0;
		global.playerLives = 5;
		room_goto(rm_main);
	}
	if(keyboard_check_pressed(ord("H"))){
		room_goto(rm_highscore);
	}
}

if(room == rm_entername){
	name = get_string("Please input your name: ", "AAAA");
	highscore_add(name, global.gameScore);
	room_goto(rm_menu);
}

if(room == rm_highscore){
	if(keyboard_check_pressed(vk_escape)){
		room_goto(rm_menu);
	}
}