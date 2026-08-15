#ifndef DRIFT_REGISTRY_H
#define DRIFT_REGISTRY_H

#include <vector>
#include <string>
#include <map>
#include "drift_detector.h"

class DriftRegistry {
public:
    void registerDrifts(const std::vector<DriftRecord>& drifts);
    bool hasDrift(const std::string& key) const;
    int getDriftCount() const;
    double getAverageSeverity() const;
private:
    std::vector<DriftRecord> registered_drifts;
};

#endif // DRIFT_REGISTRY_H
