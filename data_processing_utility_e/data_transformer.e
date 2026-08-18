"import org.e.lang.Console
import org.e.lang.String
import org.e.lang.List

\"\"\"\nDataTransformer module for handling data transformation.\nSupports basic transformations like uppercasing names.\n\"\"\"\n

public class DataTransformer {

    \"\"\"\nTransforms a list of data records based on the specified transformation.\n\n@param data The list of data records to transform.\n@param transformation The type of transformation to apply (e.g., 'uppercase_name').\n@return A list of transformed data records.\n\"\"\"\n    public static List<String> transform(List<String> data, String transformation) {
        List<String> transformedData = new List<String>()
        switch (transformation) {
            case \"uppercase_name\":
                transformedData = uppercaseNames(data)
                break
            case \"filter_by_age\":
                transformedData = filterByAge(data, 30)
                break
            default:
                Console.println(\"Unknown transformation: \" + transformation)
                transformedData = data
                break
        }
        return transformedData
    }

    private static List<String> uppercaseNames(List<String> data) {
        List<String> result = new List<String>()
        for (String record : data) {
            // Simple string manipulation for demonstration
            String transformed = record.replace(\"\\\"name\\\": \\\"\", \"\\\"name\\\": \\\"\").toUpperCase()
            result.add(transformed)
        }
        return result
    }

    private static List<String> filterByAge(List<String> data, Integer minAge) {
        List<String> result = new List<String>()
        for (String record : data) {
            // Extract age from JSON string for filtering
            Integer age = extractAge(record)
            if (age != null && age >= minAge) {
                result.add(record)
            }
        }
        return result
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
