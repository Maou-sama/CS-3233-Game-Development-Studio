/// @description Insert description here
// You can write your code in this editor


if(room == rm_menu){
	draw_set_font(font0);
	draw_text(275, 100, "SPACE SHOOTER");
	
	draw_set_font(font1);
	draw_text(475, 350, "Press H for help");
	
	draw_text(400, 500, "Press Enter to start game");
}

if(room == rm_end){
	draw_set_font(font0);
	
	draw_text(325, 100, "YOU LOSE! (LOL)");
	
	draw_set_font(font1);
	
	draw_text(350, 500, "Press ESC to go back to main menu");	
}

if(room == rm_help){
	draw_set_font(font1);
	
	draw_text(250, 200, "Press Space to shoot (must have ammo)");
	
	draw_text(245, 300, "Press the corresponding arrows to move");
	
	draw_sprite(spr_pill, 0, 350, 410);
	
	draw_text(370, 400, " - recharge shield");
	
	draw_sprite(spr_charge, 0, 350, 515);
	
	draw_text(375, 500, " - recharge ammo");
	
	draw_set_font(font2);
	
	draw_text(400, 700, "Press Esc to return to main menu");
}