# Variables
CC = gcc
CCFLAGS = -W -Wall -pedantic -O0 -g -fsanitize=address
SDL = -I include -L lib -l SDL2-2.0.0

all: process

# Object files
chip8.o: ./src/chip8.c ./include/chip8.h
	$(CC) $(CCFLAGS) -c ./src/chip8.c

graphics.o: ./src/graphics.c ./include/graphics.h ./include/chip8.h
	$(CC) $(CCFLAGS) -c ./src/graphics.c

process.o: ./src/process.c ./include/graphics.h
	$(CC) $(CCFLAGS) -c ./src/process.c

# Executable
process: ./src/process.o ./src/chip8.o ./src/graphics.o
	$(CC) $(CCFLAGS) -o ./build/chip8 ./src/process.o ./src/chip8.o ./src/graphics.o $(SDL)

# Clean object files
clean:
	rm -f ./src/*.o ./src/*~

# Clean object files and build files
mrproper: clean
	rm -f ./build/chip8