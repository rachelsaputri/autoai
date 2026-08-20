import Foundation
import Combine
import CryptoKit

// MARK: - Data Types

enum ProcessingError: Error, LocalizedError {
    case invalidInput
    case transformationFailed(String)
    case validationFailed(String)
    case encodingError
    case fileNotFound(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidInput:
            return \"Invalid input data.\"
        case .transformationFailed(let msg):
            return \"Transformation failed: \(msg)\"
        case .validationFailed(let msg):
            return \"Validation failed: \(msg)\"
        case .encodingError:
            return \"Failed to encode output.\"
        case .fileNotFound(let path):
            return \"File not found: \(path)\"
        }
    }
}

struct Record: Codable, Equatable {
    let id: String
    let timestamp: Date
    let payload: [String: Any]
    
    // Custom encoding to ensure any [String: Any] is handled safely
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(timestamp, forKey: .timestamp)
        try container.encode(payload, forKey: .payload)
    }
}

// MARK: - Pipeline Step Protocol

protocol PipelineStep {
    func process(_ record: Record) -> Record?
}

// MARK: - Transformers

class TrimmerTransformer: PipelineStep {
    func process(_ record: Record) -> Record? {
        var newPayload = record.payload
        newPayload.forEach { key, value in
            if let str = value as? String {
                newPayload[key] = str.trimmingCharacters(in: .whitespacesAndNewlines)
            }
        }
        return Record(id: record.id, timestamp: record.timestamp, payload: newPayload)
    }
}

class FilterTransformer: PipelineStep {
    let fieldToCheck: String
    let valueToMatch: Any
    
    init(fieldToCheck: String, valueToMatch: Any) {
        self.fieldToCheck = fieldToCheck
        self.valueToMatch = valueToMatch
    }
    
    func process(_ record: Record) -> Record? {
        let match = record.payload[fieldToCheck] == valueToMatch
        return match ? record : nil
    }
}

class HashTransformer: PipelineStep {
    func process(_ record: Record) -> Record? {
        let jsonStr = try? JSONSerialization.data(withJSONObject: [\"id\": record.id, \"payload\": record.payload])
        guard let data = jsonStr else { return nil }
        let hash = SHA256.hash(data: data)
        let hashStr = hash.map { String(format: \"%02x\", $0) }.joined()
        
        var newPayload = record.payload
        newPayload[\"_hash\"] = hashStr
        return Record(id: record.id, timestamp: record.timestamp, payload: newPayload)
    }
}

// MARK: - Validators

class RequiredFieldValidator: PipelineStep {
    let fields: [String]
    
    init(_ fields: [String]) {
        self.fields = fields
    }
    
    func process(_ record: Record) -> Record? {
        for field in fields {
            if record.payload[field] == nil {
                throw ProcessingError.validationFailed(\"Missing required field: \(field)\")
            }
        }
        return record
    }
}

class TypeValidator: PipelineStep {
    let typeMap: [String: [Any]] // field -> [valid_types]
    
    init(typeMap: [String: [Any]]) {
        self.typeMap = typeMap
    }
    
    func process(_ record: Record) -> Record? {
        for (field, validTypes) in typeMap {
            guard let value = record.payload[field] else { continue }
            let actualType = type(of: value)
            let isMatch = validTypes.contains { String(describing: $0) == String(describing: actualType) }
            if !isMatch {
                throw ProcessingError.validationFailed(\"Field '\(field)' type mismatch. Expected: \(validTypes), Got: \(actualType)\")
            }
        }
        return record
    }
}

// MARK: - Reporters

class LogReporter: PipelineStep {
    let logFile: String
    
    init(logFile: String) {
        self.logFile = logFile
    }
    
    func process(_ record: Record) -> Record? {
        let message = \"[\(Date().ISO8601Format())] Processed Record ID: \(record.id)\"
        if let fileHandle = try? FileHandle(forWritingTo: URL(fileURLWithPath: logFile)) {
            fileHandle.seekToEndOfFile()
            let data = (message + \"\\n\").data(using: .utf8)
            fileHandle.write(data!)
            fileHandle.closeFile()
        } else {
            try? \"\(message)\\n\".write(toFile: logFile, atomically: true, encoding: .utf8)
        }
        return record
    }
}

class CountingReporter: PipelineStep {
    static var processedCount = 0
    static var failedCount = 0
    
    func process(_ record: Record) -> Record? {
        CountingReporter.processedCount += 1
        return record
    }
}

typealias FailureCountingReporter = CountingReporter // Alias for semantic clarity

// MARK: - Pipeline

class DataProcessingPipeline {
    private var steps: [PipelineStep] = []
    
    func addStep(_ step: PipelineStep) -> DataProcessingPipeline {
        steps.append(step)
        return self
    }
    
    func execute(_ input: [Record]) -> ([Record], [Error]) {
        var processed: [Record] = []
        var errors: [Error] = []
        
        for record in input {
            var currentRecord: Record? = record
            var currentError: Error?
            
            // Break early on first error for a single record
            for step in steps {
                guard currentRecord != nil else { break }
                do {
                    currentRecord = try step.process(currentRecord!)
                } catch {
                    currentError = error
                    break
                }
            }
            
            if let error = currentError {
                errors.append(error)
                CountingReporter.failedCount += 1
            } else if let record = currentRecord {
                processed.append(record)
            }
        }
        
        return (processed, errors)
    }
}

// MARK: - Utility Functions

extension Date {
    func ISO8601Format() -> String {
        let formatter = ISO8601DateFormatter()
        return formatter.string(from: self)
    }
}
