// main.as
// Entry point for DataProcessor utility
// Demonstrates usage and provides command-line-like interface simulation

package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class main extends Sprite {
		private var results:TextField;
		
		public function main() {
			if (stage) {
				init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// Initialize results display
			results = new TextField();
			results.width = 800;
			results.height = 600;
			results.multiline = true;
			results.wordWrap = true;
			results.border = true;
			
			var format:TextFormat = new TextFormat();
			format.font = "Courier New";
			format.size = 12;
			results.defaultTextFormat = format;
			
			addChild(results);
			
			// Run sample data processing
			runSampleProcessing();
		}
		
		private function runSampleProcessing():void {
			var sampleData:String = [
				"id,name,email,age,department",
				"1,John Doe,john@example.com,30,Engineering",
				"2,Jane Smith,jane@example.com,25,Marketing",
				"3,Bob Johnson,bob@example.com,35,Sales",
				"4,Alice Williams,alice@example.com,28,Engineering",
				"5,Charlie Brown,charlie@example.com,42,HR"
			].join("\n");
			
			var config:XML = <config>
				<delimiter>,</delimiter>
				<skipHeaders>true</skipHeaders>
				<validationRule>non_empty</validationRule>
			</config>;
			
			var processed:* = DataProcessor.processData(sampleData, config);
			
			var output:String = "=== DATA PROCESSING RESULTS ===\n\n";
			output += "Records Processed: " + processed.count + "\n";
			output += "Errors Found: " + processed.errorCount + "\n\n";
			
			if (processed.errors.length > 0) {
				output += "Errors:\n";
				for each (var error:String in processed.errors) {
					output += "  - " + error + "\n";
				}
				output += "\n";
			}
			
			output += "Exported as CSV:\n" + DataProcessor.exportData(processed.data, "csv") + "\n\n";
			output += "Exported as JSON:\n" + DataProcessor.exportData(processed.data, "json") + "\n\n";
			
			results.text = output;
		}
	}
}
