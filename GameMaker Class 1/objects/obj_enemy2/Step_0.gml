/// @description Insert description here
// You can write your code in this editor

x += flySpeed;

if(x > room_width){
	instance_destroy();
	
	global.gameScore++;
}