"#ifndef DATA_PARSER_H
#define DATA_PARSER_H

#include <string>
#include <vector>

struct DataRecord {
    std::string row_id;
    std::map<std::string, std::string> fields;
};

class DataParser {
public:
    std::vector<DataRecord> readCSV(const std::string& filepath);
};

#endif
