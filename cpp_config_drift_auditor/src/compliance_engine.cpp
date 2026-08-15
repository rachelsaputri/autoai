#include "compliance_engine.h"
#include <algorithm>
#include <numeric>

double ComplianceEngine::calculateRiskScore(const std::vector<DriftRecord>& drifts) {
    double total_risk = 0.0;
    for (const auto& d : drifts) {
        total_risk += d.severity_score;
    }
    return total_risk;
}

bool ComplianceEngine::verifyCompliance(const std::vector<DriftRecord>& drifts) {
    if (drifts.empty()) {
        return true;
    }

    double risk = calculateRiskScore(drifts);
    double threshold = 10.0;
    int critical_drifts = 0;

    for (const auto& d : drifts) {
        if (d.severity_score >= 4.0) {
            critical_drifts++;
        }
    }

    if (critical_drifts > 0) {
        return false;
    }

    return risk <= threshold;
}
