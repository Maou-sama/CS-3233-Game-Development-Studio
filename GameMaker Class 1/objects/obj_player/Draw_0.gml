/// @description Insert description here
// You can write your code in this editor

//Draw the sprites
draw_sprite(spr_player, 0, x, y);

if(shield > 0){
	draw_sprite(spr_shield, 0, x, y);
}

//Show the status of player
draw_text(x+70, y-15, "HP: " + string(hitPoint) + "/3");
draw_text(x+70, y, "Shield: " + string(shield) + "/5");
draw_text(x+70, y-30, "Ammo: " + string(ammo) + "/200");