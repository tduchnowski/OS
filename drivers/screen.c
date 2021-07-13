#include "screen.h"


int calculate_offset(int,int);

/*
 * Prints a string
 * TODO Implement scrolling and behaviour when there is a \n in a string
 */
void print_string(char* text, int row, int column, char attribute){
	unsigned char* vidmem = (unsigned char*) VIDEO_MEMORY;
	if(!attribute){
		attribute = WHITE_ON_BLACK;
	}
	int i = 0;
	int offset = calculate_offset(row,column);
	while(text[i]){
		vidmem[offset + 2*i] = text[i];
		vidmem[offset + 2*i + 1] = attribute;
		if(offset + 2 > MAX_OFFSET){
			offset = calculate_offset(24,0);
			scroll_screen(1);
		}
		i++;
	}

}

/*
	calculate a place in VGA memory from row and column values
	row 0, column 0 is the top left corner
*/
int calculate_offset(int row, int column){
	int offset = 2 * MAX_COLUMNS * row + 2 * column;
	return offset;
}

void clear_screen(){
	unsigned char* vidmem = (unsigned char*) VIDEO_MEMORY;
	for(int i = 0; i < MAX_OFFSET;i + 2){
		vidmem[i] = '\0';
	}
}

void scroll_screen(int rows){
}
