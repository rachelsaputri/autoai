"import org.e.lang.Console
import org.e.lang.String
import org.e.lang.List

\"\"\"\nDataValidator module for handling data validation.\nSupports basic validation like checking for required fields.\n\"\"\"\n

public class DataValidator {

    \"\"\"\nValidates a list of data records based on the specified validation rule.\n\n@param data The list of data records to validate.\n@param validationRule The type of validation to apply (e.g., 'required_fields').\n@return True if validation passes, false otherwise.\n\"\"\"\n    public static Boolean validate(List<String> data, String validationRule) {
        switch (validationRule) {
            case \"required_fields\":
                return checkRequiredFields(data)
            case \"type_check\":
                return checkDataTypes(data)
            default:
                Console.println(\"Unknown validation rule: \" + validationRule)
                return true
        }
    }

    private static Boolean checkRequiredFields(List<String> data) {
        String[] requiredFields = {\"name\", \"age\"}
        for (String record : data) {
            for (String field : requiredFields) {
                if (!record.contains(\"\\\" + field + \"\\\"\")) {
                    Console.println(\"Missing required field: \" + field + \" in record: \" + record)
                    return false
                }
            }
        }
        return true
    }

    private static Boolean checkDataTypes(List<String> data) {
        for (String record : data) {
            // Example type check for age being an integer
            Integer age = extractAge(record)
            if (age != null && (age < 0 || age > 150)) {
                Console.println(\"Invalid age value: \" + age + \" in record: \" + record)
                return false
            }
        }
        return true
    }

    private static Integer extractAge(String record) {
        // Simple parsing for demonstration
        String[] parts = record.split(\",\")
        for (String part : parts) {
            if (part.contains(\"\\\"age\\\"\")) {
                String[] ageParts = part.split(\":\")
                if (ageParts.length > 1) {
                    try {
                        return Integer.parseInt(ageParts[1].trim())
                    } catch (NumberFormatException e) {
                        Console.println(\"Invalid age format: \" + part)
                    }
                }
            }
        }
        return null
    }
}
