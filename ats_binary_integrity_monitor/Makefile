CC = patscc
CFLAGS = -O2 -I src
LDFLAGS = -o ats_binary_integrity_monitor

SRCS = src/main.dats src/parsing.dats src/integrity.dats src/reporting.dats
OBJS = $(SRCS:.dats=.o)
TARGET = ats_binary_integrity_monitor

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $^

%.o: %.dats
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)
