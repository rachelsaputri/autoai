class DataReporter {
  constructor(config) {
    this.config = config;
    this.metrics = {
      totalRecords: 0,
      validRecords: 0,
      invalidRecords: 0,
      processingTime: 0,
      transformations: 0,
      anomalies: 0
    };
  }

  async generateReport(data) {
    this.metrics.totalRecords = data.length;
    this.metrics.validRecords = data.length;
    this.metrics.processingTime = this.config.processingTime || 0;

    const summary = {
      generatedAt: new Date().toISOString(),
      metrics: this.metrics,
      dataPreview: data.slice(0, 10),
      statistics: this.calculateStatistics(data),
      qualityScore: this.calculateQualityScore(data)
    };

    if (this.config.logLevel === 'debug') {
      console.log('Report Generated');
    }

    return summary;
  }

  calculateStatistics(data) {
    const stats = {
      types: {},
      lengthDistribution: {},
      numericStats: {
        min: Infinity,
        max: -Infinity,
        avg: 0,
        sum: 0
      }
    };

    data.forEach(record => {
      const type = typeof record;
      stats.types[type] = (stats.types[type] || 0) + 1;

      if (typeof record === 'string') {
        const len = record.length;
        stats.lengthDistribution[len] = (stats.lengthDistribution[len] || 0) + 1;
      }

      if (typeof record === 'number') {
        stats.numericStats.min = Math.min(stats.numericStats.min, record);
        stats.numericStats.max = Math.max(stats.numericStats.max, record);
        stats.numericStats.sum += record;
      }
    });

    if (data.length > 0) {
      const numericValues = data.filter(d => typeof d === 'number');
      if (numericValues.length > 0) {
        stats.numericStats.avg = stats.numericStats.sum / numericValues.length;
      }
    }

    return stats;
  }

  calculateQualityScore(data) {
    if (data.length === 0) return 0;

    const nullCount = data.filter(d => d === null || d === undefined).length;
    const emptyCount = data.filter(d => typeof d === 'string' && d.trim() === '').length;

    const qualityScore = 1 - (nullCount + emptyCount) / data.length;
    return Math.max(0, Math.min(1, qualityScore));
  }

  getMetrics() {
    return this.metrics;
  }
}

module.exports = { DataReporter };
