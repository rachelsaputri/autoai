#include "policy_parser.h"
#include <fstream>
#include <sstream>
#include <algorithm>
#include <filesystem>

namespace fs = std::filesystem;

std::map<std::string, ConfigEntry> PolicyParser::parse(const std::string& filepath) {
    std::map<std::string, ConfigEntry> config;
    auto lines = readLines(filepath);
    std::string current_section = "global";

    for (int i = 0; i < lines.size(); ++i) {
        std::string line = lines[i];
        line.erase(0, line.find_first_not_of(" \t"));
        line.erase(line.find_last_not_of(" \t") + 1);

        if (line.empty() || line[0] == '#' || line[0] == ';') {
            continue;
        }

        if (line[0] == '[' && line.back() == ']') {
            current_section = line.substr(1, line.size() - 2);
            continue;
        }

        auto entry = parseLine(line, i + 1, current_section);
        config[entry.key] = entry;
    }

    return config;
}

std::vector<std::string> PolicyParser::readLines(const std::string& filepath) {
    std::vector<std::string> lines;
    std::ifstream file(filepath);
    if (!file.is_open()) {
        throw std::runtime_error("Failed to open config file: " + filepath);
    }
    std::string line;
    while (std::getline(file, line)) {
        lines.push_back(line);
    }
    file.close();
    return lines;
}

ConfigEntry PolicyParser::parseLine(const std::string& line, int line_num, std::string& current_section) {
    ConfigEntry entry;
    auto delim_pos = line.find('=');
    if (delim_pos == std::string::npos) {
        delim_pos = line.find(':');
    }

    if (delim_pos == std::string::npos) {
        throw std::runtime_error("Invalid config line format at line " + std::to_string(line_num));
    }

    entry.key = line.substr(0, delim_pos);
    entry.key.erase(entry.key.find_last_not_of(" \t") + 1);
    entry.value = line.substr(delim_pos + 1);
    entry.value.erase(0, entry.value.find_first_not_of(" \t"));
    entry.section = current_section;
    entry.line_number = std::to_string(line_num);

    return entry;
}
