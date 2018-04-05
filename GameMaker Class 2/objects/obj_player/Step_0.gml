//Set invincible to false after 1 seconds
invincibleTimer++

if(invincibleTimer == 60){
	invincible = false;
}

//always increment position with velocity
x += velo_x;
y += velo_y;

//if on ground velocity on Y is 0
if(touchGround == true){
	velo_y = 0;
}

//if not set the sprite to jump sprite (invincible or not)
else{
	if(invincible){
		sprite_index = spr_player_jump_invi;
	}
	else{
		sprite_index = spr_player_jump;
	}
}

if(velo_x == 0 && touchGround == true){
	if(invincible){
		sprite_index = spr_player_idle_invi;
	}
	else{
		sprite_index = spr_player_idle;
	}
}

//add accel (positive) to velocity if pressed right and use the appropriate sprite
//wrap around the room if goes pass the right screen
if(keyboard_check(vk_right)){
	if(touchGround == true){
		if(invincible){
			sprite_index = spr_player_idle_invi;
		}
		else{
			sprite_index = spr_player_run;
		}
		image_xscale = 1;
	}
	else{
		image_xscale = -1;
	}
	if(velo_x <= maxSpeed){
		velo_x += accel_x;
	}
	if(x - sprite_width/2 > room_width){
		x = 0 - sprite_width/2;
	}
}

//reduce speed gradually if right arrow isnt pressed
else{
	if(velo_x > 0 && x != 0){
		velo_x -= friction_x;
	}
}

//same behavior as right arrow key except reverse and flip the sprite
if(keyboard_check(vk_left)){
	if(touchGround == true){
		if(invincible){
			sprite_index = spr_player_idle_invi;
		}
		else{
			sprite_index = spr_player_run;
		}
		image_xscale = -1;
	}
	else{
		image_xscale = 1;
	}
	if(velo_x >= -maxSpeed){
		velo_x -= accel_x;
	}
	if(x + sprite_width/2 < 0){
		x = room_width + sprite_width/2;
	}
}

else{
	if(velo_x < 0 && x != 0){
		velo_x += friction_x;
	}
}

//jump aka subtract accel from velovity in y direction if space is pressed
if(keyboard_check(vk_space)){
	if(velo_y <= maxSpeed){
		velo_y -= accel_y;
	}
}

//if not pressed apply gravity
else{
	velo_y += roomGrav;
}

ground = instance_nearest(x, y, obj_ground);
platform = instance_nearest(x, y, obj_platform);
enemy = instance_nearest(x, y, obj_enemy);

//check collision with ground if yes set touchGround to true and fix the position
if(collision_rectangle(x-sprite_width/2, y-sprite_height/2, x+sprite_width/2, y+sprite_height/2, ground, true, true)){
	touchGround = true;
	
	if( x - sprite_width/2 > ground.x - ground.sprite_width/2 || 
		x + sprite_width/2 < ground.x + ground.sprite_width/2){
		penetration_y = abs(abs(ground.y - y) - sprite_height/2 - ground.sprite_height/2);
		y -= penetration_y;
	}
}

//check collision with platforms if yes set touchGround to true and fix the position
else if(collision_rectangle(x-sprite_width/2, y-sprite_height/2, x+sprite_width/2, y+sprite_height/2, platform, true, true)){
	touchGround = true;
	penetration_x = abs(abs(platform.x - x) - sprite_width/2 - platform.sprite_width/2);
	if( x - sprite_width/2 >= platform.x + platform.sprite_width/2){
		x += penetration_x;
	}
	
	if( x + sprite_width/2 <= platform.x - platform.sprite_width/2){
		x -= penetration_x;
	}
	
	penetration_y = abs(abs(platform.y - y) - sprite_height/2 - platform.sprite_height/2);
	
	if(y > platform.y){
		y+= penetration_y;
	}
	else{
		y-= penetration_y;
	}
}

//if not touching either set touchGround to false
else{
	touchGround = false;
}

//Kill enemy if collide with them from above them else die if touch below them
if(collision_rectangle(x-sprite_width/2, y-sprite_height/2, x+sprite_width/2, y+sprite_height/2, enemy, true, true)){
	if (y < enemy.y){
		if(!invincible){
			global.gameScore += 500;
			instance_destroy(enemy);
		}
	}
	
	else{
		if(!invincible){
			global.gameScore += 50;
			global.playerLives--;
			instance_destroy();
		}
	}
}