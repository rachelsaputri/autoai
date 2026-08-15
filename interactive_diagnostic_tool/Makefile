# Makefile for Interactive Chapel Diagnostic Tool

CHPL = chpl
CHPLFLAGS = --fast
TARGET = interactive_diagnostic_tool

.PHONY: all clean run

all: $(TARGET)

$(TARGET): interactive_diagnostic_tool.chpl
	$(CHPL) $(CHPLFLAGS) -o $(TARGET) interactive_diagnostic_tool.chpl

clean:
	rm -f $(TARGET)

run: $(TARGET)
	./$(TARGET)

verbose-run: $(TARGET)
	./$(TARGET) --verbose

interactive-run: $(TARGET)
	./$(TARGET)

non-interactive-run: $(TARGET)
	./$(TARGET) --non-interactive
