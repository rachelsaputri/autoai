use std::fs::File;
use std::io::Write;

pub fn generate_report(transformed: &Vec<String>) {
    let mut file = File::create("output.csv").expect("Failed to create output.csv");
    for line in transformed {
        writeln!(file, "{}", line).expect("Failed to write output");
    }
}
