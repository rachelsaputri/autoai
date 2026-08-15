import System
import System.IO
import System.Collections.Generic
import dataset_cleaning_tool.config

class BatchProcessor:
    private _config as ConfigManager

    def Constructor(config as ConfigManager):
        _config = config

    def WriteResults(results as List of string, outputDir as string, filename as string):
        filepath as string = Path.Combine(outputDir, filename)
        sw as StreamWriter = StreamWriter(filepath)
        try:
            for result as string in results:
                sw.WriteLine(result)
        finally:
            sw.Close()
        
        if _config.Verbose:
            Console.WriteLine(f"Wrote {results.Count} records to {filepath}")
