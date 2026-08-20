// XC Awesome Data Transformer - Transformer Stage
import { DataRecord, Config } from "../pipeline.xc";
import { Logger } from "../logger.xc";

export class TransformStage {
    private config: Config;

    constructor(config: Config) {
        this.config = config;
    }

    public getName(): string {
        return "transformer";
    }

    public process(records: Array<DataRecord>): Array<DataRecord> {
        Logger.info("Transforming records...");
        const transformedRecords: Array<DataRecord> = [];
        for (const record of records) {
            transformedRecords.push(this.transformRecord(record));
        }
        Logger.info("Transformation complete.");
        return transformedRecords;
    }

    private transformRecord(record: DataRecord): DataRecord {
        // Example transformation: uppercase payload
        const transformedRecord: DataRecord = {
            ...record,
            payload: record.payload.toUpperCase(),
            metadata: new Map<string, string>(record.metadata.entries())
        };
        transformedRecord.metadata.set("transformed", "true");
        return transformedRecord;
    }
}
