//Set motion of the enemy randomly once in a while
//Set bounch back motion for every time the enemy
//hit a screen edge or platform or ground


if (irandom(80) == 1){
	motion_set(random(360), 2 + random(7));
}

if(y - sprite_height/2 < 0){
	motion_set(random_range(225, 315), 2 + random(7));
}

if(x - sprite_width/2 < 0){
	motion_set(random_range(-45, 45), 2 + random(7));
}

if(x + sprite_width/2 > room_width){
	motion_set(random_range(135, 225), 2 + random(7));
}

ground = instance_nearest(x, y, obj_ground);
platform = instance_nearest(x, y, obj_platform);

if(collision_rectangle(x-sprite_width/2, y-sprite_height/2, x+sprite_width/2, y+sprite_height/2, ground, true, true)){
	motion_set(random_range(45, 135), 2 + random(7));
}

else if(collision_rectangle(x-sprite_width/2, y-sprite_height/2, x+sprite_width/2, y+sprite_height/2, platform, true, true)){
	if(y < platform.y && x < platform.x){
		motion_set(random_range(120, 150), 2 + random(7));
	}
	else if (y < platform.y && x > platform.x){
		motion_set(random_range(30, 60), 2 + random(7));
	}
	else if (y > platform.y && x < platform.x){
		motion_set(random_range(210, 240), 2 + random(7));
	}
	else if (y > platform.y && x > platform.x){
		motion_set(random_range(300, 330), 2 + random(7));
	}
}