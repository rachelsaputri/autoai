class DataValidator {
  constructor(config) {
    this.config = config;
    this.validationRules = config.validationRules || {
      minLength: 1,
      maxLength: 10000,
      allowedTypes: ['string', 'number', 'object', 'array', 'boolean'],
      customValidators: []
    };
  }

  async validate(data) {
    if (!data) {
      throw new Error('Input data is empty or undefined');
    }

    const dataArray = Array.isArray(data) ? data : [data];
    const validRecords = [];
    const invalidRecords = [];

    for (const record of dataArray) {
      if (this.isValid(record)) {
        validRecords.push(record);
      } else {
        invalidRecords.push({
          record,
          reason: 'Validation failed'
        });
      }
    }

    const validData = validRecords;
    if (invalidRecords.length > 0 && this.config.logLevel === 'debug') {
      console.warn(`${invalidRecords.length} records failed validation`);
    }

    return validData;
  }

  isValid(record) {
    if (record === null || record === undefined) {
      return false;
    }

    const type = typeof record;
    if (!this.validationRules.allowedTypes.includes(type)) {
      return false;
    }

    if (type === 'string') {
      if (record.length < this.validationRules.minLength) {
        return false;
      }
      if (record.length > this.validationRules.maxLength) {
        return false;
      }
    }

    if (type === 'object' || type === 'array') {
      if (JSON.stringify(record).length > this.validationRules.maxLength) {
        return false;
      }
    }

    for (const validator of this.validationRules.customValidators) {
      if (!validator(record)) {
        return false;
      }
    }

    return true;
  }

  addRule(rule) {
    this.validationRules.customValidators.push(rule);
  }

  removeRule(ruleFn) {
    this.validationRules.customValidators = this.validationRules.customValidators.filter(v => v !== ruleFn);
  }
}

module.exports = { DataValidator };
