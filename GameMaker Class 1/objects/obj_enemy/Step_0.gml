/// @description Insert description here
// You can write your code in this editor

y += flySpeed + sin(pi/4);
x += flySpeed + cos(pi/4);

if(y > room_height){
	instance_destroy();
	
	global.gameScore++;
}