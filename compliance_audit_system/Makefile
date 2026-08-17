# BLISS Compliance Audit System Build Configuration

COMPILER = bliss
LINKER = blilink

SRCS = audit_main.bliss policy_parser.bliss state_tracker.bliss report_engine.bliss config_manager.bliss
OBJS = $(SRCS:.bliss=.olb)
TARGET = compliance_audit_system.exe

.PHONY: all clean run

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LINKER) -o $@ $^

%.olb: %.bliss
	$(COMPILER) -output=$@ $<

clean:
	rm -f $(OBJS) $(TARGET)

run: $(TARGET)
	./$(TARGET)
