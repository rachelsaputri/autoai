#ifndef DRIFT_DETECTOR_H
#define DRIFT_DETECTOR_H

#include <string>
#include <map>
#include <vector>
#include "policy_parser.h"

struct DriftRecord {
    std::string key;
    std::string expected_value;
    std::string actual_value;
    std::string section;
    std::string line_number;
    std::string drift_type; // ADDED, REMOVED, MODIFIED
    double severity_score;
};

class DriftDetector {
public:
    std::vector<DriftRecord> detectDrift(
        const std::map<std::string, ConfigEntry>& baseline,
        const std::map<std::string, ConfigEntry>& target
    );
private:
    DriftRecord createDriftRecord(
        const std::string& key,
        const std::string& expected,
        const std::string& actual,
        const std::string& section,
        const std::string& line_num,
        const std::string& type
    );
    double calculateSeverity(const std::string& key, const std::string& type);
};

#endif // DRIFT_DETECTOR_H
