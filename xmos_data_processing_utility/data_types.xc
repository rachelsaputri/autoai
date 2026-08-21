#ifndef DATA_TYPES_XC
#define DATA_TYPES_XC

#include "xcore/io_float.h"
#include "xcore/channel.h"
#include "xcore/port.h"
#include "xcore/clock.h"

// Maximum data packet size
#define MAX_PACKET_SIZE 1024

// Maximum number of data records
#define MAX_RECORDS 10000

// Data record structure
typedef struct {
    int id;
    float value;
    int timestamp;
    int source;
    int status;
} DataRecord;

// Processing pipeline stages
typedef enum {
    STAGE_INGESTION = 0,
    STAGE_VALIDATION,
    STAGE_TRANSFORMATION,
    STAGE_REPORTING,
    STAGE_FINAL
} PipelineStage;

// Error codes
typedef enum {
    ERROR_NONE = 0,
    ERROR_INVALID_DATA = 1,
    ERROR_PROCESSING_FAILED = 2,
    ERROR_NETWORK_FAILURE = 3,
    ERROR_MEMORY_EXHAUSTION = 4
} ErrorCode;

// Configuration structure
typedef struct {
    int max_buffer_size;
    int processing_timeout;
    int validation_enabled;
    int transformation_enabled;
    int reporting_enabled;
} ProcessingConfig;

// Processing statistics structure
typedef struct {
    int records_processed;
    int total_processed;
    int total_validated;
    int total_transformed;
    int errors;
} ProcessingStats;

// Global variables
extern ProcessingConfig config;

#endif // DATA_TYPES_XC
