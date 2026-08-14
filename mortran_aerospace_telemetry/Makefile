# Makefile for Mortran Aerospace Telemetry Processor
# Note: Mortran often requires preprocessing. Adjust compiler flags as needed.

COMPILER = gfortran
PREPROCESSOR = mortran
TARGET = telemetry_processor

SRCS = telemetry_processor.mortran
OBJS = $(SRCS:.mortran=.o)

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJS)
	$(COMPILER) -o $(TARGET) $(OBJS)

%.o: %.mortran
	$(PREPROCESSOR) $< | $(COMPILER) -c -x f95 -o $@

clean:
	rm -f $(TARGET) $(OBJS)
