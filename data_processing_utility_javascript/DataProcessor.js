'use strict';

const DataValidator = require('./DataValidator.js');
const DataTransformer = require('./DataTransformer.js');
const DataReporter = require('./DataReporter.js');
const { DataProcessingError, ValidationError, TransformationError } = require('./DataTypes.js');

class DataProcessor {
  constructor(options = {}) {
    this.validator = new DataValidator();
    this.transformer = new DataTransformer();
    this.reporter = new DataReporter();
    this.options = {
      stopOnFirstError: options.stopOnFirstError || false,
      skipInvalidRecords: options.skipInvalidRecords || false,
      skipInvalidTransformations: options.skipInvalidTransformations || false,
      ...options
    };
  }

  /**
   * Processes data through validation, transformation, and reporting
   * @param {Array} rawData - Raw data to process
   * @param {Object} config - Processing configuration
   * @returns {Object} - Processing results
   */
  process(rawData, config = {}) {
    if (!Array.isArray(rawData)) {
      throw new DataProcessingError('Input data must be an array of records');
    }

    const {
      schema,
      transformations,
      metadata = {}
    } = config;

    const results = {
      metadata: {
        ...metadata,
        startTime: new Date().toISOString()
      },
      validation: null,
      transformation: null,
      data: null,
      errors: []
    };

    try {
      // Step 1: Validation
      if (schema) {
        this.validator.setSchema(schema);
        const validationResult = this.validator.validateRecords(rawData, schema);
        results.validation = validationResult;

        if (validationResult.summary.invalidCount > 0) {
          if (this.options.stopOnFirstError) {
            throw new ValidationError(
              `Validation failed with ${validationResult.summary.invalidCount} errors`,
              validationResult.summary.errors
            );
          }
          results.errors = results.errors.concat(
            validationResult.summary.errors.map(e => ({
              type: 'validation',
              ...e
            }))
          );
        }

        // Filter to only valid records if configured
        let processedRecords = this.options.skipInvalidRecords
          ? validationResult.valid
          : validationResult.invalid.map(inv => ({ ...inv.record, _validation_errors: inv.errors }));

        // Combine valid and invalid if not skipping
        if (!this.options.skipInvalidRecords) {
          processedRecords = [...validationResult.valid];
        }

        // Step 2: Transformation
        if (transformations && processedRecords.length > 0) {
          const transformedRecords = [];
          const transformationErrors = [];

          for (let i = 0; i < processedRecords.length; i++) {
            try {
              const transformed = this.transformer.transformRecord(processedRecords[i], transformations);
              transformedRecords.push(transformed);
            } catch (error) {
              if (this.options.stopOnFirstError) {
                throw new TransformationError(
                  `Transformation failed on record ${i}: ${error.message}`,
                  error.field,
                  error.value
                );
              }
              transformationErrors.push({ index: i, error: error.message, field: error.field });
              if (!this.options.skipInvalidTransformations) {
                transformedRecords.push({ ...processedRecords[i], _transformation_error: error.message });
              }
            }
          }

          results.transformation = {
            count: transformedRecords.length,
            errors: transformationErrors
          };
          results.errors = results.errors.concat(
            transformationErrors.map(e => ({ type: 'transformation', ...e }))
          );

          results.data = transformedRecords;
        } else {
          results.data = processedRecords;
        }
      } else {
        // No schema, just transform if transformations provided
        if (transformations) {
          const transformedRecords = [];
          const transformationErrors = [];

          for (let i = 0; i < rawData.length; i++) {
            try {
              const transformed = this.transformer.transformRecord(rawData[i], transformations);
              transformedRecords.push(transformed);
            } catch (error) {
              if (this.options.stopOnFirstError) {
                throw new TransformationError(
                  `Transformation failed on record ${i}: ${error.message}`,
                  error.field,
                  error.value
                );
              }
              transformationErrors.push({ index: i, error: error.message, field: error.field });
              transformedRecords.push({ ...rawData[i], _transformation_error: error.message });
            }
          }

          results.transformation = {
            count: transformedRecords.length,
            errors: transformationErrors
          };
          results.errors = results.errors.concat(
            transformationErrors.map(e => ({ type: 'transformation', ...e }))
          );

          results.data = transformedRecords;
        } else {
          results.data = rawData;
        }
      }

      // Set up reporter with results
      this.reporter.setData(results);
      results.report = this.reporter.generateSummaryReport();

      return results;

    } catch (error) {
      results.errors.push({
        type: 'critical',
        error: error.message,
        stack: error.stack
      });
      throw error;
    }
  }

  /**
   * Validates data against a schema
   * @param {Array} rawData - Raw data to validate
   * @param {Object} schema - Schema definition
   * @returns {Object} - Validation results
   */
  validate(rawData, schema) {
    if (!Array.isArray(rawData)) {
      throw new DataProcessingError('Input data must be an array of records');
    }

    this.validator.setSchema(schema);
    return this.validator.validateRecords(rawData, schema);
  }

  /**
   * Transforms data using transformation rules
   * @param {Array} records - Records to transform
   * @param {Array} transformations - Transformation rules
   * @returns {Array} - Transformed records
   */
  transform(records, transformations) {
    if (!Array.isArray(records)) {
      throw new DataProcessingError('Input records must be an array');
    }

    this.transformer.setTransformations(transformations);
    return this.transformer.transformRecords(records, transformations);
  }

  /**
   * Generates a report from processed data
   * @param {Object} data - Processed data
   * @returns {Object} - Report
   */
  report(data) {
    this.reporter.setData(data);
    return {
      summary: this.reporter.generateSummaryReport(),
      errors: this.reporter.generateErrorReport()
    };
  }
}

module.exports = DataProcessor;
