define(`DATASET', `sample_data.csv')
divert(0)
include(`macros/ingestion.m4')
include(`macros/transformer.m4')
include(`macros/validator.m4')
include(`macros/reporter.m4')

DATA_PROCESSING_START
INGEST_DATA(`DATASET')
TRANSFORM_DATA
VALIDATE_DATA
GENERATE_REPORT
DATA_PROCESSING_END
divert
