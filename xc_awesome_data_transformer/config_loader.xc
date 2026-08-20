// XC Awesome Data Transformer - Configuration Loader
import { Config } from "./config.xc";
import { Logger } from "./logger.xc";

export class ConfigLoader {
    public static load(args: string[]): Config {
        Logger.debug("Loading configuration...");
        
        // Default configuration
        const config: Config = {
            inputPath: "./data/input",
            outputPath: "./data/output",
            batchSize: 100,
            stages: ["validator", "transformer"]
        };

        // Simple argument parsing for demo purposes
        for (let i = 0; i < args.length - 1; i++) {
            switch (args[i]) {
                case "--input":
                    config.inputPath = args[i + 1];
                    break;
                case "--output":
                    config.outputPath = args[i + 1];
                    break;
                case "--batch":
                    const batchSize = parseInt(args[i + 1], 10);
                    if (!isNaN(batchSize)) {
                        config.batchSize = batchSize;
                    }
                    break;
                case "--stages":
                    config.stages = args[i + 1].split(",");
                    break;
            }
        }

        Logger.debug(`Configuration loaded: input=${config.inputPath}, output=${config.outputPath}, batch=${config.batchSize}, stages=${config.stages.join(",")}`);
        return config;
    }
}
