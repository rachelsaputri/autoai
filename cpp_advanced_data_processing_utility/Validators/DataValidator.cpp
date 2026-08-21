"#include <string>
#include <vector>
#include <map>
#include <stdexcept>
#include <regex>

struct DataRecord;

class DataValidator {
public:
    std::vector<std::string> validate(const std::vector<DataRecord>& records, const std::vector<std::string>& requiredFields) {
        std::vector<std::string> errors;
        int rowNum = 0;
        for (const auto& record : records) {
            rowNum++;
            for (const auto& field : requiredFields) {
                if (record.fields.find(field) == record.fields.end() || record.fields[field].empty()) {
                    errors.push_back(\"Row \" + std::to_string(rowNum) + \": Missing or empty field '\" + field + \"'\");
                }
            }
        }
        return errors;
    }
};
