"#ifndef DATA_VALIDATOR_H
#define DATA_VALIDATOR_H

#include <string>
#include <vector>

struct DataRecord;

class DataValidator {
public:
    std::vector<std::string> validate(const std::vector<DataRecord>& records, const std::vector<std::string>& requiredFields);
};

#endif
