#include "xcore/io_float.h"
#include "xcore/channel.h"
#include "xcore/port.h"
#include "xcore/clock.h"
#include "stdio.h"
#include "string.h"

#include "data_types.xc"
#include "reporter.xc"

// Report buffer
static char report_buffer[2048];
static int report_buffer_size = 0;

// Initialize reporter
void init_reporter(void) {
    report_buffer_size = 0;
    memset(report_buffer, 0, sizeof(report_buffer));
}

// Generate reports
void generate_reports(int valid_count, int total_count) {
    // Create report string
    int len = snprintf(report_buffer, sizeof(report_buffer),
        "Report: Valid=%d, Total=%d, Timestamp=%d\n",
        valid_count, total_count, get_current_time());
    
    if (len > 0 && len < sizeof(report_buffer)) {
        report_buffer_size = len;
    }
}

// Send report to channel
void send_report(out channel c_out, char *report) {
    if (report == NULL) {
        return;
    }
    
    // Send report through channel
    c_out <: report;
}

// Print report
void print_report(void) {
    if (report_buffer_size > 0) {
        printf("%s", report_buffer);
    }
}

// Get report
char *get_report(void) {
    return report_buffer;
}

// Get current time
int get_current_time(void) {
    clock clk;
    timer t;
    t :> time_t now;
    return (int)(now / 1000); // Convert to milliseconds
}

// Process pending reports
void process_pending_reports(void) {
    if (report_buffer_size > 0) {
        // Send report to output channel
        // In a real implementation, this would be handled by the reporter task
        print_report();
    }
}

// Reporter task
void reporter_task(out channel c_out) {
    while (1) {
        // Check for pending reports
        process_pending_reports();
        
        // Small delay
        clock clk;
        timer t;
        t :> time_t now;
        clk :> time_t due;
        due = due + milliseconds_to_ticks(100);
        timer_after(clk, due);
    }
}
