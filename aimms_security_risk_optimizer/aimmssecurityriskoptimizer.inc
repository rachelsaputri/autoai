!=======================================================================================================================================
! Model: Autonomous Security Posture Optimization and Risk Quantification Engine
! Language: AIMMS
!=======================================================================================================================================

!---------------------------------------------------------------------------------------------------------------------------------------
! Set Declarations
!---------------------------------------------------------------------------------------------------------------------------------------

Set 
  AssetSet { 
    Index: i;
    Property: string CriticalityClass;
  }
  
  VulnerabilitySet { 
    Index: v;
    Property: string Category;
  }
  
  SecurityControlSet { 
    Index: c;
    Property: string Type;
    Property: string TargetAssetClass; ! Assets that this control can protect
  }
  
  ConstraintSet { 
    Index: k;
    Property: string Description;
  }
  
  BusinessUnitSet { 
    Index: bu;
  }
  
  ! Mapping sets
  Set AssetToBusinessUnit { 
    IndexPair: [ i, bu ];
  }
  
  Set VulnerabilityAffectedAsset { 
    IndexPair: [ v, i ];
  }
  
  Set ControlToAsset { 
    IndexPair: [ c, i ];
    Property: float Efficiency; ! Efficiency of control c on asset i
  }

!---------------------------------------------------------------------------------------------------------------------------------------
! Parameter Declarations
!---------------------------------------------------------------------------------------------------------------------------------------

Parameter 
  ! Asset Parameters
  AssetValue { 
    IndexDomain: i;
    Property: float;
    DisplayName: "Business Value of Asset";
    InitialData: table 
      ["asset1"]: 1000000, 
      ["asset2"]: 500000, 
      ["asset3"]: 200000;
  }
  
  AssetExposure { 
    IndexDomain: i;
    Property: float;
    DisplayName: "External Exposure Factor (0-1)";
    InitialData: table 
      ["asset1"]: 0.9, 
      ["asset2"]: 0.7, 
      ["asset3"]: 0.2;
  }
  
  ! Vulnerability Parameters
  VulnerabilitySeverity { 
    IndexDomain: v;
    Property: float;
    DisplayName: "CVSS Severity Score (0-10)";
    InitialData: table 
      ["vuln1"]: 9.8, 
      ["vuln2"]: 6.5, 
      ["vuln3"]: 3.1;
  }
  
  ! Security Control Parameters
  ControlCost { 
    IndexDomain: c;
    Property: float;
    DisplayName: "Implementation and Maintenance Cost";
    InitialData: table 
      ["control1"]: 50000, 
      ["control2"]: 25000, 
      ["control3"]: 10000;
  }
  
  ControlLifespan { 
    IndexDomain: c;
    Property: float;
    DisplayName: "Expected Lifespan (months)";
    InitialData: table 
      ["control1"]: 24, 
      ["control2"]: 12, 
      ["control3"]: 6;
  }
  
  ! Optimization Constraints
  TotalBudget { 
    Property: float;
    DisplayName: "Maximum Security Budget";
    InitialData: 150000;
  }

!---------------------------------------------------------------------------------------------------------------------------------------
! Variable Declarations
!---------------------------------------------------------------------------------------------------------------------------------------

Variable 
  ! Decision Variables
  SelectControl { 
    IndexDomain: c;
    Property: float;
    DeclarationType: Binary;
    DisplayName: "Select Security Control";
    Help: "1 if the control is deployed, 0 otherwise";
  }
  
  ! Derived Parameters
  AssetRisk { 
    IndexDomain: i;
    Property: float;
    DeclarationType: Derived;
    Help: "Calculated risk exposure for a specific asset";
  }
  
  TotalRisk { 
    Property: float;
    DeclarationType: Derived;
    Help: "Aggregate enterprise risk";
  }
  
  ControlBenefit { 
    IndexDomain: c;
    Property: float;
    DeclarationType: Derived;
    Help: "Estimated risk reduction benefit of a control";
  }

!---------------------------------------------------------------------------------------------------------------------------------------
! Objective and Constraint Declarations
!---------------------------------------------------------------------------------------------------------------------------------------

Objective 
  MaximizeRiskReduction {
    DeclarationType: Maximization;
    DisplayName: "Maximize Enterprise Risk Reduction per Dollar";
    Help: "Maximizes the ratio of risk reduction to total cost";
    Expression: TotalRiskReduction / TotalCost;
  }

Constraint 
  BudgetConstraint {
    IndexDomain: k;
    Property: float;
    DeclarationType: Lhs;
    DisplayName: "Total Cost Constraint";
    Help: "Total cost of selected controls must not exceed the budget";
    Expression: 
      sum( c: SelectControl(c) * ControlCost(c) ) <= TotalBudget;
  }
  
  RiskReduction {
    IndexDomain: k;
    Property: float;
    DeclarationType: Lhs;
    DisplayName: "Calculate Aggregate Risk Reduction";
    Help: "Defines the mathematical relationship for total risk reduction";
    Expression: 
      TotalRiskReduction = sum( i: AssetRisk(i) * AssetValue(i) * AssetExposure(i) * (1 - sum( c: ControlToAsset(c, i) * SelectControl(c) * ControlToAsset_Efficiency(c, i) ) ) )
                         - sum( i: AssetRisk(i) * AssetValue(i) * AssetExposure(i) * (1 - 0) );
  }
  
  TotalCost {
    IndexDomain: k;
    Property: float;
    DeclarationType: Lhs;
    DisplayName: "Calculate Total Cost";
    Help: "Defines the mathematical relationship for total cost";
    Expression: 
      TotalCost = sum( c: SelectControl(c) * ControlCost(c) );
  }
