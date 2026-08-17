model optimization_framework;

# Sets
define SET OF NODES;
define SET OF EDGES := { (i, j) | i in NODES, j in NODES, i <> j };
define SET OF PRODUCTS;

# Parameters
param demand{PRODUCTS} >= 0;
param capacity{NODES} >= 0;
param production_cost{NODES, PRODUCTS} >= 0;
param transport_cost{EDGES, PRODUCTS} >= 0;

# Decision Variables
var x{NODES, PRODUCTS} >= 0;
var y{EDGES, PRODUCTS} >= 0;

# Objective: Minimize Total Cost
minimize Total_Cost:
    sum { (i, p) in NODES cross PRODUCTS } production_cost[i, p] * x[i, p]
    + sum { (i, j, p) in EDGES cross PRODUCTS } transport_cost[(i, j), p] * y[(i, j), p];

# Constraints
subject to Production_Capacity {i in NODES, p in PRODUCTS}:
    x[i, p] <= capacity[i];

subject to Demand_Met {j in NODES, p in PRODUCTS}:
    sum { (i, k) in NODES cross PRODUCTS : k = p } y[(i, j), k] = demand[p];

subject to Flow_Balance {i in NODES, p in PRODUCTS}:
    x[i, p] + sum { (j, k) in EDGES cross PRODUCTS : j = i, k = p } y[(j, i), k]
    = sum { (j, k) in EDGES cross PRODUCTS : j = i, k = p } y[(i, j), k]
    + sum { (j, k) in NODES cross PRODUCTS : j = i, k = p } y[(i, j), k];

subject to Nonnegativity:
    x[i, p] >= 0 for all (i, p) in NODES cross PRODUCTS;
    y[i, j, p] >= 0 for all (i, j, p) in EDGES cross PRODUCTS;
