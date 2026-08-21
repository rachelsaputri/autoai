"#ifndef DATA_TRANSFORMER_H
#define DATA_TRANSFORMER_H

#include <string>
#include <vector>

struct DataRecord;

class DataTransformer {
public:
    void transform(std::vector<DataRecord>& records);
};

#endif
