#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <cilk/cilk.h>
#include <cilk/reducer.h>

#define MAX_RECORD_LENGTH 1024
#define NUM_THREADS 4

typedef struct {
    int id;
    char data[MAX_RECORD_LENGTH];
    int is_valid;
} DataRecord;

typedef struct {
    int processed_count;
    int valid_count;
    int invalid_count;
} ProcessingStats;

CILK_REDUCER_OPAQUE(stats, ProcessingStats);

// Parallel data validation function
cilk void validate_data_parallel(DataRecord* records, int count, struct stats* stats) {
    cilk_for (int i = 0; i < count; i++) {
        records[i].is_valid = (strlen(records[i].data) > 0 && strlen(records[i].data) < MAX_RECORD_LENGTH);
        
        if (records[i].is_valid) {
            stats->valid_count++;
        } else {
            stats->invalid_count++;
        }
    }
    stats->processed_count = count;
}

// Parallel data transformation function
cilk void transform_data_parallel(DataRecord* records, int count, char prefix[]) {
    cilk_for (int i = 0; i < count; i++) {
        if (records[i].is_valid) {
            // Example transformation: prepend a prefix
            char transformed[MAX_RECORD_LENGTH];
            snprintf(transformed, MAX_RECORD_LENGTH, "%s_%s", prefix, records[i].data);
            strncpy(records[i].data, transformed, MAX_RECORD_LENGTH);
            records[i].data[MAX_RECORD_LENGTH - 1] = '\0';
        }
    }
}

// Initialize sample data
void initialize_data(DataRecord* records, int count) {
    for (int i = 0; i < count; i++) {
        records[i].id = i;
        snprintf(records[i].data, MAX_RECORD_LENGTH, "record_%d", i);
        records[i].is_valid = 1;
    }
}

// Print processing results
void print_results(DataRecord* records, int count, struct stats* stats) {
    printf("Processing Complete:\n");
    printf("Total Processed: %d\n", stats->processed_count);
    printf("Valid Records: %d\n", stats->valid_count);
    printf("Invalid Records: %d\n", stats->invalid_count);
    
    printf("\nProcessed Data:\n");
    for (int i = 0; i < count; i++) {
        if (records[i].is_valid) {
            printf("[ID: %d] %s\n", records[i].id, records[i].data);
        }
    }
}

int main() {
    const int DATA_COUNT = 1000;
    DataRecord* records = (DataRecord*)malloc(DATA_COUNT * sizeof(DataRecord));
    if (!records) {
        fprintf(stderr, "Memory allocation failed\n");
        return 1;
    }
    
    // Initialize data
    initialize_data(records, DATA_COUNT);
    
    // Initialize stats reducer
    struct stats initial_stats = {0, 0, 0};
    cilk_spawn init_stats(&initial_stats);
    cilk_sync;
    
    // Parallel Validation
    cilk_spawn validate_data_parallel(records, DATA_COUNT, &initial_stats);
    cilk_sync;
    
    // Parallel Transformation
    cilk_spawn transform_data_parallel(records, DATA_COUNT, "PROC");
    cilk_sync;
    
    // Print results
    print_results(records, DATA_COUNT, &initial_stats);
    
    // Cleanup
    free(records);
    return 0;
}
