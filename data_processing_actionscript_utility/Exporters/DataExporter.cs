// DataExporter.cs
// C# cross-reference for DataExporter (not compiled)
// Included for documentation purposes

using System;
using System.IO;
using System.Xml;
using System.Text;
using System.Collections.Generic;

public class DataExporter {
	public static string ExportCSV(List<XmlNode> records) {
		StringBuilder sb = new StringBuilder();
		foreach (XmlNode record in records) {
			StringBuilder line = new StringBuilder();
			foreach (XmlNode field in record.ChildNodes) {
				if (line.Length > 0) line.Append(",");
				line.Append(EscapeCSV(field.InnerText));
			}
			sb.AppendLine(line.ToString());
		}
		return sb.ToString();
	}
	
	private static string EscapeCSV(string value) {
		if (value.Contains(",") || value.Contains('"') || value.Contains("\n")) {
			return '"' + value.Replace('"', '""') + '"';
		}
		return value;
	}
}
