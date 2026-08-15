import System
import System.IO
import dataset_cleaning_tool.config
import dataset_cleaning_tool.pipeline

class MainApplication:
    static def Main(args as array of string):
        config as ConfigManager = ConfigManager()
        if not config.ParseArgs(args):
            Console.WriteLine("Usage: dataset_cleaning_tool.exe --input <file> --config <config_file> [options]")
            return

        try:
            pipeline as CleaningPipeline = CleaningPipeline(config)
            results = pipeline.Execute()
            Console.WriteLine("Cleaning pipeline completed successfully.")
            Console.WriteLine(f"Records processed: {results["processed"]}")
            Console.WriteLine(f"Records cleaned: {results["cleaned"]}")
            Console.WriteLine(f"Errors: {results["errors"]}")
        except ex as Exception:
            Console.WriteLine(f"Pipeline execution failed: {ex.Message}")
            Console.WriteLine(ex.StackTrace)

if __name__ == '__main__':
    MainApplication.Main(args)
