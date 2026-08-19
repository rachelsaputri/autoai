const fs = require('fs');
const path = require('path');

class DataIngester {
  constructor(config) {
    this.config = config;
  }

  async ingest(source) {
    if (typeof source === 'string') {
      if (fs.existsSync(source)) {
        const stats = fs.statSync(source);
        if (stats.isDirectory()) {
          return this.ingestDirectory(source);
        } else {
          return this.ingestFile(source);
        }
      } else {
        try {
          const response = await fetch(source);
          const text = await response.text();
          return this.parseData(text);
        } catch (error) {
          throw new Error(`Failed to ingest from URL: ${source}`);
        }
      }
    }

    if (Array.isArray(source)) {
      return source;
    }

    throw new Error('Invalid data source. Expected file path, directory, URL, or array.');
  }

  async ingestFile(filePath) {
    const content = fs.readFileSync(filePath, 'utf-8');
    return this.parseData(content);
  }

  async ingestDirectory(dirPath) {
    const files = fs.readdirSync(dirPath);
    const allData = [];

    for (const file of files) {
      const filePath = path.join(dirPath, file);
      const stats = fs.statSync(filePath);
      if (stats.isFile()) {
        const data = await this.ingestFile(filePath);
        allData.push(...data);
      }
    }

    return allData;
  }

  parseData(content) {
    try {
      if (typeof content === 'string') {
        if (content.trim().startsWith('[') || content.trim().startsWith('{')) {
          return JSON.parse(content);
        }
      }
      return [content];
    } catch (error) {
      throw new Error(`Failed to parse data: ${error.message}`);
    }
  }

  async saveReport(report, outputPath) {
    try {
      const outputDir = path.dirname(outputPath);
      if (!fs.existsSync(outputDir)) {
        fs.mkdirSync(outputDir, { recursive: true });
      }

      const output = path.join(outputPath, 'processing_report.json');
      fs.writeFileSync(output, JSON.stringify(report, null, 2));

      if (this.config.logLevel === 'debug') {
        console.log(`Report saved to: ${output}`);
      }
    } catch (error) {
      console.error(`Failed to save report: ${error.message}`);
    }
  }
}

module.exports = { DataIngester };
