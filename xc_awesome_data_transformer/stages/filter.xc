// XC Awesome Data Transformer - Filter Stage
import { DataRecord, Config } from "../pipeline.xc";
import { Logger } from "../logger.xc";

export class FilterStage {
    private config: Config;

    constructor(config: Config) {
        this.config = config;
    }

    public getName(): string {
        return "filter";
    }

    public process(records: Array<DataRecord>): Array<DataRecord> {
        Logger.info("Filtering records...");
        const filteredRecords: Array<DataRecord> = [];
        for (const record of records) {
            if (this.filterRecord(record)) {
                filteredRecords.push(record);
            }
        }
        Logger.info(`Filter complete. ${filteredRecords.length} records remaining.`);
        return filteredRecords;
    }

    private filterRecord(record: DataRecord): boolean {
        // Example filter: only keep records with 'A' in payload
        return record.payload.includes('A') || record.payload.includes('a');
    }
}
