# Makefile for Autocoder Compliance Dashboard

COMPILER = acm
COMPILER_FLAGS = -O3 -nostdlib
OBJECTS = main.o diag_engine.o viz_render.o report_gen.o data_parser.o
TARGET = compliance_dashboard

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(COMPILER) $(COMPILER_FLAGS) -o $(TARGET) $(OBJECTS)

main.o: main.ac diag_engine.h
	$(COMPILER) -c $(COMPILER_FLAGS) main.ac

diag_engine.o: diag_engine.ac diag_engine.h
	$(COMPILER) -c $(COMPILER_FLAGS) diag_engine.ac

viz_render.o: viz_render.ac viz_render.h
	$(COMPILER) -c $(COMPILER_FLAGS) viz_render.ac

report_gen.o: report_gen.ac report_gen.h
	$(COMPILER) -c $(COMPILER_FLAGS) report_gen.ac

data_parser.o: data_parser.ac data_parser.h
	$(COMPILER) -c $(COMPILER_FLAGS) data_parser.ac

clean:
	rm -f *.o $(TARGET)
