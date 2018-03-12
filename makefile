CC=clang-omp
CFLAGS = -fopenmp
OBJECTS= bitonic_sort.o

all: bitonic_sort.o bitonic_sort
bitonic_sort:   $(OBJECTS)
								$(CC)  -o bitonic_sort  $(OBJECTS) $(CFLAGS)

bitonic_sort.o: src/bitonic_sort.c
								$(CC) -c src/bitonic_sort.c

clean:
				rm -f bitonic_sort $(OBJECTS)
