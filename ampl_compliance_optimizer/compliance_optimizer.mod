/*
 * COMPLIANCE RISK OPTIMIZATION ENGINE
 * Language: AMPL
 * Purpose: Optimize compliance risk posture using linear/integer programming
 */

set DOMAINS;
set CONTROLS;
set POLICIES;
set SCENARIOS;

data;

/* Parameters */
param risk_score {DOMAINS} >= 0;
param control_effectiveness {DOMAINS, CONTROLS} >= 0;
param implementation_cost {DOMAINS, CONTROLS} >= 0;
param compliance_weight {DOMAINS} >= 0;
param budget_limit >= 0;
param mandatory_coverage {DOMAINS};
param threshold_violation {DOMAINS} >= 0;

param scenario_weight {SCENARIOS} >= 0;

/* Sets for data binding */
set ACTIVE_CONTROLS := {d in DOMAINS, c in CONTROLS : control_effectiveness[d,c] > 0};
set MANDATORY_CONTROLS := {d in DOMAINS, c in CONTROLS : control_effectiveness[d,c] = 1};

/* Decision Variables */
var implement {ACTIVE_CONTROLS} binary;          # 1 if control is implemented, 0 otherwise
var residual_risk {DOMAINS} >= 0;                # Continuous risk after mitigation
var scenario_penalty {SCENARIOS} >= 0;           # Penalty for failing scenario thresholds

/* Objective Function: Minimize weighted compliance risk */
minimize TotalRisk:
    sum {d in DOMAINS} compliance_weight[d] * residual_risk[d]
    + sum {s in SCENARIOS} scenario_weight[s] * scenario_penalty[s];

/* Constraints */

/* Risk reduction equals implemented controls' effectiveness */
constraint risk_balance {d in DOMAINS}:
    residual_risk[d] = risk_score[d] - sum {(d,c) in ACTIVE_CONTROLS} control_effectiveness[d,c] * implement[d,c];

/* Budget constraint */
constraint budget_limit:
    sum {(d,c) in ACTIVE_CONTROLS} implementation_cost[d,c] * implement[d,c] <= budget_limit;

/* Mandatory control enforcement */
constraint mandatory_coverage {d in DOMAINS, c in CONTROLS : (d,c) in MANDATORY_CONTROLS}:
    implement[d,c] = 1;

/* Threshold violation detection */
constraint threshold_check {d in DOMAINS}:
    scenario_penalty[d] >= residual_risk[d] - threshold_violation[d];
    scenario_penalty[d] >= 0;

/* Logical bounds */
subject to {
    for {d in DOMAINS}:
        residual_risk[d] <= risk_score[d];
        residual_risk[d] >= 0;
}

/* Output directives */
option solver cplex;
option cplex_options 'logFile=optimizer.log timeLimit=300';

solve;

/* Generate results */
printf 'DOMAIN: %s | RESIDUAL_RISK: %.2f | MANDATORY_CONTROLS: %s\n' %
    {d in DOMAINS} d, residual_risk[d],
    {d in DOMAINS, c in CONTROLS : (d,c) in MANDATORY_CONTROLS} implement[d,c];

printf 'CONTROL IMPLEMENTATION STATUS:\n';
printf 'DOMAIN: %s | CONTROL: %s | IMPLEMENTED: %d | REDUCTION: %.2f\n' %
    {(d,c) in ACTIVE_CONTROLS} d, c, implement[d,c], control_effectiveness[d,c] * implement[d,c];

printf 'TOTAL_OPTIMIZED_RISK: %.2f\n', TotalRisk;

stop;
