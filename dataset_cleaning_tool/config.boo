import System
import System.IO
import System.Text.RegularExpressions

class ConfigManager:
    private _inputFile as string = ""
    private _configFile as string = ""
    private _outputDir as string = "output"
    private _verbose as bool = false
    private _batchSize as int = 1000

    def InputFile:
        get: return _inputFile
    
    def ConfigFile:
        get: return _configFile
    
    def OutputDir:
        get: return _outputDir

    def Verbose:
        get: return _verbose

    def BatchSize:
        get: return _batchSize

    def ParseArgs(args as array of string) as bool:
        if args.Length < 2:
            return false

        i as int = 0
        while i < args.Length:
            if args[i] == "--input":
                if i + 1 < args.Length:
                    _inputFile = args[i + 1]
                    i += 2
                else:
                    return false
            elif args[i] == "--config":
                if i + 1 < args.Length:
                    _configFile = args[i + 1]
                    i += 2
                else:
                    return false
            elif args[i] == "--output":
                if i + 1 < args.Length:
                    _outputDir = args[i + 1]
                    i += 2
                else:
                    return false
            elif args[i] == "--verbose":
                _verbose = true
                i += 1
            elif args[i] == "--batch-size":
                if i + 1 < args.Length:
                    _batchSize = int.Parse(args[i + 1])
                    i += 2
                else:
                    return false
            else:
                i += 1

        return not string.IsNullOrEmpty(_inputFile) and not string.IsNullOrEmpty(_configFile)

    def LoadPipelineSteps() as array of string:
        steps as array of string = ["whitespace_normalizer", "character_cleaner", "type_validator", "schema_enforcer"]
        if File.Exists(_configFile):
            lines as array of string = File.ReadAllLines(_configFile)
            steps = lines
        return steps
