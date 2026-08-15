class
    COMPLIANCE_REPORTER
create
    make, generate_html_report, generate_pdf_report
feature
    -- Initialization
    make(a_pipeline_data: HASH_TABLE[STRING, STRING])
        do
            pipeline_data := a_pipeline_data
            create html_reporter
            create pdf_reporter
        end

    -- Report Generation
    generate_html_report(a_output_path: STRING)
        local
            template, content: STRING
        do
            template := load_html_template
            content := build_report_content
            html_reporter.write_file(template, a_output_path)
        end

    generate_pdf_report(a_output_path: STRING)
        local
            template: STRING
        do
            template := load_pdf_template
            -- PDF generation logic would use a library like GTK-PDF or external tool
            -- For this example, we assume a placeholder method
            pdf_reporter.write_file(template, a_output_path)
        end

feature
    -- Internal Attributes
    pipeline_data: HASH_TABLE[STRING, STRING]
    html_reporter: HTML_REPORTER
    pdf_reporter: PDF_REPORTER

    -- Data Processing
    build_report_content: STRING
        local
            drifts, critical_count: INTEGER
            diff: STRING
        do
            result := "<h1>Compliance Audit Report</h1>"
            result := result + "<h2>Drift Summary</h2>"
            drifts := pipeline_data.count
            critical_count := 0
            across pipeline_data as cell loop
                if cell.item.includes("critical") then
                    critical_count := critical_count + 1
                    diff := cell.key + ": " + cell.item
                    result := result + "<p style='color: red;'>" + diff + "</p>"
                else
                    diff := cell.key + ": " + cell.item
                    result := result + "<p>" + diff + "</p>"
                end
            end
            result := result + "<h2>Metric</h2>"
            result := result + "<p>Total Drifts: " + drifts.out + "</p>"
            result := result + "<p>Critical Issues: " + critical_count.out + "</p>"
        end

    load_html_template: STRING
        do
            result := ""
            -- Load actual template from file or embed
        end

    load_pdf_template: STRING
        do
            result := ""
            -- Load actual PDF template from file or embed
        end

end

class
    HTML_REPORTER
feature
    write_file(a_template, a_path: STRING)
        do
            -- Implement file writing logic
        end
end

class
    PDF_REPORTER
feature
    write_file(a_template, a_path: STRING)
        do
            -- Implement PDF file writing logic
        end
end
