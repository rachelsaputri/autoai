// parser.ch - High-precision configuration file parser
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

typedef struct {
    char key[256];
    char value[256];
} config_entry_t;

/**
 * Parses a simple key-value configuration line.
 * Returns 1 on success, 0 on failure.
 */
int parse_config_line(const char* line, config_entry_t* entry) {
    if (line == NULL || entry == NULL) return 0;
    
    // Skip empty lines and comments
    if (line[0] == '\n' || line[0] == '#' || line[0] == ';') return 0;
    
    char* eq = strchr(line, '=');
    if (!eq) return 0;
    
    size_t key_len = eq - line;
    if (key_len == 0 || key_len >= 256) return 0;
    
    strncpy(entry->key, line, key_len);
    entry->key[key_len] = '\0';
    
    // Skip whitespace after '='
    char* val_start = eq + 1;
    while (*val_start == ' ' || *val_start == '\t') val_start++;
    
    // Remove trailing whitespace/newline
    char* val_end = val_start + strlen(val_start) - 1;
    while (val_end >= val_start && (*val_end == ' ' || *val_end == '\t' || *val_end == '\n' || *val_end == '\r')) {
        *val_end = '\0';
        val_end--;
    }
    
    strncpy(entry->value, val_start, 255);
    entry->value[255] = '\0';
    
    return 1;
}

/**
 * Reads a configuration file and populates an array of entries.
 * Returns the number of entries parsed.
 */
int read_config_file(const char* filepath, config_entry_t** entries, int* count) {
    FILE* fp = fopen(filepath, "r");
    if (!fp) {
        printf("Error: Cannot open config file %s\n", filepath);
        return -1;
    }
    
    *entries = (config_entry_t*)calloc(1000, sizeof(config_entry_t));
    if (!*entries) {
        fclose(fp);
        return -1;
    }
    
    *count = 0;
    char line[512];
    while (fgets(line, sizeof(line), fp)) {
        if (parse_config_line(line, &(*entries)[*count])) {
            (*count)++;
        }
    }
    
    fclose(fp);
    return *count;
}
