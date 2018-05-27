simple: lex.yy.o simple.tab.o
	gcc -o simple $^

simple.tab.h: src/simple.y
	bison --debug --verbose -d src/simple.y

simple.tab.c: src/simple.y
	bison -d scr/simple.y

lex.yy.c: src/simple.flex simple.tab.h
	flex  src/simple.flex

clean:
	-rm lex.yy.o 
	-rm lex.yy.c
	-rm simple
	-rm simple.output
	-rm simple.tab.h
	-rm simple.tab.c
	-rm simple.tab.o