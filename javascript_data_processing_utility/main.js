const fs = require('fs');
const path = require('path');
const { DataValidator } = require('./validator');
const { DataTransformer } = require('./transformer');
const { DataReporter } = require('./reporter');
const { DataIngester } = require('./ingester');

class DataProcessingEngine {
  constructor(config) {
    this.config = {
      inputPath: config.inputPath || './input_data',
      outputPath: config.outputPath || './output_data',
      logLevel: config.logLevel || 'info',
      batchSize: config.batchSize || 1000,
      ...config
    };
    this.validator = new DataValidator(this.config);
    this.transformer = new DataTransformer(this.config);
    this.reporter = new DataReporter(this.config);
    this.ingester = new DataIngester(this.config);
    this.results = {
      totalProcessed: 0,
      totalValid: 0,
      totalInvalid: 0,
      errors: [],
      processingTime: 0,
      summary: {}
    };
  }

  async execute(dataSource) {
    const startTime = Date.now();
    console.log('Data Processing Pipeline Started');

    try {
      if (dataSource) {
        const processedData = await this.processData(dataSource);
        this.results.summary = processedData;
        this.results.totalProcessed = processedData.totalRecords || 0;
        this.results.totalValid = processedData.validRecords || 0;
        this.results.totalInvalid = processedData.invalidRecords || 0;
        this.results.processingTime = Date.now() - startTime;
        console.log('Data Processing Pipeline Completed');
        return processedData;
      }

      if (this.config.inputPath) {
        const data = await this.ingester.ingest(this.config.inputPath);
        const processedData = await this.processData(data);
        this.results.summary = processedData;
        this.results.totalProcessed = processedData.totalRecords || 0;
        this.results.totalValid = processedData.validRecords || 0;
        this.results.totalInvalid = processedData.invalidRecords || 0;
        this.results.processingTime = Date.now() - startTime;
        console.log('Data Processing Pipeline Completed');
        return processedData;
      }

      throw new Error('No data source provided. Provide data directly or configure inputPath.');
    } catch (error) {
      console.error('Data Processing Pipeline Failed:', error.message);
      this.results.errors.push(error.message);
      throw error;
    }
  }

  async processData(data) {
    const validData = await this.validator.validate(data);
    const transformedData = await this.transformer.transform(validData);
    const report = await this.reporter.generateReport(transformedData);

    if (this.config.outputPath) {
      await this.ingester.saveReport(report, this.config.outputPath);
    }

    return report;
  }

  getResults() {
    return this.results;
  }
}

if (require.main === module) {
  const mainEngine = new DataProcessingEngine({
    inputPath: './input_data',
    outputPath: './output_data',
    logLevel: 'debug',
    batchSize: 500
  });

  mainEngine.execute().then((summary) => {
    console.log('Processing Summary:', summary);
    process.exit(0);
  }).catch((err) => {
    console.error('Fatal Error:', err);
    process.exit(1);
  });
}

module.exports = { DataProcessingEngine };
