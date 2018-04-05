/// @description Insert description here
// You can write your code in this editor

y += bulletSpeed;

if(y < 0){
	instance_destroy();
}

player = instance_nearest(x, y, obj_player);

if(collision_circle(x, y, 10, player, false, true)){
	instance_destroy();
	if(player.shield <= 0){
		player.hitPoint--;
	}
	if(player.shield > 0){
		player.shield--;
	}
	if(player.hitPoint <= 0){
		player.x = room_width/2;
		player.y = 864;
		global.playerLives--;
		if(global.playerLives <= 0){
			room_goto(rm_end);
		}
		player.hitPoint = 3;
	}
}