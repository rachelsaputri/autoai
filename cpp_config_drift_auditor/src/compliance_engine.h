#ifndef COMPLIANCE_ENGINE_H
#define COMPLIANCE_ENGINE_H

#include <vector>
#include "drift_detector.h"

class ComplianceEngine {
public:
    bool verifyCompliance(const std::vector<DriftRecord>& drifts);
private:
    double calculateRiskScore(const std::vector<DriftRecord>& drifts);
};

#endif // COMPLIANCE_ENGINE_H
