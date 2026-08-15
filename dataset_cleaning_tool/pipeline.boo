import System
import System.IO
import System.Collections.Generic
import dataset_cleaning_tool.config
import dataset_cleaning_tool.normalizer
import dataset_cleaning_tool.validator
import dataset_cleaning_tool.batch_processor

class CleaningPipeline:
    private _config as ConfigManager
    private _normalizer as TextNormalizer
    private _validator as DataValidator
    private _batchProcessor as BatchProcessor

    def Constructor(config as ConfigManager):
        _config = config
        _normalizer = TextNormalizer()
        _validator = DataValidator()
        _batchProcessor = BatchProcessor(config)

    def Execute() as dictionary of string as object:
        if not File.Exists(_config.InputFile):
            throw Exception("Input file does not exist.")

        steps as array of string = _config.LoadPipelineSteps()
        processedCount as int = 0
        cleanedCount as int = 0
        errorCount as int = 0
        outputDir as string = _config.OutputDir
        Directory.CreateDirectory(outputDir)

        lines as array of string = File.ReadAllLines(_config.InputFile)
        results as List of string = List of string()

        for line as string in lines:
            processedCount += 1
            try:
                cleanedLine as string = _normalizer.NormalizeLine(line, steps)
                if _validator.ValidateLine(cleanedLine):
                    results.Add(cleanedLine)
                    cleanedCount += 1
                else:
                    errorCount += 1
            except ex as Exception:
                errorCount += 1
                if _config.Verbose:
                    Console.WriteLine(f"Error processing line: {ex.Message}")

        _batchProcessor.WriteResults(results, outputDir, "cleaned_data.txt")
        return {"processed": processedCount, "cleaned": cleanedCount, "errors": errorCount}
