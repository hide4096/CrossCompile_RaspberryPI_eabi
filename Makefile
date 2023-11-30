CC = arm-linux-gnueabihf-gcc

helloworld: helloworld.o
	$(CC) helloworld.o -o helloworld

helloworld.o: helloworld.c
	$(CC) -c helloworld.c

clean:
	rm -f *.o helloworld
