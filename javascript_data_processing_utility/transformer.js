const crypto = require('crypto');

class DataTransformer {
  constructor(config) {
    this.config = config;
    this.transformations = config.transformations || [];
  }

  async transform(data) {
    let transformedData = [...data];

    for (const transform of this.transformations) {
      if (typeof transform === 'function') {
        transformedData = transformedData.map(transform);
      }
    }

    const sanitizedData = this.sanitize(transformedData);
    const enrichedData = this.enrich(sanitizedData);

    return enrichedData;
  }

  sanitize(data) {
    return data.map(record => {
      if (typeof record === 'string') {
        return record.trim().replace(/<[^>]*>/g, '');
      }
      if (typeof record === 'object' && record !== null) {
        return this.sanitizeObject(record);
      }
      return record;
    });
  }

  sanitizeObject(obj) {
    const newObj = {};
    for (const key in obj) {
      if (obj.hasOwnProperty(key)) {
        const value = obj[key];
        if (typeof value === 'string') {
          newObj[key] = value.trim().replace(/<[^>]*>/g, '');
        } else if (typeof value === 'object' && value !== null) {
          newObj[key] = this.sanitizeObject(value);
        } else {
          newObj[key] = value;
        }
      }
    }
    return newObj;
  }

  enrich(data) {
    return data.map((record, index) => {
      const enriched = { ...record, _id: index, _processedAt: new Date().toISOString() };
      if (typeof record === 'object' && record !== null) {
        enriched._hash = crypto.createHash('sha256').update(JSON.stringify(record)).digest('hex');
      }
      return enriched;
    });
  }

  addTransformation(fn) {
    this.transformations.push(fn);
  }

  removeTransformation(fn) {
    this.transformations = this.transformations.filter(t => t !== fn);
  }
}

module.exports = { DataTransformer };
