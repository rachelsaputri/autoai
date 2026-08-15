#include "report_generator.h"
#include <fstream>
#include <sstream>
#include <iomanip>
#include <ctime>

void ReportGenerator::generateReport(
    const std::vector<DriftRecord>& drifts,
    bool is_compliant,
    const std::string& output_path
) {
    std::ofstream file(output_path);
    if (!file.is_open()) {
        throw std::runtime_error("Failed to open report file: " + output_path);
    }

    std::time_t now = std::time(nullptr);
    char time_buf[100];
    std::strftime(time_buf, sizeof(time_buf), "%Y-%m-%dT%H:%M:%S", std::localtime(&now));

    file << "{\n";
    file << "  \"audit_timestamp\": \"" << time_buf << "\",\n";
    file << "  \"compliance_status\": " << (is_compliant ? "true" : "false") << ",\n";
    file << "  \"total_drifts\": " << drifts.size() << ",\n";
    file << "  \"drifts\": [\n";

    for (size_t i = 0; i < drifts.size(); ++i) {
        const auto& d = drifts[i];
        file << "    {\n";
        file << "      \"key\": \"" << d.key << "\",\n";
        file << "      \"section\": \"" << d.section << "\",\n";
        file << "      \"drift_type\": \"" << d.drift_type << "\",\n";
        file << "      \"expected_value\": \"" << d.expected_value << "\",\n";
        file << "      \"actual_value\": \"" << d.actual_value << "\",\n";
        file << std::fixed << std::setprecision(2);
        file << "      \"severity_score\": " << d.severity_score << "\n";
        file << "    }" << (i < drifts.size() - 1 ? "," : "") << "\n";
    }

    file << "  ]\n";
    file << "}\n";

    file.close();
}
