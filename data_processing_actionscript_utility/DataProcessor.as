package com.example.dataprocessing {
    public class DataProcessor {
        private var rules:Array;
        
        public function DataProcessor() {
            rules = [];
        }
        
        public function addRule(rule:Object):void {
            rules.push(rule);
        }
        
        public function removeRule(rule:Object):void {
            var index:int = rules.indexOf(rule);
            if (index != -1) {
                rules.splice(index, 1);
            }
        }
        
        public function process(data:Array):Array {
            var processedData:Array = [];
            for each (var item:Object in data) {
                var processedItem:Object = item;
                for each (var rule:Object in rules) {
                    if (rule.type == "transform") {
                        processedItem = transformItem(processedItem, rule);
                    } else if (rule.type == "filter") {
                        if (!filterItem(processedItem, rule)) {
                            processedItem = null;
                            break;
                        }
                    }
                }
                if (processedItem != null) {
                    processedData.push(processedItem);
                }
            }
            return processedData;
        }
        
        private function transformItem(item:Object, rule:Object):Object {
            if (rule.field && item[rule.field] != undefined) {
                if (rule.operation == "uppercase") {
                    if (item[rule.field] is String) {
                        item[rule.field] = item[rule.field].toUpperCase();
                    }
                } else if (rule.operation == "lowercase") {
                    if (item[rule.field] is String) {
                        item[rule.field] = item[rule.field].toLowerCase();
                    }
                } else if (rule.operation == "trim") {
                    if (item[rule.field] is String) {
                        item[rule.field] = item[rule.field].replace(/^\\s+|\\s+$/g, "");
                    }
                } else if (rule.operation == "round") {
                    if (item[rule.field] is Number) {
                        item[rule.field] = Math.round(item[rule.field] * rule.precision) / rule.precision;
                    }
                }
            }
            return item;
        }
        
        private function filterItem(item:Object, rule:Object):Boolean {
            if (rule.field && item[rule.field] != undefined) {
                if (rule.condition == "equals") {
                    return item[rule.field] == rule.value;
                } else if (rule.condition == "greater_than") {
                    return item[rule.field] > rule.value;
                } else if (rule.condition == "less_than") {
                    return item[rule.field] < rule.value;
                } else if (rule.condition == "contains") {
                    if (item[rule.field] is String) {
                        return item[rule.field].indexOf(rule.value) != -1;
                    }
                } else if (rule.condition == "not_null") {
                    return item[rule.field] != null;
                }
            }
            return true;
        }
    }
}
