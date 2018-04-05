/// @description Insert description here
// You can write your code in this editor

if(room == rm_main){
	draw_text(50, 50, "Score: " + string(global.gameScore));
	draw_text(50, 75, "Lives: " + string(global.playerLives));
	if(global.playerLives == 0 && global.gameScore < highscore_value(10)){
			draw_text(400, 300, "You lose! Press Enter to player again")
	}
}

if(room = rm_menu){
	draw_set_font(font0);
	draw_text(250, 250, "My Joust Clone");
	draw_set_font(font1);
	draw_text(400, 400, "Press H for high score");
	draw_text(385, 450, "Press Enter to enter game");
}

if(room = rm_highscore){
	draw_set_font(font0);
	draw_text(320, 50, "High Score");
	draw_set_font(font1);
	draw_highscore(100, 200, room_width-100, room_height-100);
}