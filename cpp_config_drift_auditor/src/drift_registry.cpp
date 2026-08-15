#include "drift_registry.h"
#include <numeric>

void DriftRegistry::registerDrifts(const std::vector<DriftRecord>& drifts) {
    registered_drifts = drifts;
}

bool DriftRegistry::hasDrift(const std::string& key) const {
    for (const auto& d : registered_drifts) {
        if (d.key == key) {
            return true;
        }
    }
    return false;
}

int DriftRegistry::getDriftCount() const {
    return registered_drifts.size();
}

double DriftRegistry::getAverageSeverity() const {
    if (registered_drifts.empty()) return 0.0;
    double sum = 0.0;
    for (const auto& d : registered_drifts) {
        sum += d.severity_score;
    }
    return sum / registered_drifts.size();
}
