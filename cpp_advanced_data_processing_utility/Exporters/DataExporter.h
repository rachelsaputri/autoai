"#ifndef DATA_EXPORTER_H
#define DATA_EXPORTER_H

#include <string>
#include <vector>

struct DataRecord;

class DataExporter {
public:
    void exportCSV(const std::vector<DataRecord>& records, const std::string& outputPath);
};

#endif
