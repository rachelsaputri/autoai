#include "xcore/io_float.h"
#include "xcore/channel.h"
#include "xcore/port.h"
#include "xcore/clock.h"
#include "stdio.h"
#include "string.h"

#include "data_types.xc"
#include "data_processor.xc"
#include "processor_pipeline.xc"
#include "validator.xc"
#include "reporter.xc"

// Processing buffer
static DataRecord processing_buffer[MAX_RECORDS];
static int buffer_count = 0;

// Initialize data processor
void init_data_processor(void) {
    buffer_count = 0;
    memset(processing_buffer, 0, sizeof(processing_buffer));
}

// Process incoming data
void process_data(DataRecord *record) {
    if (record == NULL) {
        return;
    }
    
    // Store record in buffer
    if (buffer_count < MAX_RECORDS) {
        processing_buffer[buffer_count] = *record;
        buffer_count++;
        
        // Process if buffer is full
        if (buffer_count >= MAX_RECORDS) {
            process_buffer();
        }
    }
}

// Process the current buffer
void process_buffer(void) {
    if (buffer_count == 0) {
        return;
    }
    
    // Validate records
    int valid_count = 0;
    for (int i = 0; i < buffer_count; i++) {
        if (validate_record(&processing_buffer[i])) {
            valid_count++;
        }
    }
    
    // Transform records
    transform_records(buffer_count);
    
    // Generate reports
    generate_reports(valid_count, buffer_count);
    
    // Reset buffer
    buffer_count = 0;
    memset(processing_buffer, 0, sizeof(processing_buffer));
}

// Get processing statistics
ProcessingStats get_processing_stats(void) {
    ProcessingStats stats;
    stats.records_processed = buffer_count;
    stats.total_processed = buffer_count;
    stats.total_validated = buffer_count;
    stats.total_transformed = buffer_count;
    stats.errors = 0;
    return stats;
}
