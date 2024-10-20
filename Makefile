#
# Students' Makefile for the Malloc Lab
#
TEAM = bovik
VERSION = 1
HANDINDIR = /afs/cs.cmu.edu/academic/class/15213-f01/malloclab/handin

CC = gcc
CFLAGS = -g -Wall -O2 -m32
LDFLAGS= -Wall -O2 -m32

OBJS = mdriver.o mm.o memlib.o fsecs.o fcyc.o clock.o ftimer.o

test: mdriver
#	./mdriver -V -f traces/realloc2-bal.rep # 파일 1개 테스트
#	traces 파일 내 모든 파일 테스트
	./mdriver -V -t traces 

mdriver: $(OBJS)
	$(CC) $(CFLAGS) -o mdriver $(OBJS)

mdriver.o: mdriver.c fsecs.h fcyc.h clock.h memlib.h config.h mm.h
memlib.o: memlib.c memlib.h
mm.o: mm.c mm.h memlib.h
fsecs.o: fsecs.c fsecs.h config.h
fcyc.o: fcyc.c fcyc.h
ftimer.o: ftimer.c ftimer.h config.h
clock.o: clock.c clock.h

handin:
	cp mm.c $(HANDINDIR)/$(TEAM)-$(VERSION)-mm.c

clean:
	rm -f *~ *.o mdriver