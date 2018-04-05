//spawn at one of the spawn point(up, down, left, right) if player's lives are still > 0
if(global.playerLives > 0){
	if(!instance_exists(obj_player)){
		spawn_point = irandom_range(1, 4);
		if(spawn_point == 1){
			obj_spawner_1.spawn_active = true;
		}
		else if(spawn_point == 2){
			obj_spawner_2.spawn_active = true;
		}
		else if(spawn_point == 3){
			obj_spawner_3.spawn_active = true;
		}
		else if(spawn_point == 4){
			obj_spawner_4.spawn_active = true;
		}
	}
}

//spawn enemy in 3 seconds if the total amount of enemies is not 4
if(instance_number(obj_enemy) < 4){
	enemy_spawn_timer++;
	if(enemy_spawn_timer == 180){
		spawn_point = irandom_range(1, 4);
		if(spawn_point == 1){
			obj_spawner_1.spawn_enemy_active = true;
		}
		else if(spawn_point == 2){
			obj_spawner_2.spawn_enemy_active = true;
		}
		else if(spawn_point == 3){
			obj_spawner_3.spawn_enemy_active = true;
		}
		else if(spawn_point == 4){
			obj_spawner_4.spawn_enemy_active = true;
		}
		enemy_spawn_timer = 0;
	}
}