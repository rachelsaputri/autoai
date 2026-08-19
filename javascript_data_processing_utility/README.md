# JavaScript Data Processing Utility

A comprehensive, production-ready data processing utility written in JavaScript. This tool provides end-to-end data ingestion, validation, transformation, and reporting capabilities.

## Features

- **Data Ingestion**: Read from files, directories, URLs, or inline data
- **Validation**: Strict validation with configurable rules
- **Transformation**: Sanitization, enrichment, and custom transformations
- **Reporting**: Detailed statistics, quality scoring, and JSON reports
- **Modular Architecture**: Pluggable components for easy customization

## Installation

No external dependencies required. Uses Node.js built-in modules only.

```bash
node main.js
```

## Usage

### Basic Usage

```javascript
const { DataProcessingEngine } = require('./main');

const engine = new DataProcessingEngine({
  inputPath: './data/input',
  outputPath: './data/output',
  logLevel: 'info',
  batchSize: 1000
});

engine.execute().then(summary => {
  console.log(summary);
}).catch(err => {
  console.error(err);
});
```

### With Custom Data

```javascript
const engine = new DataProcessingEngine();

const customData = [
  { name: 'John', age: 30 },
  { name: 'Jane', age: 25 }
];

engine.execute(customData).then(summary => {
  console.log(summary);
});
```

### Custom Validation Rules

```javascript
const engine = new DataProcessingEngine({
  validationRules: {
    minLength: 5,
    maxLength: 100,
    customValidators: [
      record => typeof record.name === 'string' && record.name.length > 0
    ]
  }
});
```

## Configuration Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| inputPath | string | './input_data' | Path to input file or directory |
| outputPath | string | './output_data' | Path to save processing report |
| logLevel | string | 'info' | Logging verbosity level |
| batchSize | number | 1000 | Batch size for processing |
| validationRules | object | see defaults | Custom validation rules |
| transformations | array | [] | Custom transformation functions |

## File Structure

```
javascript_data_processing_utility/
├── main.js          # Main engine and pipeline orchestration
├── validator.js     # Data validation logic
├── transformer.js   # Data transformation and sanitization
├── reporter.js      # Statistics and quality scoring
├── ingester.js      # Data ingestion and file handling
└── README.md        # This file
```

## License

MIT
