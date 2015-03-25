CC = gcc

NLOPT_PATH = /usr/local
INCLUDES = -I$(NLOPT_PATH)/include
DEFS = -L$(NLOPT_PATH)/lib
LDADD = -lnlopt -lm -lrt
OPTS = -Wall -Wextra -Wno-unused-parameter -O2 -std=c99 -pthread 

dfo_hadoop_terasort: dfo_hadoop_terasort.c
	$(CC) $(INCLUDES) $(DEFS) $(OPTS) -o $@ $^ $(LDADD)

dfo_hadoop: dfo_hadoop.c
	$(CC) $(INCLUDES) $(DEFS) $(OPTS) -o $@ $^ $(LDADD)

dfo_pi: dfo_pi.c
	$(CC) $(INCLUDES) $(DEFS) $(OPTS) -o $@ $^ $(LDADD)


clean:
	rm -vf dfo_hadoop dfo_pi dfo_hadoop_terasort

.PHONY: clean