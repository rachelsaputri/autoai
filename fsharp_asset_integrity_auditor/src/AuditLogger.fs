namespace AssetIntegrityAuditor

open System
open System.IO
open System.Text.Json
open System.Xml.Linq

module AuditLogger =

    type AuditEntry = {
        Timestamp: DateTime
        AssetPath: string
        Hash: string
        AlertLevel: string
        Message: string
    }

    let toJson (entry: AuditEntry) : string =
        JsonSerializer.Serialize(entry)

    let toJsonList (entries: AuditEntry list) : string =
        JsonSerializer.Serialize(entries)

    let saveToXml (path: string) (entries: AuditEntry list) =
        let doc = XDocument(
            XElement("AuditTrail",
                List.map (fun entry ->
                    XElement("Entry",
                        XAttribute("Timestamp", entry.Timestamp),
                        XAttribute("AssetPath", entry.AssetPath),
                        XAttribute("Hash", entry.Hash),
                        XAttribute("AlertLevel", entry.AlertLevel),
                        XAttribute("Message", entry.Message)
                    )
                ) entries
            )
        )
        doc.Save(path)

    let saveToJson (path: string) (entries: AuditEntry list) =
        let json = toJsonList entries
        File.WriteAllText(path, json)

    let logToConsole (entry: AuditEntry) =
        Console.WriteLine($"[{entry.Timestamp}] {entry.AssetPath}: {entry.AlertLevel} - {entry.Message}")
