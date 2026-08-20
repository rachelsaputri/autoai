import Foundation

let records = [
    Record(id: \"001\", timestamp: Date(), payload: [\"name\": \"  Alice  \", \"age\": 30, \"city\": \"New York\"]),
    Record(id: \"002\", timestamp: Date(), payload: [\"name\": \"Bob\", \"age\": \"Not a number\", \"city\": \"Boston\"]), // Type mismatch
    Record(id: \"003\", timestamp: Date(), payload: [\"name\": \"Charlie\", \"city\": \"Chicago\"]), // Missing age
    Record(id: \"004\", timestamp: Date(), payload: [\"name\": \"Dave\", \"age\": 25, \"city\": \"Seattle\"]),
]

let pipeline = DataProcessingPipeline()
    .addStep(TrimmerTransformer())
    .addStep(RequiredFieldValidator([\"name\", \"age\"]))
    .addStep(TypeValidator(typeMap: [\"age\": [Int.self]]))
    .addStep(HashTransformer())
    .addStep(LogReporter(logFile: \"pipeline.log\"))

let (success, failures) = pipeline.execute(records)

print(\"\\n=== Processing Complete ===\")
print(\"Successful Records: \(success.count)\")
print(\"Failed Records: \(failures.count)\")

for record in success {
    print(\"\\n[SUCCESS] ID: \(record.id)\")
    print(\"  Data: \(record.payload)\")
}

if !failures.isEmpty {
    print(\"\\n[FAILURES]\")
    for error in failures {
        print(\"  - \(error.localizedDescription)\")
    }
}
