#include <iostream>
#include <fstream>
#include <string>
#include <filesystem>
#include <stdexcept>
#include <chrono>
#include "drift_detector.h"
#include "compliance_engine.h"
#include "policy_parser.h"
#include "report_generator.h"
#include "drift_registry.h"

namespace fs = std::filesystem;

int main(int argc, char* argv[]) {
    std::string baseline_path;
    std::string target_path;
    std::string output_path;

    if (argc != 5) {
        std::cerr << "Usage: " << argv[0] << " --baseline <path> --target <path> --output <path>\n";
        return EXIT_FAILURE;
    }

    for (int i = 1; i < argc; ++i) {
        std::string arg = argv[i];
        if ((arg == "--baseline" || arg == "-b") && i + 1 < argc) {
            baseline_path = argv[++i];
        } else if ((arg == "--target" || arg == "-t") && i + 1 < argc) {
            target_path = argv[++i];
        } else if ((arg == "--output" || arg == "-o") && i + 1 < argc) {
            output_path = argv[++i];
        }
    }

    if (baseline_path.empty() || target_path.empty() || output_path.empty()) {
        std::cerr << "Error: Missing required arguments.\n";
        return EXIT_FAILURE;
    }

    if (!fs::exists(baseline_path)) {
        std::cerr << "Error: Baseline configuration file not found: " << baseline_path << "\n";
        return EXIT_FAILURE;
    }

    if (!fs::exists(target_path)) {
        std::cerr << "Error: Target configuration file not found: " << target_path << "\n";
        return EXIT_FAILURE;
    }

    try {
        PolicyParser parser;
        auto baseline_config = parser.parse(baseline_path);
        auto target_config = parser.parse(target_path);

        DriftDetector detector;
        std::vector<DriftRecord> drifts = detector.detectDrift(baseline_config, target_config);

        DriftRegistry registry;
        registry.registerDrifts(drifts);

        ComplianceEngine engine;
        bool compliance_status = engine.verifyCompliance(drifts);

        ReportGenerator reporter;
        reporter.generateReport(drifts, compliance_status, output_path);

        std::cout << "Audit completed successfully. Compliance status: "
                  << (compliance_status ? "PASS" : "FAIL") << "\n";
        std::cout << "Report generated at: " << output_path << "\n";

        return EXIT_SUCCESS;
    } catch (const std::exception& e) {
        std::cerr << "Fatal error during audit: " << e.what() << "\n";
        return EXIT_FAILURE;
    }
}
