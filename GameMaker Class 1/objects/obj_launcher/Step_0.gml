/// @description Insert description here
// You can write your code in this editor

currentFrame++;

if(currentFrame < 60){

}

else if (currentFrame < 600){
	if(currentFrame % 60 == 0){
		instance_create_depth(xPos, yPos, 0, obj_enemy);
		instance_create_depth(room_width - 100, yPos, 0, obj_enemy1);
	}
}

else if (currentFrame < 1200){
	if(currentFrame % 40 == 0){
		instance_create_depth(-100, 40, 0, obj_enemy2);
		instance_create_depth(room_width + 100, 100, 0, obj_enemy3);
	}
}

else if (currentFrame < 1600){
	if(currentFrame % 60 == 0){
		instance_create_depth(-100, room_height-40, 0, obj_enemy4);
		instance_create_depth(room_width-100, room_height-40, 0, obj_enemy5);
	}
}

else if(currentFrame = 1600){
	currentFrame = 0;
}