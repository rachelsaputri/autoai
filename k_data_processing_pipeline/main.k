// main.k
// Main orchestration for the K Data Processing Pipeline

\require loader
\require transformer
\require aggregator
\require exporter

/\ Load data
data: loader.load "./sample_data.csv"

/\ Transform data
processed: transformer.clean data

/\ Aggregate results
summary: aggregator.group_by processed `status

/\ Export results
exporter.export_json summary

\\/ End of main.k
