// DataProcessor.as
// Complete, production-ready ActionScript 3.0 data processing utility
// Handles validation, transformation, export, and error handling

package {
	import flash.utils.ByteArray;
	public class DataProcessor {
		private static const DEFAULT_DELIMITER:String = ",";
		private static const MAX_RECORD_SIZE:int = 1024 * 1024; // 1MB
		private static const MAX_FIELD_SIZE:int = 10000;
		
		public function DataProcessor() {
			// Constructor
		}
		
		public static function processData(dataString:String, config:XML):Array {
			var results:Array = new Array();
			var errors:Array = new Array();
			var delimiter:String = config.delimiter || DEFAULT_DELIMITER;
			var skipHeaders:Boolean = config.skipHeaders || false;
			var validationRule:String = config.validationRule || "none";
			
			var lines:Array = dataString.split("\n");
			var startIndex:int = skipHeaders ? 1 : 0;
			
			for (var i:int = startIndex; i < lines.length; i++) {
				var line:String = lines[i].trim();
				if (line == "") continue;
				
				if (line.length > MAX_RECORD_SIZE) {
					errors.push("Record at line " + (i+1) + " exceeds max size");
					continue;
				}
				
				var fields:Array = parseLine(line, delimiter);
				if (fields == null) {
					errors.push("Invalid format at line " + (i+1));
					continue;
				}
				
				var record:XML = createRecord(fields);
				if (validationRule != "none") {
					if (!validateRecord(record, validationRule)) {
						errors.push("Validation failed at line " + (i+1));
						continue;
					}
				}
				
				results.push(record);
			}
			
			return {
				"data": results,
				"errors": errors,
				"count": results.length,
				"errorCount": errors.length
			};
		}
		
		private static function parseLine(line:String, delimiter:String):Array {
			try {
				var fields:Array = new Array();
				var currentField:String = "";
				var inQuotes:Boolean = false;
				
				for (var i:int = 0; i < line.length; i++) {
					var char:String = line.charAt(i);
					
					if (char == '"') {
						if (inQuotes && i+1 < line.length && line.charAt(i+1) == '"') {
							currentField += '"';
							i++;
						} else {
							inQuotes = !inQuotes;
						}
					} else if (char == delimiter && !inQuotes) {
						fields.push(currentField);
						currentField = "";
					} else {
						currentField += char;
					}
				}
				
				fields.push(currentField);
				
				for each (var field:String in fields) {
					if (field.length > MAX_FIELD_SIZE) {
						return null;
					}
				}
				
				return fields;
			} catch (e:Error) {
				return null;
			}
		}
		
		private static function createRecord(fields:Array):XML {
			var record:XML = <record></record>;
			
			for (var i:int = 0; i < fields.length; i++) {
				var fieldName:String = "field_" + (i+1);
				record.appendChild(<{fieldName}>{fields[i]}</{fieldName}>);
			}
			
			return record;
		}
		
		private static function validateRecord(record:XML, rule:String):Boolean {
			switch (rule) {
				case "non_empty":
					for each (var child:XML in record.*) {
						if (child.toString().trim() == "") {
							return false;
						}
					}
					return true;
				
				case "numeric_first":
					if (record.field_1 != "" && isNaN(Number(record.field_1))) {
						return false;
					}
					return true;
				
				default:
					return true;
			}
		}
		
		public static function exportData(data:Array, format:String):String {
			switch (format.toLowerCase()) {
				case "csv":
					return exportToCSV(data);
				case "json":
					return exportToJSON(data);
				case "xml":
					return exportToXML(data);
				default:
					throw new Error("Unsupported format: " + format);
			}
		}
		
		private static function exportToCSV(data:Array):String {
			if (data.length == 0) return "";
			
			var lines:Array = new Array();
			var headers:Array = new Array();
			
			// Extract headers from first record
			var firstRecord:XML = data[0] as XML;
			for each (var child:XML in firstRecord.*) {
				headers.push(child.name().toString());
			}
			
			lines.push(headers.join(","));
			
			for each (var record:XML in data) {
				var values:Array = new Array();
				for each (var field:XML in record.*) {
					var value:String = field.toString();
					// Escape quotes and wrap in quotes if contains delimiter
					if (value.indexOf(",") != -1 || value.indexOf('"') != -1) {
						value = '"' + value.replace('"', '""') + '"';
					}
					values.push(value);
				}
				lines.push(values.join(","));
			}
			
			return lines.join("\n");
		}
		
		private static function exportToJSON(data:Array):String {
			var records:Array = new Array();
			
			for each (var record:XML in data) {
				var obj:Object = new Object();
				for each (var field:XML in record.*) {
					obj[field.name().toString()] = field.toString();
				}
				records.push(obj);
			}
			
			return JSON.stringify(records, null, 2);
		}
		
		private static function exportToXML(data:Array):String {
			var xml:XML = <data></data>;
			
			for each (var record:XML in data) {
				var recordXml:XML = <record></record>;
				for each (var field:XML in record.*) {
					recordXml.appendChild(field);
				}
				xml.appendChild(recordXml);
			}
			
			return xml.toXMLString();
		}
	}
}
