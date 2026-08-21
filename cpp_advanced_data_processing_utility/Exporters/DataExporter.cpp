"#include <string>
#include <vector>
#include <map>
#include <iostream>
#include <fstream>

struct DataRecord {
    std::string row_id;
    std::map<std::string, std::string> fields;
};

class DataExporter {
public:
    void exportCSV(const std::vector<DataRecord>& records, const std::string& outputPath) {
        if (records.empty()) return;
        
        std::ofstream file(outputPath);
        if (!file.is_open()) {
            throw std::runtime_error(\"Failed to open output file: \" + outputPath);
        }

        // Write headers
        bool first = true;
        for (const auto& record : records) {
            if (first) {
                for (const auto& pair : record.fields) {
                    file << pair.first;
                    if (pair.first != records[0].fields.rbegin()->first) file << \",\";
                }
                file << \"\\n\";
                first = false;
            }
            
            // Write values
            bool firstVal = true;
            for (const auto& pair : record.fields) {
                if (!firstVal) file << \",\";
                file << pair.second;
                firstVal = false;
            }
            file << \"\\n\";
        }
        std::cout << \"Exported to \" << outputPath << std::endl;
    }
};
