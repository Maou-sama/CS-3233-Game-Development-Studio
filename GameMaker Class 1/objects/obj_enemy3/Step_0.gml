/// @description Insert description here
// You can write your code in this editor

x -= flySpeed;

if(x < 0){
	instance_destroy();
	
	global.gameScore++;
}