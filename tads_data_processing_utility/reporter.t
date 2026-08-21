// reporter.t
// Report Generation Module

class ReportGenerator
    init
    {
        generate(dataSet)
        {
            "\n=== Processing Report ===\n";
            "Total Records Processed: <<dataSet.length>>\n";
            for (local item in dataSet) {
                "  ID: <<item.id>> | Value: <<item.value>>\n";
            }
            "=========================\n";
        }
    }

global reporter = new ReportGenerator();
