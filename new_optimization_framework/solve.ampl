# solve.ampl
# Script to load the model and data, solve, and output results.

print "Loading AMPL model...";

do read "model.mod";
do read "data.dat";

do print "Data loaded. Executing optimization...";

do solve;

do print "\nOptimization complete. Results:";

do display normalized_value;

do display is_anomaly;

do display is_compliant;

do display compliance_score;

do print "\nTotal Compliance Score:", total_compliance_score;

do print "Done.";
