/// @description Insert description here
// You can write your code in this editor

y -= bulletSpeed;

if(y < 0){
	instance_destroy();
}

enemy = instance_nearest(x, y, obj_enemy);
enemy1 = instance_nearest(x, y, obj_enemy1);
enemy2 = instance_nearest(x, y, obj_enemy2);
enemy3 = instance_nearest(x, y, obj_enemy3);
enemy4 = instance_nearest(x, y, obj_enemy4);
enemy5 = instance_nearest(x, y, obj_enemy5);

if(collision_circle(x, y, 10, enemy, false, true)){
	instance_destroy(enemy);
	instance_destroy();
	global.gameScore++;
}

if(collision_circle(x, y, 10, enemy1, false, true)){
	instance_destroy(enemy1);
	instance_destroy();
	global.gameScore++;
}

if(collision_circle(x, y, 10, enemy2, false, true)){
	instance_destroy(enemy2);
	instance_destroy();
	global.gameScore++;
}

if(collision_circle(x, y, 10, enemy3, false, true)){
	instance_destroy(enemy3);
	instance_destroy();
	global.gameScore++;
}

if(collision_circle(x, y, 10, enemy4, false, true)){
	instance_destroy(enemy4);
	instance_destroy();
	global.gameScore++;
}

if(collision_circle(x, y, 10, enemy5, false, true)){
	instance_destroy(enemy5);
	instance_destroy();
	global.gameScore++;
}