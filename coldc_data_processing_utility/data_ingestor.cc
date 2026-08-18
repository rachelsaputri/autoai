package data_ingestor

import std.io
import std.fs

// Define data structures for different formats
type JsonData { key: String, value: Any }
type CsvData { columns: List[String], rows: List[List[String]] }
type XmlData { root: String, elements: List[Map[String, String]] }

// Function to read JSON data
fn read_json(file_path: String): JsonData {
    let content = std.fs.read_file(file_path)
    let parsed = std.json.parse(content)
    return parsed.as(JsonData)
}

// Function to read CSV data
fn read_csv(file_path: String): CsvData {
    let content = std.fs.read_file(file_path)
    let lines = content.split("\n")
    let columns = lines[0].split(",")
    let rows = []
    for (line in lines[1..]) {
        rows.append(line.split(","))
    }
    return { columns, rows }
}

// Function to read XML data
fn read_xml(file_path: String): XmlData {
    let content = std.fs.read_file(file_path)
    let parsed = std.xml.parse(content)
    let elements = []
    for (element in parsed.elements) {
        let map = {}
        for (attr in element.attributes) {
            map[attr.name] = attr.value
        }
        elements.append(map)
    }
    return { root: parsed.root, elements }
}

// Main ingestion function
fn ingest_data(file_path: String): Any {
    if std.fs.extension(file_path) == ".json" {
        return read_json(file_path)
    } else if std.fs.extension(file_path) == ".csv" {
        return read_csv(file_path)
    } else if std.fs.extension(file_path) == ".xml" {
        return read_xml(file_path)
    } else {
        throw new UnsupportedFormatError("Unsupported file format")
    }
}
