# Makefile for ACC Certificate Chain Verifier

ACC_COMPILER = acc
BUILD_DIR = ./build
SRC_DIR = .
TARGET = acc_cert_verifier

.PHONY: all build clean run

all: build

build: 
	mkdir -p $(BUILD_DIR)
	$(ACC_COMPILER) compile $(SRC_DIR)/main.acc $(SRC_DIR)/validator.acc $(SRC_DIR)/monitor.acc $(SRC_DIR)/revocation.acc $(SRC_DIR)/auditor.acc $(SRC_DIR)/config.acc -o $(BUILD_DIR)/$(TARGET)
	@echo "Build successful: $(BUILD_DIR)/$(TARGET)"

clean:
	rm -rf $(BUILD_DIR)
	rm -f $(SRC_DIR)/*.acc~

run: build
	./$(BUILD_DIR)/$(TARGET)

install:
	install -d /etc/acc_cert_verifier
	cp config.example.json /etc/acc_cert_verifier/config.json
	install -m 755 $(BUILD_DIR)/$(TARGET) /usr/local/bin/

lint:
	$(ACC_COMPILER) lint $(SRC_DIR)/*.acc

format:
	$(ACC_COMPILER) format $(SRC_DIR)/*.acc -w
