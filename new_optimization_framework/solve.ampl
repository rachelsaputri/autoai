# AMPL Solver Execution Script
# Reads model and data, solves using CPLEX/Gurobi default, displays results

option solver cplex;
option cplex_options 'time_limit=60 threads=4';

model model.mod;
data data.dat;

solve;

printf '\nOptimization Complete. Results:\n' > output.log;

# Display Objective Value
printf 'Total Cost: %g\n', Total_Cost >> output.log;

# Display Production Allocation
printf '\nProduction Allocation (x):\n' >> output.log;
for {p in PRODUCTS} {
    for {i in NODES} {
        printf '%s %s: %.2f\n', i, p, x[i, p] >> output.log;
    }
}

# Display Transport Allocation
printf '\nTransport Allocation (y):\n' >> output.log;
for { (i, j) in EDGES } {
    for {p in PRODUCTS} {
        if y[i, j, p] > 0 then
            printf '%s -> %s (%s): %.2f\n', i, j, p, y[i, j, p] >> output.log;
    }
}

printf '\nEnd of Report.\n' >> output.log;

write output.log;
