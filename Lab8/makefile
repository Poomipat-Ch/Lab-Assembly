H4_6:
	gcc find_gcd.c Lab8_H4_6.s -o find_gcd

debug: $(lab)
	as -g -o $(lab).o $(lab).s
	gcc -o $(lab) $(lab).o
	gdb $(lab)
