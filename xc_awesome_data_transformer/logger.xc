// XC Awesome Data Transformer - Logger Implementation
export class Logger {
    private static instance: Logger;
    private prefix: string;

    private constructor(prefix: string) {
        this.prefix = prefix;
    }

    public static init(prefix: string): void {
        Logger.instance = new Logger(prefix);
    }

    private static getLogger(): Logger {
        if (!Logger.instance) {
            throw new Error("Logger not initialized. Call Logger.init() first.");
        }
        return Logger.instance;
    }

    public static info(message: string): void {
        this.getLogger().log("INFO", message);
    }

    public static warn(message: string): void {
        this.getLogger().log("WARN", message);
    }

    public static error(message: string): void {
        this.getLogger().log("ERROR", message);
    }

    public static debug(message: string): void {
        this.getLogger().log("DEBUG", message);
    }

    private log(level: string, message: string): void {
        const timestamp: string = new Date().toISOString();
        console.log(`[${timestamp}] [${this.prefix}] [${level}] ${message}`);
    }
}
