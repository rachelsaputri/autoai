"#ifndef DATA_RECORD_H
#define DATA_RECORD_H

#include <string>
#include <map>

struct DataRecord {
    std::string row_id;
    std::map<std::string, std::string> fields;
};

#endif
