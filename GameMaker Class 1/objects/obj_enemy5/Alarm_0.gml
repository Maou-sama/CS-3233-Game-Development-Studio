/// @description Insert description here
// You can write your code in this editor

instance_create_depth(x-40, y+41, 0, obj_enemy_bullet);
instance_create_depth(x+40, y+41, 0, obj_enemy_bullet);

alarm_set(0, alarmSpeed);