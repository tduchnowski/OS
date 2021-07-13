#include "../drivers/screen.h"

void _start(){
	char* video_memory = (char*) 0xb8000;
	video_memory[50] = 'K';
	//clear_screen();
	char* welcome_string  = "SCREEN DRIVER WORKS";
	print_string(welcome_string, 0,0,0);
}
