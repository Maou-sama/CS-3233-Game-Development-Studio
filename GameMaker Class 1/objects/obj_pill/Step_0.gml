/// @description Insert description here
// You can write your code in this editor

y += fallSpeed;

if(y > room_height){
	instance_destroy();
}

player = instance_nearest(x, y, obj_player);

if(collision_circle(x, y, 32, player, false, true)){
	player.shield = 5;
	instance_destroy();
}