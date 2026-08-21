/*
 * model.mod
 * This is the AMPL model definition file.
 * It performs data normalization, anomaly detection, and policy compliance scoring.
 */

# --- Data Declarations ---
set RECORDS; 
set CHECKS;
param input_data{RECORDS, CHECKS};
param threshold_1;
param threshold_2;
param threshold_3;

# --- Parameters ---
param base_score default 0;
param max_score default 100;

# --- Derived Data Processing ---
# Normalize input_data for record r and check c between 0 and 1
var normalized_value{RECORDS, CHECKS} >= 0, <= 1;

# --- Anomaly Detection ---
# Binary variable: 1 if the normalized value exceeds a safe buffer (0.9) from the threshold, else 0
var is_anomaly{RECORDS, CHECKS} binary;

# --- Policy Compliance Scoring ---
# Binary variable: 1 if record r passes the overall compliance policy, else 0
var is_compliant{RECORDS} binary;

# Continuous variable: compliance_score for record r (0-100)
var compliance_score{RECORDS} >= 0, <= max_score;

# --- Logic & Constraints ---

# 1. Data Normalization Logic
# We scale input_data based on a hypothetical max value per check to fit 0-1 range.
# For simplicity in this self-contained example, we normalize based on the global max.
param global_max_data = max{r in RECORDS, c in CHECKS} input_data[r,c];

constraint norm_logic{r in RECORDS, c in CHECKS}:
    normalized_value[r,c] = input_data[r,c] / global_max_data;

# 2. Anomaly Detection Logic
# If normalized_value is significantly higher than the threshold relative to max, it's an anomaly.
# We define a buffer: threshold_scaled = threshold / global_max_data
param scaled_threshold_1 := threshold_1 / global_max_data;
param scaled_threshold_2 := threshold_2 / global_max_data;
param scaled_threshold_3 := threshold_3 / global_max_data;

param threshold_val{c in CHECKS} :=
    if c = 1 then scaled_threshold_1
    else if c = 2 then scaled_threshold_2
    else scaled_threshold_3;

# If value is greater than threshold, flag as anomaly
# We use a large M (M-value method) for binary logic if needed, but direct logic works here.
# To keep it strictly AMPL compliant with solvers like CPLEX/Gurobi:
const M := 1;

constraint anomaly_logic{r in RECORDS, c in CHECKS}:
    is_anomaly[r,c] = 1 
    if normalized_value[r,c] >= threshold_val[c]
    else 0;

# 3. Compliance Policy Logic
# A record is compliant if it has fewer than 2 anomalies (lenient policy for demonstration).
# Count anomalies for record r
param anomaly_count{r in RECORDS} = sum{c in CHECKS} is_anomaly[r,c];

# Constraint for compliance: if anomaly_count > 1, is_compliant must be 0.
# is_compliant <= 1 - (anomaly_count > 1)
# Since anomaly_count is integer, we can use:
# is_compliant = 1 if anomaly_count <= 1 else 0

constraint compliance_logic{r in RECORDS}:
    is_compliant[r] = 1 
    if anomaly_count[r] <= 1
    else 0;

# 4. Score Calculation
# Score is base 100 minus penalty for anomalies.
# Penalty per anomaly: 15 points.
# compliance_score = 100 - (15 * anomaly_count)

constraint score_logic{r in RECORDS}:
    compliance_score[r] = 100 - (15 * anomaly_count[r]);

# --- Objective Function ---
# Maximize the total compliance score across all records.
maximize total_compliance_score: sum{r in RECORDS} compliance_score[r];

# --- Output ---
# Display results
option solver cplex;
# option solver gurobi;

solve;

display normalized_value;
display is_anomaly;
display is_compliant;
display compliance_score;
