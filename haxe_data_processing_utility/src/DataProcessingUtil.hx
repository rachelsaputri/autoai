import sys.io.Process;
import sys.io.File;
import haxe.Json;
import haxe.io.Path;
import haxe.macro.Expr;

class DataProcessingUtil {

    public static function main() {
        var args = Sys.args();
        if (args.length == 0) {
            printUsage();
            Sys.exit(1);
        }

        var command = args[0];
        var subArgs = args.slice(1);

        switch (command) {
            case "validate":
                validateJSON(subArgs);
            case "clean":
                cleanCSV(subArgs);
            case "transform":
                transformJSON(subArgs);
            case "export":
                exportJSON(subArgs);
            default:
                printUsage();
        }
    }

    static function printUsage() {
        Sys.println("Usage: DataProcessingUtil <command> [args]");
        Sys.println("Commands:");
        Sys.println("  validate <json_file>");
        Sys.println("  clean <csv_file> [--delimiter=<char>] [--trim]");
        Sys.println("  transform <json_file> <output_file>");
        Sys.println("  export <json_file> <output_csv>");
    }

    static function validateJSON(args:Array<String>) {
        if (args.length < 1) {
            Sys.println("Error: JSON file path required.");
            Sys.exit(1);
        }
        var file = args[0];
        try {
            var content = File.getContent(file);
            Json.parse(content);
            Sys.println("Validation successful: " + file);
        } catch (e : Dynamic) {
            Sys.println("Validation failed: " + Std.string(e));
            Sys.exit(1);
        }
    }

    static function cleanCSV(args:Array<String>) {
        if (args.length < 1) {
            Sys.println("Error: CSV file path required.");
            Sys.exit(1);
        }
        var file = args[0];
        var delimiter = ',';
        var trim = false;

        for (i in 1...args.length) {
            var arg = args[i];
            if (arg.startsWith("--delimiter=")) {
                delimiter = arg.substring(12).charAt(0);
            } else if (arg == "--trim") {
                trim = true;
            }
        }

        try {
            var lines = File.read(file).readAll();
            var content = lines.toString();
            var csvLines = content.split("\n");
            var cleanedLines = [];

            for (line in csvLines) {
                if (trim) {
                    line = line.trim();
                }
                if (line.length > 0) {
                    cleanedLines.push(line);
                }
            }

            File.saveContent(file, cleanedLines.join("\n"));
            Sys.println("CSV cleaned successfully: " + file);
        } catch (e : Dynamic) {
            Sys.println("Error cleaning CSV: " + Std.string(e));
            Sys.exit(1);
        }
    }

    static function transformJSON(args:Array<String>) {
        if (args.length < 2) {
            Sys.println("Error: Input and output JSON file paths required.");
            Sys.exit(1);
        }
        var inputFile = args[0];
        var outputFile = args[1];

        try {
            var content = File.getContent(inputFile);
            var data = Json.parse(content);

            // Basic transformation: normalize all string values to lowercase
            function normalize(obj:Dynamic):Dynamic {
                if (obj is String) {
                    return obj.toLowerCase();
                } else if (obj is Array) {
                    return [for (item in obj) normalize(item)];
                } else if (obj != null && Type.typeof(obj) == Type.TObject) {
                    var newObj = {};
                    for (key in Reflect.fields(obj)) {
                        Reflect.setField(newObj, key, normalize(Reflect.field(obj, key)));
                    }
                    return newObj;
                }
                return obj;
            }

            var transformed = normalize(data);
            File.saveContent(outputFile, Json.stringify(transformed, "  "));
            Sys.println("Transformed and saved to: " + outputFile);
        } catch (e : Dynamic) {
            Sys.println("Error transforming JSON: " + Std.string(e));
            Sys.exit(1);
        }
    }

    static function exportJSON(args:Array<String>) {
        if (args.length < 2) {
            Sys.println("Error: Input JSON file and output CSV path required.");
            Sys.exit(1);
        }
        var inputFile = args[0];
        var outputFile = args[1];

        try {
            var content = File.getContent(inputFile);
            var data:Dynamic = Json.parse(content);

            var lines = [];
            var headers = [];

            if (data is Array) {
                var arr:Array<Dynamic> = data;
                for (item in arr) {
                    if (headers.length == 0) {
                        for (key in Reflect.fields(item)) {
                            headers.push(key);
                        }
                    }
                    var row = [];
                    for (key in headers) {
                        var val = Reflect.field(item, key);
                        if (val == null) val = "";
                        if (val is String && (val.indexOf(",") != -1 || val.indexOf("\"") != -1)) {
                            val = '"' + val.replace('"', '""') + '"';
                        }
                        row.push(Std.string(val));
                    }
                    lines.push(row.join(","));
                }
            } else if (data != null && Type.typeof(data) == Type.TObject) {
                var obj:Dynamic = data;
                for (key in Reflect.fields(obj)) {
                    headers.push(key);
                    var val = Reflect.field(obj, key);
                    if (val == null) val = "";
                    if (val is String && (val.indexOf(",") != -1 || val.indexOf("\"") != -1)) {
                        val = '"' + val.replace('"', '""') + '"';
                    }
                    lines.push(Std.string(val));
                }
            }

            File.saveContent(outputFile, headers.join(",") + "\n" + lines.join("\n"));
            Sys.println("Exported JSON to CSV: " + outputFile);
        } catch (e : Dynamic) {
            Sys.println("Error exporting JSON: " + Std.string(e));
            Sys.exit(1);
        }
    }
}
