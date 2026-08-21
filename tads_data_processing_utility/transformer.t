// transformer.t
// Data Transformation Module

class DataTransformer
    init
    {
        transform(dataSet)
        {
            local transformed = [];
            for (local item in dataSet) {
                transformed.append({
                    id: item.id,
                    value: item.value.toUpperCase(),
                    processed: true,
                    timestamp: "NOW"
                });
            }
            return transformed;
        }
    }

global transformer = new DataTransformer();
