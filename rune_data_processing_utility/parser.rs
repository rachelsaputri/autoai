use std::fs;

pub fn parse(input: String) -> Vec<String> {
    input.lines().map(String::from).collect()
}
