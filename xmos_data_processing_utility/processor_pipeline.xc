#include "xcore/io_float.h"
#include "xcore/channel.h"
#include "xcore/port.h"
#include "xcore/clock.h"
#include "stdio.h"
#include "string.h"

#include "data_types.xc"
#include "processor_pipeline.xc"
#include "validator.xc"
#include "reporter.xc"

// Processing pipeline
void processor_pipeline(in channel c_in, out channel c_out) {
    DataRecord record;
    
    while (1) {
        // Receive record from input channel
        c_in :> record;
        
        // Transform the record
        transform_record(&record);
        
        // Send transformed record to output channel
        c_out <: record;
    }
}

// Transform a single record
void transform_record(DataRecord *record) {
    if (record == NULL) {
        return;
    }
    
    // Apply transformation logic
    // Example: Normalize the value
    if (record->value != 0.0f) {
        record->value = record->value / 100.0f;
    }
    
    // Update status
    record->status = 1; // Transformed
}

// Transform multiple records
void transform_records(int count) {
    DataRecord records[MAX_RECORDS];
    
    // In a real implementation, this would receive records from a channel
    // For now, we'll use the global buffer
    extern DataRecord processing_buffer[MAX_RECORDS];
    extern int buffer_count;
    
    memcpy(records, processing_buffer, sizeof(processing_buffer));
    
    for (int i = 0; i < count; i++) {
        transform_record(&records[i]);
    }
    
    // Send transformed records to next stage
    extern channel c_transformed_data;
    for (int i = 0; i < count; i++) {
        c_transformed_data <: records[i];
    }
}

// Get pipeline stage
PipelineStage get_pipeline_stage(void) {
    // In a real implementation, this would track the current stage
    return STAGE_TRANSFORMATION;
}

// Check pipeline health
int is_pipeline_healthy(void) {
    // In a real implementation, this would check various health metrics
    return 1; // Healthy
}
