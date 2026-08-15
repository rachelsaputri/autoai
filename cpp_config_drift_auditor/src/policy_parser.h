#ifndef POLICY_PARSER_H
#define POLICY_PARSER_H

#include <string>
#include <map>
#include <vector>
#include <stdexcept>

struct ConfigEntry {
    std::string key;
    std::string value;
    std::string section;
    std::string line_number;
};

class PolicyParser {
public:
    std::map<std::string, ConfigEntry> parse(const std::string& filepath);
private:
    std::vector<std::string> readLines(const std::string& filepath);
    ConfigEntry parseLine(const std::string& line, int line_num, std::string& current_section);
};

#endif // POLICY_PARSER_H
