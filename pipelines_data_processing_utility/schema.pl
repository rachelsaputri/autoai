#!/usr/bin/env pipeline
# File: schema.pl
# Purpose: Define the strict structure of the data pipeline.

pipeline_schema {
    version "1.0.0"

    field "id" {
        type "int"
        required true
        validation "positive_integer"
    }

    field "timestamp" {
        type "datetime"
        required true
        format "ISO8601"
    }

    field "category" {
        type "string"
        required false
        enum ["A", "B", "C"]
    }

    field "value" {
        type "float"
        required true
        range [0.0, 100.0]
    }

    field "description" {
        type "string"
        required false
        max_length 255
    }
}
