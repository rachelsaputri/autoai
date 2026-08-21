#include "xcore/io_float.h"
#include "xcore/channel.h"
#include "xcore/port.h"
#include "xcore/clock.h"
#include "stdio.h"
#include "string.h"

#include "data_types.xc"
#include "network.xc"

// Network buffer
static char network_buffer[MAX_PACKET_SIZE];

// Initialize network interface
void init_network(out port p_rx, out port p_tx, channel c_out) {
    // Initialize network buffer
    memset(network_buffer, 0, sizeof(network_buffer));
    
    // Start network reception
    receive_data(p_rx, c_out);
}

// Receive data from network
void receive_data(in port p_rx, out channel c_out) {
    while (1) {
        // Wait for data
        int data_available = 0;
        p_rx :> data_available;
        
        if (data_available) {
            // Read data from port
            int byte_count = 0;
            for (int i = 0; i < MAX_PACKET_SIZE; i++) {
                p_rx :> network_buffer[i];
                byte_count++;
            }
            
            // Process received data
            process_received_data(network_buffer, byte_count, c_out);
        }
    }
}

// Process received data
void process_received_data(char *data, int length, out channel c_out) {
    if (data == NULL || length == 0) {
        return;
    }
    
    // Parse data into records
    DataRecord record;
    memset(&record, 0, sizeof(record));
    
    // Simple parsing logic
    // In a real implementation, this would parse actual data format
    record.id = 1;
    record.value = 1.0f;
    record.timestamp = get_current_time();
    record.source = 0;
    record.status = 0;
    
    // Send processed record
    send_record(c_out, &record);
}

// Send data to network
void send_data(out port p_tx, DataRecord *record) {
    if (record == NULL) {
        return;
    }
    
    // Pack data into network buffer
    int byte_count = 0;
    for (int i = 0; i < MAX_PACKET_SIZE; i++) {
        network_buffer[i] = (char)record->id;
        byte_count++;
    }
    
    // Send data to port
    for (int i = 0; i < byte_count; i++) {
        p_tx <: network_buffer[i];
    }
}

// Get current time
int get_current_time(void) {
    clock clk;
    timer t;
    t :> time_t now;
    return (int)(now / 1000); // Convert to milliseconds
}

// Send record to channel
void send_record(out channel c_out, DataRecord *record) {
    if (record == NULL) {
        return;
    }
    
    // Send record through channel
    c_out <: *record;
}
