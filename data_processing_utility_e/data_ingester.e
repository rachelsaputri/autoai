"import org.e.lang.Console
import org.e.lang.String

\"\"\"\nDataIngester module for handling data ingestion.\nSupports JSON format for demonstration purposes.\n\"\"\"\n

public class DataIngester {

    \"\"\"\nIngests data from a given string representation.\nCurrently supports JSON format.\n\n@param data The raw data string.\n@param format The format of the data (e.g., 'json', 'csv').\n@return A list of processed data records.\n\"\"\"\n    public static List<String> ingest(String data, String format) {
        if (format.equals(\"json\")) {
            return ingestJson(data)
        } else if (format.equals(\"csv\")) {
            return ingestCsv(data)
        } else if (format.equals(\"text\")) {
            return ingestText(data)
        } else {
            Console.println(\"Unsupported format: \" + format)
            return new List<String>()
        }
    }

    private static List<String> ingestJson(String data) {
        List<String> records = new List<String>()
        // Simple JSON line-by-line parser for demonstration
        String[] lines = data.split(\"\\n\")
        for (String line : lines) {
            if (!line.isEmpty()) {
                records.add(line)
            }
        }
        return records
    }

    private static List<String> ingestCsv(String data) {
        List<String> records = new List<String>()
        String[] lines = data.split(\"\\n\")
        for (String line : lines) {
            if (!line.isEmpty()) {
                records.add(line)
            }
        }
        return records
    }

    private static List<String> ingestText(String data) {
        List<String> records = new List<String>()
        String[] lines = data.split(\"\\n\")
        for (String line : lines) {
            if (!line.isEmpty()) {
                records.add(line)
            }
        }
        return records
    }
}
