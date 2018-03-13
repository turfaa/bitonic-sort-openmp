CC = cc
LIBS = -fopenmp
CFLAGS = -O
OBJECTS = bitonic_sort.o

all: bitonic_sort.o bitonic_sort
bitonic_sort:   $(OBJECTS)
								$(CC)  -o bitonic_sort  $(OBJECTS) $(LIBS)

bitonic_sort.o: src/bitonic_sort.c
								$(CC) -c src/bitonic_sort.c $(CFLAGS)

clean:
				rm -f bitonic_sort $(OBJECTS)
