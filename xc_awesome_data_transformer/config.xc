// XC Awesome Data Transformer - Configuration Types and Validation
export interface Config {
    inputPath: string;
    outputPath: string;
    batchSize: number;
    stages: string[];
}

export function validateConfig(config: Config): boolean {
    if (!config.inputPath || config.inputPath.length === 0) {
        return false;
    }
    if (!config.outputPath || config.outputPath.length === 0) {
        return false;
    }
    if (config.batchSize <= 0) {
        return false;
    }
    if (!Array.isArray(config.stages) || config.stages.length === 0) {
        return false;
    }
    return true;
}
