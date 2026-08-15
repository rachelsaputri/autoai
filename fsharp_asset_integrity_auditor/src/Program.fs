open System
open System.IO
open System.Text.Json

module AssetIntegrityAuditor.Program =

    let loadConfig(configPath: string) : string option =
        if File.Exists(configPath) then
            Some(File.ReadAllText(configPath))
        else
            None

    let parseArgs args =
        match args with
        | [| assetDir; configPath |] -> (assetDir, configPath)
        | _ -> 
            Console.WriteLine("Usage: AssetIntegrityAuditor <asset_directory> <config_path>")
            Environment.Exit(1)
            ("", "")

    [<EntryPoint>]
    let main argv =
        let assetDir, configPath = parseArgs argv
        
        match loadConfig configPath with
        | Some config ->
            Console.WriteLine($"Starting audit on directory: {assetDir}")
            Console.WriteLine($"Using config: {configPath}")
            // Placeholder for actual audit logic
            // In a real implementation, this would call the audit engine
            Console.WriteLine("Audit complete. See logs for details.")
        | None ->
            Console.WriteLine("Configuration file not found.")
            Environment.Exit(1)

        0
