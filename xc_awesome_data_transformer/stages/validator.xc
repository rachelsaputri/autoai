// XC Awesome Data Transformer - Validator Stage
import { DataRecord, Config } from "../pipeline.xc";
import { Logger } from "../logger.xc";

export class ValidatorStage {
    private config: Config;

    constructor(config: Config) {
        this.config = config;
    }

    public getName(): string {
        return "validator";
    }

    public process(records: Array<DataRecord>): Array<DataRecord> {
        Logger.info("Validating records...");
        const validRecords: Array<DataRecord> = [];
        for (const record of records) {
            if (this.validateRecord(record)) {
                validRecords.push(record);
            } else {
                Logger.warn(`Record ID ${record.id} failed validation.`);
            }
        }
        Logger.info(`Validation complete. ${validRecords.length} records passed.`);
        return validRecords;
    }

    private validateRecord(record: DataRecord): boolean {
        if (!record.id) {
            return false;
        }
        if (!record.payload) {
            return false;
        }
        return true;
    }
}
