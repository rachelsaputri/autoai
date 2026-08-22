module config;

struct Config {
    string input_path;
    string output_path;
    int batch_size;
    bool strict_mode;
}

function init_config() -> Config {
    Config c;
    c.input_path = "./data/";
    c.output_path = "./reports/";
    c.batch_size = 100;
    c.strict_mode = false;
    return c;
}
