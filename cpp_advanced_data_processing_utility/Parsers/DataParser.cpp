"#include <string>
#include <vector>
#include <fstream>
#include <sstream>

struct DataRecord;

class DataParser {
public:
    std::vector<DataRecord> readCSV(const std::string& filepath) {
        std::vector<DataRecord> records;
        std::ifstream file(filepath);
        if (!file.is_open()) {
            throw std::runtime_error(\"Failed to open file: \" + filepath);
        }

        std::string line;
        std::vector<std::string> headers;
        bool isHeader = true;

        while (std::getline(file, line)) {
            std::stringstream ss(line);
            std::string field;
            std::vector<std::string> values;
            
            while (std::getline(ss, field, ',')) {
                values.push_back(field);
            }

            if (isHeader) {
                headers = values;
                isHeader = false;
                continue;
            }

            DataRecord record;
            record.row_id = std::to_string(records.size() + 1);
            for (size_t i = 0; i < headers.size(); ++i) {
                if (i < values.size()) {
                    record.fields[headers[i]] = values[i];
                }
            }
            records.push_back(record);
        }
        return records;
    }
};
