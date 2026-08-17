package com.example.dataprocessing {
    public class Main {
        public static function main():void {
            var rawData:Array = [1, 2, "three", null, 4.5];
            
            var processor:DataProcessor = new DataProcessor();
            var validator:DataValidator = new DataValidator();
            var exporter:DataExporter = new DataExporter();
            
            var validatedData:Array = validator.validate(rawData);
            var processedData:Array = processor.process(validatedData);
            exporter.export(processedData, "output.json");
        }
    }
}
