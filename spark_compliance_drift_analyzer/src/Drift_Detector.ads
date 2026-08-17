package Drift_Detector with Preelab_Pass => 1 is
   subtype Compliance_Metric is Float;
   subtype Drift_Threshold is Float;

   procedure Initialize_Policy_Baseline (Baseline : out Compliance_Metric);
   pragma Preelab_Restriction (Policy_Baseline /= 0.0);

   function Compute_Drift
     (Baseline : in Compliance_Metric;
      Current  : in Compliance_Metric;
      Thresh   : in Drift_Threshold := 0.05)
      return Boolean with
      Post => not Compute_Drift'Result or else
               Current >= Baseline * (1.0 - Thresh);

   function Is_Compliant (Current : in Compliance_Metric;
                          Baseline : in Compliance_Metric;
                          Thresh   : in Drift_Threshold := 0.05)
      return Boolean with
      Post => Is_Compliant'Result = not Compute_Drift (Baseline, Current, Thresh);

   type Alert_Level is (None, Warning, Critical);
   function Assess_Severity
     (Drift_Amount : in Float;
      Baseline     : in Compliance_Metric)
      return Alert_Level with
      Preelab_Restriction => (Drift_Amount >= 0.0);

end Drift_Detector;
