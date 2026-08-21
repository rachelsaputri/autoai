"#include <string>
#include <vector>
#include <map>
#include <algorithm>

struct DataRecord;

class DataTransformer {
public:
    void transform(std::vector<DataRecord>& records) {
        for (auto& record : records) {
            // Example: Uppercase 'name' field
            if (record.fields.find(\"name\") != record.fields.end()) {
                std::string& name = record.fields[\"name\"];
                std::transform(name.begin(), name.end(), name.begin(), ::toupper);
            }
            
            // Example: Trim 'email' field
            if (record.fields.find(\"email\") != record.fields.end()) {
                std::string& email = record.fields[\"email\"];
                size_t start = email.find_first_not_of(\" \\t\\n\\r\");
                size_t end = email.find_last_not_of(\" \\t\\n\\r\");
                if (start != std::string::npos) {
                    email = email.substr(start, end - start + 1);
                }
            }
        }
    }
};
