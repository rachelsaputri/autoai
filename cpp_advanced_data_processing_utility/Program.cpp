"#include <iostream>
#include <vector>
#include <string>
#include <stdexcept>
#include <map>
#include <fstream>
#include <sstream>
#include <algorithm>

#include \"Models/DataRecord.h\"
#include \"Parsers/DataParser.h\"
#include \"Validators/DataValidator.h\"
#include \"Transformers/DataTransformer.h\"
#include \"Exporters/DataExporter.h\"

int main(int argc, char* argv[]) {
    if (argc != 3) {
        std::cerr << \"Usage: \" << argv[0] << \" <input.csv> <output.csv>\\n\";
        return 1;
    }

    std::string inputPath = argv[1];
    std::string outputPath = argv[2];

    try {
        DataParser parser;
        DataValidator validator;
        DataTransformer transformer;
        DataExporter exporter;

        // 1. Ingest
        std::vector<DataRecord> records = parser.readCSV(inputPath);
        std::cout << \"Ingested \" << records.size() << \" records.\\n\";

        // 2. Validate
        std::vector<std::string> requiredFields = {\"name\", \"email\", \"age\"};
        std::vector<std::string> errors = validator.validate(records, requiredFields);
        if (!errors.empty()) {
            std::cerr << \"Validation errors:\\n\";
            for (const auto& err : errors) {
                std::cerr << err << \"\\n\";
            }
            return 1;
        }
        std::cout << \"Validation passed.\\n\";

        // 3. Transform
        transformer.transform(records);

        // 4. Export
        exporter.exportCSV(records, outputPath);

    } catch (const std::exception& e) {
        std::cerr << \"Error: \" << e.what() << std::endl;
        return 1;
    }

    return 0;
}
