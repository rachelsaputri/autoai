CHPL = chpl
CHPL_FLAGS = --fast

.PHONY: all clean

all: chapel_anomaly_detector

chapel_anomaly_detector: main.chpl ingestor.chpl analyzer.chpl reporter.chpl config.chpl
	$(CHPL) $(CHPL_FLAGS) -o chapel_anomaly_detector main.chpl ingestor.chpl analyzer.chpl reporter.chpl config.chpl

clean:
	rm -f chapel_anomaly_detector
	rm -rf ./results
