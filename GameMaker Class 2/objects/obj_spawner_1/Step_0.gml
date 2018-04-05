/// @description Insert description here
// You can write your code in this editor


if(spawn_active == true){
	instance_create_depth(x, y, 0, obj_player);
	spawn_active = false;
}

if(spawn_enemy_active == true){
	instance_create_depth(x, y, 0, obj_enemy);
	spawn_enemy_active = false;
}