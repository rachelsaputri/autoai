using System;
using System.Collections;
using System.IO;
using System.Text;

namespace JshDataProcessor
{
    public class Record
    {
        public Hashtable Columns;

        public Record(Hashtable columns)
        {
            Columns = columns;
        }

        public string GetFieldValue(string fieldName)
        {
            if (Columns.ContainsKey(fieldName))
            {
                return Columns[fieldName].ToString();
            }
            return string.Empty;
        }
    }

    public class DataProcessor
    {
        private string _filePath;

        public DataProcessor(string filePath)
        {
            _filePath = filePath;
        }

        public ArrayList LoadData()
        {
            ArrayList records = new ArrayList();
            if (!File.Exists(_filePath))
            {
                throw new FileNotFoundException("Data file not found: " + _filePath);
            }

            string[] lines = File.ReadAllLines(_filePath);
            if (lines.Length == 0)
            {
                return records;
            }

            string[] headers = ParseCsvLine(lines[0]);
            for (int i = 1; i < lines.Length; i++)
            {
                if (string.IsNullOrWhiteSpace(lines[i])) continue;
                string[] values = ParseCsvLine(lines[i]);
                Hashtable rowMap = new Hashtable();
                for (int j = 0; j < headers.Length; j++)
                {
                    string value = (j < values.Length) ? values[j] : "";
                    rowMap[headers[j].Trim()] = value.Trim();
                }
                records.Add(new Record(rowMap));
            }
            return records;
        }

        public void SaveData(ArrayList records, string outputPath)
        {
            if (records.Count == 0) return;

            using (StreamWriter writer = new StreamWriter(outputPath, false, Encoding.UTF8))
            {
                Record firstRecord = (Record)records[0];
                string[] headers = (string[])firstRecord.Columns.Keys.Clone();
                writer.WriteLine(string.Join(",", headers));

                foreach (Record record in records)
                {
                    List<string> rowValues = new List<string>();
                    foreach (string header in headers)
                    {
                        string val = record.GetFieldValue(header);
                        if (val.Contains(",") || val.Contains("\""))
                        {
                            val = "\"" + val.Replace("\"", "\"\"") + "\"";
                        }
                        rowValues.Add(val);
                    }
                    writer.WriteLine(string.Join(",", rowValues));
                }
            }
        }

        private string[] ParseCsvLine(string line)
        {
            List<string> fields = new List<string>();
            StringBuilder currentField = new StringBuilder();
            bool inQuotes = false;

            for (int i = 0; i < line.Length; i++)
            {
                char c = line[i];
                if (c == '"')
                {
                    if (inQuotes && i + 1 < line.Length && line[i + 1] == '"')
                    {
                        currentField.Append('"');
                        i++;
                    }
                    else
                    {
                        inQuotes = !inQuotes;
                    }
                }
                else if (c == ',' && !inQuotes)
                {
                    fields.Add(currentField.ToString());
                    currentField.Clear();
                }
                else
                {
                    currentField.Append(c);
                }
            }
            fields.Add(currentField.ToString());
            return fields.ToArray();
        }

        public static double ParseDoubleOrNull(string value)
        {
            double result;
            if (double.TryParse(value, out result))
            {
                return result;
            }
            return double.NaN;
        }
    }
}
