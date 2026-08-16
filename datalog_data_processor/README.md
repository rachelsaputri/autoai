# Datalog Data Processor

A fully functional data processing utility written in Datalog. This tool is designed to parse, transform, and analyze structured data logs using declarative logic rules.

## Features

- **Log Parsing**: Extracts structured fields from semi-structured log lines.
- **Transformation**: Applies business logic to normalize and enrich data.
- **Aggregation**: Calculates metrics and summaries based on defined rules.
- **Validation**: Checks data integrity against predefined schemas.

## Usage

1. Ensure you have a Datalog engine installed (e.g., Datasketches, Souffle, or Datalog++).
2. Place your data file (`data.csv`) in the same directory.
3. Run the processor:

   ```bash
   souffle -f rules.dl data.csv
   ```

## Files

- `rules.dl`: Main Datalog script containing all logic.
- `data.csv`: Sample input data.
- `README.md`: This file.

## Example Input (`data.csv`)

```
timestamp,user_id,action,status
2023-10-01T10:00:00Z,user_1,login,success
2023-10-01T10:05:00Z,user_2,upload,failure
2023-10-01T10:10:00Z,user_1,download,success
```

## Example Output

The tool will generate inferred facts such as:

- `parsed_log(Timestamp, User, Action, Status)`
- `error_count(User, Count)`
- `high_risk_user(User)`

## License

MIT License
