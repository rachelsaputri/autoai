mod parser;
mod validator;
mod transformer;
mod reporter;

use std::fs;
use std::io::Read;

fn main() {
    let mut input = String::new();
    fs::File::open("input.csv")
        .expect("Failed to open input.csv")
        .read_to_string(&mut input)
        .expect("Failed to read input.csv");

    let records = parser::parse(input);
    let valid = validator::validate(records);
    let transformed = transformer::transform(valid);
    reporter::generate_report(&transformed);

    println!("Processing complete.");
}
