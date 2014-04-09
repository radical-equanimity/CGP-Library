# GCC complier 
CC=gcc

# GCC complier options
	# -pedantic		Issue all the warnings demanded by strict ISO C
	# -Wall			Turns on all optional warnings which are desirable for normal code.
	# -O3			turns on all optimizations
	# -g			turns on debugging information	
	
CFLAGS= -pedantic -Wall -g 

test: src/test.c src/cgp.c include/cgp.h
	@$(CC) -o test src/test.c src/cgp.c include/cgp.h $(CFLAGS) -lm

gettingStarted: examples/gettingStarted.c src/cgp.c include/cgp.h
	@$(CC) -o gettingStarted examples/gettingStarted.c src/cgp.c include/cgp.h $(CFLAGS) -lm

createDataSet: examples/createDataSet.c src/cgp.c include/cgp.h
	@$(CC) -o createDataSet examples/createDataSet.c src/cgp.c include/cgp.h $(CFLAGS) -lm

manipulatingChromosomes: examples/manipulatingChromosomes.c src/cgp.c include/cgp.h
	@$(CC) -o manipulatingChromosomes examples/manipulatingChromosomes.c src/cgp.c include/cgp.h $(CFLAGS) -lm

customNodeFunction: examples/customNodeFunction.c src/cgp.c include/cgp.h
	@$(CC) -o customNodeFunction examples/customNodeFunction.c src/cgp.c include/cgp.h $(CFLAGS) -lm

customFitnessFunction: examples/customFitnessFunction.c src/cgp.c include/cgp.h
	@$(CC) -o customFitnessFunction examples/customFitnessFunction.c src/cgp.c include/cgp.h $(CFLAGS) -lm

docs: ./include/cgp.h ./naturaldocs/customFiles/*
	@naturaldocs -i ./include -i ./naturaldocs/customFiles -o FramedHTML ./docs -p ./naturaldocs

so: src/cgp.c 
	@$(CC) -c -fpic src/cgp.c $(CFLAGS) -O3
	@gcc -shared -o libcgp.so cgp.o -lm -O3

clean:
	@rm -f cgp.o libcgp.so cgp.dll test gettingStarted createDataSet manipulatingChromosomes customNodeFunction customFitnessFunction *.data *.chromo *.depend *.layout *.exe
