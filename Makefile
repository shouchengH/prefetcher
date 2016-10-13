CFLAGS = -msse2 --std gnu99 -O0 -Wall

all: main.c
	$(CC) $(CFLAGS) -o main main.c

cache-test: main
	perf stat -e cache-misses,cache-references,instructions,cycles ./main 1 
	perf stat -e cache-misses,cache-references,instructions,cycles ./main 2 
	perf stat -e cache-misses,cache-references,instructions,cycles ./main 3 

clean:
	$(RM) main
