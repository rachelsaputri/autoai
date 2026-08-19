#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Data structures */
typedef struct {
    char record_id[50];
    char timestamp[30];
    char data_payload[256];
    int validated;
} Record;

/* Global configuration */
static int verbose_mode = 0;
static int output_file_flag = 0;
static char output_filename[100] = "report.txt";

/* Function prototypes */
void print_usage(const char *prog_name);
void parse_arguments(int argc, char *argv[]);
int validate_record(Record *rec);
void process_data(FILE *input, FILE *output);
void log_message(const char *msg);

/* Print usage instructions */
void print_usage(const char *prog_name) {
    fprintf(stderr, "Usage: %s [-v] [-o output_file] [input_file]\n", prog_name);
    fprintf(stderr, "Options:\n");
    fprintf(stderr, "  -v          Enable verbose logging\n");
    fprintf(stderr, "  -o file     Write report to file\n");
    fprintf(stderr, "  [input_file] Input data file (reads stdin if omitted)\n");
}

/* Parse command line arguments */
void parse_arguments(int argc, char *argv[]) {
    int i;
    for (i = 1; i < argc; i++) {
        if (strcmp(argv[i], "-v") == 0) {
            verbose_mode = 1;
        } else if (strcmp(argv[i], "-o") == 0) {
            if (i + 1 < argc) {
                strncpy(output_filename, argv[i+1], 99);
                output_file_flag = 1;
                i++;
            } else {
                fprintf(stderr, "Error: -o requires a filename argument.\n");
                print_usage(argv[0]);
                exit(1);
            }
        } else if (argv[i][0] != '-') {
            /* Assume it's the input file */
            if (freopen(argv[i], "r", stdin) == NULL) {
                fprintf(stderr, "Error: Cannot open input file '%s'.\n", argv[i]);
                exit(1);
            }
        } else {
            fprintf(stderr, "Error: Unknown option '%s'.\n", argv[i]);
            print_usage(argv[0]);
            exit(1);
        }
    }
}

/* Validate a record structure */
int validate_record(Record *rec) {
    if (strlen(rec->record_id) == 0 || strlen(rec->timestamp) == 0) {
        return 0;
    }
    if (strlen(rec->data_payload) == 0) {
        return 0;
    }
    return 1;
}

/* Log a message if verbose mode is on */
void log_message(const char *msg) {
    if (verbose_mode) {
        fprintf(stderr, "[LOG] %s\n", msg);
    }
}

/* Process data from input to output */
void process_data(FILE *input, FILE *output) {
    char line[512];
    int record_count = 0;
    int valid_count = 0;
    int invalid_count = 0;

    log_message("Data processing started.");

    while (fgets(line, sizeof(line), input) != NULL) {
        Record rec;
        memset(&rec, 0, sizeof(rec));

        /* Simple parsing: EXPECTING format "ID|TIMESTAMP|PAYLOAD" */
        char *token;
        token = strtok(line, "|");
        if (token != NULL) strncpy(rec.record_id, token, 49);

        token = strtok(NULL, "|");
        if (token != NULL) strncpy(rec.timestamp, token, 29);

        token = strtok(NULL, "|");
        if (token != NULL) {
            /* Remove trailing newline */
            token[strcspn(token, "\n")] = 0;
            strncpy(rec.data_payload, token, 255);
        }

        record_count++;
        if (validate_record(&rec)) {
            valid_count++;
            fprintf(output, "VALID|%s|%s|%s\n", rec.record_id, rec.timestamp, rec.data_payload);
        } else {
            invalid_count++;
            fprintf(output, "INVALID|%s|%s|%s\n", rec.record_id, rec.timestamp, rec.data_payload);
            log_message("Invalid record detected.");
        }
    }

    log_message("Data processing completed.");
    fprintf(output, "\n--- SUMMARY ---\n");
    fprintf(output, "Total Records: %d\n", record_count);
    fprintf(output, "Valid Records: %d\n", valid_count);
    fprintf(output, "Invalid Records: %d\n", invalid_count);
    log_message("Summary generation complete.");
}

/* Main entry point */
int main(int argc, char *argv[]) {
    FILE *outfile = stdout;

    parse_arguments(argc, argv);

    if (output_file_flag) {
        outfile = fopen(output_filename, "w");
        if (outfile == NULL) {
            fprintf(stderr, "Error: Cannot open output file '%s'.\n", output_filename);
            return 1;
        }
    }

    process_data(stdin, outfile);

    if (output_file_flag) {
        fclose(outfile);
        log_message("Output written to file.");
    }

    return 0;
}
