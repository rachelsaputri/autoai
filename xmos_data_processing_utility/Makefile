# Makefile for XMOS Data Processing Utility

# Target device
TARGET = xcore_ai

# Compiler
COMPILER = xcc

# Compiler flags
CFLAGS = -O2 -g -march=xs2+

# Source files
SRC = main.xc

# Object files
OBJ = $(SRC:.xc=.o)

# Output file
OUT = main.xe

# Default target
all: $(OUT)

# Link object files
$(OUT): $(OBJ)
	$(COMPILER) $(CFLAGS) -o $@ $^

# Compile source files
%.o: %.xc
	$(COMPILER) $(CFLAGS) -c -o $@ $<

# Clean build artifacts
clean:
	rm -f $(OBJ) $(OUT)

# Flash the target device
flash: $(OUT)
	xflash $(OUT)

# Run the target device
run: $(OUT)
	xrun --target=$(TARGET) $(OUT)

# Help
help:
	@echo "Available targets:"
	@echo "  all     - Build the project"
	@echo "  clean   - Remove build artifacts"
	@echo "  flash   - Flash the target device"
	@echo "  run     - Run the target device"
	@echo "  help    - Show this help message"

.PHONY: all clean flash run help
