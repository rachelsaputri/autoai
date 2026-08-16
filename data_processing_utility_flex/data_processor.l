/*
 * Data Processing Utility - Flex Specification
 * 
 * This file defines the lexical analyzer for parsing and processing structured data.
 * It supports CSV, pipe-delimited, and tab-separated formats with automatic detection.
 * 
 * Usage:
 *   flex data_processor.l
 *   gcc -o data_processor lex.yy.c -lfl
 *   ./data_processor < input.txt
 */

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX_BUFFER_SIZE 1024
#define MAX_LINE_SIZE 4096

/* Global variables for tracking state */
static int line_number = 0;
static int field_count = 0;
static int token_count = 0;
static int delimiter = ','; /* Default delimiter */
static int format_detected = 0; /* 0=unknown, 1=csv, 2=pipe, 3=tab */
static FILE *output_file = NULL;

/* Function declarations */
static void process_field(const char *field);
static void reset_field_counts(void);
static void detect_format(const char *line);
static void write_field_to_csv(const char *field);
static void write_field_to_tsv(const char *field);

%}

/* Definitions for common patterns */
DIGIT       [0-9]
LETTER      [A-Za-z]
ALPHANUM    [{LETTER}{DIGIT}]
WHITESPACE  [ \t\n\r]
QUOTED_CHAR [^"\\]+|\\.
UNQUOTED_FIELD [^,\t|\n]+|[^\t\n]+|[^\n]+
FIELD_VALUE ({UNQUOTED_FIELD}|"{QUOTED_CHAR}"*)

%%

/* Skip empty lines and whitespace-only lines */
[ \t\r]+	/* skip */

/* Handle newlines */
\n	{
    if (field_count > 0) {
        printf("\n");
        token_count += field_count;
        reset_field_counts();
    }
    line_number++;
}

/* Detect CSV format by first non-empty line */
^[^,\t|\n]+,[^,\t|\n]+.*	{
    if (!format_detected) {
        format_detected = 1;
        delimiter = ',';
        printf("# Format detected: CSV\n");
        if (output_file) {
            fprintf(output_file, "CSV\n");
        }
    }
    BEGIN CSV_FIELD;
}

/* Detect pipe-delimited format */
^[^|\t\n]+|[^|\t\n]+.*	{
    if (!format_detected) {
        format_detected = 2;
        delimiter = '|';
        printf("# Format detected: Pipe-delimited\n");
        if (output_file) {
            fprintf(output_file, "PIPE\n");
        }
    }
    BEGIN PIPE_FIELD;
}

/* Detect tab-delimited format */
^[^\t\n]+\t[^\t\n]+.*	{
    if (!format_detected) {
        format_detected = 3;
        delimiter = '\t';
        printf("# Format detected: Tab-delimited\n");
        if (output_file) {
            fprintf(output_file, "TAB\n");
        }
    }
    BEGIN TAB_FIELD;
}

/* CSV Field Processing */
<CSV_FIELD>[^,]*	{
    process_field(yytext);
}

<CSV_FIELD>,	{
    field_count++;
    BEGIN INITIAL;
}

<CSV_FIELD>\n	{
    field_count++;
    printf("\n");
    token_count += field_count;
    reset_field_counts();
    line_number++;
    BEGIN INITIAL;
}

/* Pipe Field Processing */
<PIPE_FIELD>[^|]*	{
    process_field(yytext);
}

<PIPE_FIELD>|	{
    field_count++;
    BEGIN INITIAL;
}

<PIPE_FIELD>\n	{
    field_count++;
    printf("\n");
    token_count += field_count;
    reset_field_counts();
    line_number++;
    BEGIN INITIAL;
}

/* Tab Field Processing */
<TAB_FIELD>[^\t]*	{
    process_field(yytext);
}

<TAB_FIELD>\t	{
    field_count++;
    BEGIN INITIAL;
}

<TAB_FIELD>\n	{
    field_count++;
    printf("\n");
    token_count += field_count;
    reset_field_counts();
    line_number++;
    BEGIN INITIAL;
}

/* Handle other characters as unquoted fields */
[^,\t|\n]+\t{
    process_field(yytext);
}

[^,\t|]+\	{
    field_count++;
}

%%

/*
 * Main function
 */
int main(int argc, char *argv[]) {
    /* Initialize */
    line_number = 0;
    field_count = 0;
    token_count = 0;
    format_detected = 0;
    
    /* Check for output file argument */
    if (argc > 1) {
        output_file = fopen(argv[1], "w");
        if (!output_file) {
            fprintf(stderr, "Error: Cannot open output file '%s'\n", argv[1]);
            return 1;
        }
    } else {
        output_file = stdout;
    }
    
    /* Print header */
    printf("# Data Processing Utility\n");
    printf("# Line \t Fields \t Tokens\n");
    
    /* Run the lexer */
    yylex();
    
    /* Print summary */
    printf("# Processed %d lines with %d total tokens\n", line_number, token_count);
    
    /* Close output file if opened */
    if (output_file && output_file != stdout) {
        fclose(output_file);
    }
    
    return 0;
}

/*
 * Process a field value
 */
static void process_field(const char *field) {
    static int last_field_count = 0;
    
    /* Trim whitespace */
    char trimmed[MAX_BUFFER_SIZE];
    int len = strlen(field);
    int start = 0;
    int end = len - 1;
    
    /* Find first non-whitespace */
    while (start < len && isspace((unsigned char)field[start])) {
        start++;
    }
    
    /* Find last non-whitespace */
    while (end >= start && isspace((unsigned char)field[end])) {
        end--;
    }
    
    /* Copy trimmed string */
    int trim_len = end - start + 1;
    strncpy(trimmed, field + start, trim_len);
    trimmed[trim_len] = '\0';
    
    /* Print field */
    printf("%s\t", trimmed);
    
    /* Track field count */
    if (last_field_count != field_count) {
        last_field_count = field_count;
        field_count++;
    }
}

/*
 * Reset field counters for new line
 */
static void reset_field_counts(void) {
    field_count = 0;
}

/*
 * Detect data format from line
 */
static void detect_format(const char *line) {
    if (!format_detected) {
        if (strchr(line, ',') != NULL) {
            format_detected = 1;
            delimiter = ',';
        } else if (strchr(line, '|') != NULL) {
            format_detected = 2;
            delimiter = '|';
        } else if (strchr(line, '\t') != NULL) {
            format_detected = 3;
            delimiter = '\t';
        }
    }
}

/*
 * Write field to CSV output
 */
static void write_field_to_csv(const char *field) {
    if (output_file) {
        fprintf(output_file, "%s,", field);
    }
}

/*
 * Write field to TSV output
 */
static void write_field_to_tsv(const char *field) {
    if (output_file) {
        fprintf(output_file, "%s\t", field);
    }
}
