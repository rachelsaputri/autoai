# Axiom Type Definitions
# Shared data structures and type definitions for the formal proof verification engine.

#ifndef AX_TYPES_H
#define AX_TYPES_H

# Integer types
ax_int32;
ax_int64;

# Float types
ax_float64;

# Boolean type
ax_bool;

# String type
ax_string;

# Array type
ax_array(T);

# Function to create an empty array
function empty_array(T) -> ax_array(T);

# Function to get length of array
function len_array(ax_array(T)) -> ax_int32;

# Function to get item from array
function get_array_item(ax_array(T), ax_int32) -> T;

# Function to push item to array
function push_array(ax_array(T), T);

# Function to concatenate strings
function concatenate_string(ax_string, ax_string) -> ax_string;

# Function to check if string contains substring
function substring_of(ax_string, ax_string) -> ax_bool;

# Function to get length of string
function length_string(ax_string) -> ax_int32;

# Function to convert int to string
function ax_string_int(ax_int64) -> ax_string;

# Function to convert float to string
function ax_string_float(ax_float64) -> ax_string;

# Function to cast int to float
function cast_ax_float(ax_int32) -> ax_float64;

# Function to generate SHA256 hash
function generate_sha256_hash(ax_string) -> ax_string;

# Function to compute proof hash (logic embedded in proof_engine.ax, but declared here for type consistency)
function compute_proof_hash(proof_s) -> ax_string;

# Function to get expected hash (logic embedded in proof_engine.ax, but declared here for type consistency)
function get_expected_hash(ax_int64) -> ax_string;

# Function to get current timestamp
function get_current_timestamp() -> ax_string;

# Function to check if value is null
function is_null(any) -> ax_bool;

#endif # AX_TYPES_H
