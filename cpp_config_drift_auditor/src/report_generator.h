#ifndef REPORT_GENERATOR_H
#define REPORT_GENERATOR_H

#include <string>
#include <vector>
#include "drift_detector.h"

class ReportGenerator {
public:
    void generateReport(
        const std::vector<DriftRecord>& drifts,
        bool is_compliant,
        const std::string& output_path
    );
};

#endif // REPORT_GENERATOR_H
