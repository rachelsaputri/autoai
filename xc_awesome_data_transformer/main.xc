// XC Awesome Data Transformer - Main Entry Point
import { DataPipeline } from "./pipeline.xc";
import { ConfigLoader } from "./config_loader.xc";
import { Logger } from "./logger.xc";

/**
 * Main function to orchestrate the data transformation process.
 * 
 * @param args Command line arguments.
 * @return Exit code: 0 for success, non-zero for failure.
 */
export function main(args: string[]): number {
    Logger.init("XC Awesome Data Transformer");
    Logger.info("Starting data transformation process...");

    const config: Config = ConfigLoader.load(args);
    if (!config.isValid()) {
        Logger.error("Configuration validation failed. Exiting.");
        return 1;
    }

    const pipeline: DataPipeline = new DataPipeline(config);
    const success: boolean = pipeline.execute();

    if (success) {
        Logger.info("Data transformation completed successfully.");
    } else {
        Logger.error("Data transformation failed. Check logs for details.");
    }

    return success ? 0 : 2;
}
