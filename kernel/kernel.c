#include "../drivers/screen.h"

void _start(){
	clear_screen();
	set_cursor(0);
	// check drivers
	char* welcome_string  = "SCREEN DRIVER WORKS";
	print_string(welcome_string, 3,0,0);
}
