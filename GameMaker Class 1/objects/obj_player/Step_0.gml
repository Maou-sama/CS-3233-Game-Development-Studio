/// @description Insert description here
// You can write your code in this editor

//Check keyboard for movement
if(keyboard_check(vk_right)){
	if(x+50 < room_width){
		x += mySpeed;
	}
}
if(keyboard_check(vk_left)){
	if(x-50 > 0){
		x -= mySpeed;
	}
}
if(keyboard_check(vk_up)){
	if(y-38 > 0){
		y -= mySpeed;
	}
}
if(keyboard_check(vk_down)){
	if(y+38 < room_height){
		y += mySpeed;
	}
}

//Check for shooting(only shoot if there are enough ammo)
if(keyboard_check(vk_space)){
	if(ammo > 0){
		instance_create_depth(x, y-38, 0, obj_bullet);
		ammo--;
	}
}

//Check collision with enemies, lose hit point directly if hit
enemy = instance_nearest(x, y, obj_enemy);
enemy1 = instance_nearest(x, y, obj_enemy1);
enemy2 = instance_nearest(x, y, obj_enemy2);
enemy3 = instance_nearest(x, y, obj_enemy3);
enemy4 = instance_nearest(x, y, obj_enemy4);
enemy5 = instance_nearest(x, y, obj_enemy5);

if( collision_circle(x, y, 32, enemy, false, true)  || 
	collision_circle(x, y, 32, enemy1, false, true) ||
	collision_circle(x, y, 32, enemy2, false, true) ||
	collision_circle(x, y, 32, enemy3, false, true) ||
	collision_circle(x, y, 32, enemy4, false, true) ||
	collision_circle(x, y, 32, enemy5, false, true)){
	hitPoint--;
	if(hitPoint <= 0){
		global.playerLives--;
		x = room_width/2;
		y = 864;
		if(global.playerLives <= 0){
			room_goto(rm_end);
		}
		hitPoint = 3;
	}
}